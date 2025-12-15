#!/usr/bin/env bash

################################################################################
# Screenshot Utility
################################################################################
# Supports Wayland (grim+slurp) and X11 (maim/scrot). Copies to clipboard with
# wl-copy/xclip if available. Saves to ~/Pictures/Screenshots by default.
# Usage:
#  ./screenshot.sh full
#  ./screenshot.sh region
#  ./screenshot.sh clipboard
################################################################################

set -euo pipefail

OUTDIR="$HOME/Pictures/Screenshots"
NOTIFY_CMD=$(command -v notify-send || true)
WL_COPY=$(command -v wl-copy || true)
XCLIP=$(command -v xclip || true)
GRIM=$(command -v grim || true)
SLURP=$(command -v slurp || true)
MAIM=$(command -v maim || true)
SCROT=$(command -v scrot || true)

notify() { [[ -n "$NOTIFY_CMD" ]] && $NOTIFY_CMD "Screenshot" "$1" -u low; }

show_help() {
    cat <<EOF
Screenshot helper

Usage: $(basename "$0") <full|region|clipboard>

full       Fullscreen screenshot
region     Select region (requires slurp on Wayland or interactive selection on X)
clipboard  Copy screenshot to clipboard
EOF
}

mkdir -p "$OUTDIR"

take_full() {
    local file="$OUTDIR/screenshot-$(date +%Y%m%d-%H%M%S).png"
    if [[ -n "$GRIM" ]]; then
        grim "$file"
    elif [[ -n "$MAIM" ]]; then
        maim "$file"
    elif [[ -n "$SCROT" ]]; then
        scrot "$file"
    else
        echo "No screenshot tool found (grim, maim, scrot)" >&2
        exit 1
    fi
    notify "Saved: $file"
    echo "$file"
}

take_region() {
    local file="$OUTDIR/screenshot-$(date +%Y%m%d-%H%M%S).png"
    if [[ -n "$SLURP" && -n "$GRIM" ]]; then
        region=$(slurp)
        grim -g "$region" "$file"
    elif [[ -n "$MAIM" ]]; then
        maim -s "$file"
    else
        echo "No region selection tool found (slurp or maim)" >&2
        exit 1
    fi
    notify "Saved: $file"
    echo "$file"
}

copy_to_clipboard() {
    local src="$1"
    if [[ -n "$WL_COPY" ]]; then
        wl-copy < "$src"
    elif [[ -n "$XCLIP" ]]; then
        xclip -selection clipboard -t image/png -i "$src"
    else
        echo "No clipboard utility found (wl-copy or xclip)" >&2
        exit 1
    fi
    notify "Copied to clipboard"
}

case "${1:-help}" in
    full)
        take_full
        ;;
    region)
        take_region
        ;;
    clipboard)
        tmp=$(take_region)
        copy_to_clipboard "$tmp"
        ;;
    help)
        show_help
        ;;
    *)
        show_help
        exit 0
        ;;
esac