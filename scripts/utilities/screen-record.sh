#!/usr/bin/env bash

################################################################################
# Screen Recording Helper
################################################################################
# Starts/stops a screen recording using `wf-recorder` (Wayland) or `ffmpeg` as
# a fallback. Saves recordings to ~/Videos by default and shows notifications.
# Usage:
#  ./screen-record.sh start [filename]
#  ./screen-record.sh stop
#  ./screen-record.sh status
################################################################################

set -euo pipefail

OUTDIR="$HOME/Videos"
PIDFILE="/tmp/screen-record.pid"
NOTIFY_CMD=$(command -v notify-send || true)

notify() { [[ -n "$NOTIFY_CMD" ]] && $NOTIFY_CMD "Screen Record" "$1" -u low; }

show_help() {
    cat <<EOF
Screen Recorder

Usage: $(basename "$0") <start|stop|status> [filename]

start [filename]  Start recording to filename (default: recording-<timestamp>.mkv)
stop              Stop the active recording
status            Show recording status
EOF
}

start_record() {
    mkdir -p "$OUTDIR"
    local fname=${1:-recording-$(date +%Y%m%d-%H%M%S).mkv}
    local path="$OUTDIR/$fname"

    if [[ -f "$PIDFILE" ]]; then
        echo "Recording already in progress (pid: $(cat $PIDFILE))" >&2
        exit 1
    fi

    if command -v wf-recorder &>/dev/null; then
        wf-recorder -f "$path" &
        echo $! > "$PIDFILE"
        notify "Recording started: $path"
        echo "Started (wf-recorder): $path"
    else
        # Try ffmpeg on X11 or with x11grab display
        if command -v ffmpeg &>/dev/null; then
            # This is a generic fallback; may need customization per system
            ffmpeg -video_size $(xdpyinfo | awk '/dimensions/{print $2}') -framerate 30 -f x11grab -i ${DISPLAY:-:0} "$path" &
            echo $! > "$PIDFILE"
            notify "Recording started: $path"
            echo "Started (ffmpeg): $path"
        else
            echo "No supported recorder found (install wf-recorder or ffmpeg)." >&2
            exit 1
        fi
    fi
}

stop_record() {
    if [[ ! -f "$PIDFILE" ]]; then
        echo "No active recording found"
        exit 1
    fi
    pid=$(cat "$PIDFILE")
    if kill "$pid" &>/dev/null; then
        rm -f "$PIDFILE"
        notify "Recording stopped"
        echo "Stopped: $pid"
    else
        echo "Failed to stop recording (pid: $pid)" >&2
        exit 1
    fi
}

status() {
    if [[ -f "$PIDFILE" ]]; then
        echo "Recording in progress (pid: $(cat $PIDFILE))"
    else
        echo "No active recording"
    fi
}

case "${1:-help}" in
    start) start_record "$2" ;;
    stop) stop_record ;;
    status) status ;;
    help) show_help ;;
    *) show_help; exit 0 ;;
esac
