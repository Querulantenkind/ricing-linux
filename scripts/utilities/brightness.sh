#!/usr/bin/env bash

################################################################################
# Brightness Control
################################################################################
# Controls screen brightness using brightnessctl, light or xbacklight where
# available.
# Usage:
#  ./brightness.sh up 5
#  ./brightness.sh down 10
#  ./brightness.sh set 50
#  ./brightness.sh get
################################################################################

set -euo pipefail

show_help() {
    cat <<EOF
Brightness Control

Usage: $(basename "$0") <command> [value]

Commands:
  up [N]    Increase brightness by N% (default 5)
  down [N]  Decrease brightness by N% (default 5)
  set N     Set brightness to N%
  get       Show current brightness
  help      Show this message
EOF
}

get_backend() {
    if command -v brightnessctl &>/dev/null; then
        echo brightnessctl
    elif command -v light &>/dev/null; then
        echo light
    elif command -v xbacklight &>/dev/null; then
        echo xbacklight
    else
        echo none
    fi
}

backend=$(get_backend)
if [[ "$backend" == none ]]; then
    echo "No brightness utility found (install brightnessctl or light or xbacklight)" >&2
    exit 1
fi

case "${1:-help}" in
    help)
        show_help
        ;;
    get)
        if [[ "$backend" == brightnessctl ]]; then
            brightnessctl g | awk '{print int($1)}'
        elif [[ "$backend" == light ]]; then
            light -G
        else
            xbacklight -get
        fi
        ;;
    up)
        delta=${2:-5}
        if [[ "$backend" == brightnessctl ]]; then
            brightnessctl set +${delta}%
        elif [[ "$backend" == light ]]; then
            light -A "$delta"
        else
            xbacklight -inc "$delta"
        fi
        ;;
    down)
        delta=${2:-5}
        if [[ "$backend" == brightnessctl ]]; then
            brightnessctl set ${delta}%-
        elif [[ "$backend" == light ]]; then
            light -U "$delta"
        else
            xbacklight -dec "$delta"
        fi
        ;;
    set)
        val=${2:-}
        if [[ -z "$val" ]]; then
            echo "Specify a value: set <percent>" >&2
            exit 1
        fi
        if [[ "$backend" == brightnessctl ]]; then
            brightnessctl set ${val}%
        elif [[ "$backend" == light ]]; then
            light -S "$val"
        else
            xbacklight -set "$val"
        fi
        ;;
    *)
        show_help
        exit 0
        ;;
esac
