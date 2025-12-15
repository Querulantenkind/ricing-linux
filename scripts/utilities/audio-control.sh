#!/usr/bin/env bash

################################################################################
# Audio Control
################################################################################
# Simple helper for volume/mute control using either `pamixer` or `pactl`.
# Features:
#  - up/down <percent>
#  - set <percent>
#  - toggle (mute/unmute)
#  - show (current volume/state)
# Example:
#   ./audio-control.sh up 5
#   ./audio-control.sh toggle
################################################################################

set -euo pipefail

NOTIFY_CMD=$(command -v notify-send || true)

show_help() {
    cat <<EOF
Audio Control

Usage: $(basename "$0") <command> [value]

Commands:
  up [N]      Increase volume by N% (default 5)
  down [N]    Decrease volume by N% (default 5)
  set N       Set volume to N%
  toggle      Mute/unmute
  show        Show current volume and mute state
  help        Show this help message
EOF
}

get_backend() {
    if command -v pamixer &>/dev/null; then
        echo pamixer
    elif command -v pactl &>/dev/null; then
        echo pactl
    else
        echo none
    fi
}

backend=$(get_backend)

if [[ "$backend" == "none" ]]; then
    echo "No supported audio backend found (install pamixer or pactl)." >&2
    exit 1
fi

notify() {
    if [[ -n "$NOTIFY_CMD" ]]; then
        $NOTIFY_CMD "Audio" "$1" -u low
    fi
}

case "${1:-help}" in
    help)
        show_help
        ;;
    show)
        if [[ "$backend" == pamixer ]]; then
            vol=$(pamixer --get-volume)
            mute=$(pamixer --get-mute)
        else
            # pactl
            default=$(pactl get-default-sink)
            vol=$(pactl get-sink-volume "$default" | awk '{print $5}' | head -n1 | tr -d '%')
            mute=$(pactl get-sink-mute "$default" | awk '{print $2}')
        fi
        echo "Volume: ${vol}%  Muted: ${mute}"
        ;;
    up)
        delta=${2:-5}
        if [[ "$backend" == pamixer ]]; then
            pamixer --increase "$delta"
            vol=$(pamixer --get-volume)
            mute=$(pamixer --get-mute)
        else
            default=$(pactl get-default-sink)
            pactl set-sink-volume "$default" +${delta}%
            vol=$(pactl get-sink-volume "$default" | awk '{print $5}' | head -n1 | tr -d '%')
            mute=$(pactl get-sink-mute "$default" | awk '{print $2}')
        fi
        notify "Volume: ${vol}%"
        ;;
    down)
        delta=${2:-5}
        if [[ "$backend" == pamixer ]]; then
            pamixer --decrease "$delta"
            vol=$(pamixer --get-volume)
            mute=$(pamixer --get-mute)
        else
            default=$(pactl get-default-sink)
            pactl set-sink-volume "$default" -${delta}%
            vol=$(pactl get-sink-volume "$default" | awk '{print $5}' | head -n1 | tr -d '%')
            mute=$(pactl get-sink-mute "$default" | awk '{print $2}')
        fi
        notify "Volume: ${vol}%"
        ;;
    set)
        val=${2:-}
        if [[ -z "$val" ]]; then
            echo "Specify a value: set <percent>" >&2
            exit 1
        fi
        if [[ "$backend" == pamixer ]]; then
            pamixer --set-volume "$val"
            vol=$(pamixer --get-volume)
        else
            default=$(pactl get-default-sink)
            pactl set-sink-volume "$default" ${val}%
            vol=$(pactl get-sink-volume "$default" | awk '{print $5}' | head -n1 | tr -d '%')
        fi
        notify "Volume set: ${vol}%"
        ;;
    toggle)
        if [[ "$backend" == pamixer ]]; then
            pamixer --toggle-mute
            mute=$(pamixer --get-mute)
        else
            default=$(pactl get-default-sink)
            pactl set-sink-mute "$default" toggle
            mute=$(pactl get-sink-mute "$default" | awk '{print $2}')
        fi
        notify "Muted: ${mute}"
        ;;
    *)
        show_help
        exit 0
        ;;
esac
