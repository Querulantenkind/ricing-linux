#!/usr/bin/env bash

################################################################################
# Install i3 Window Manager and common tooling
################################################################################
#
# Supports Arch (pacman), Debian/Ubuntu (apt) and Fedora (dnf).
#
# Usage:
#   ./install-i3wm.sh [-y]
#
################################################################################

set -euo pipefail

AUTO_YES=false

show_help() {
    cat <<EOF
Install i3 window manager and common utilities.

Usage: $(basename "$0") [-y]

Options:
  -y    Non-interactive
  -h    Show this help
EOF
}

while getopts ":yh" opt; do
    case ${opt} in
        y) AUTO_YES=true ;;
        h) show_help; exit 0 ;;
        :) echo "Missing option argument for -${OPTARG}" >&2; exit 1 ;;
        \?) echo "Invalid option: -${OPTARG}" >&2; show_help; exit 1 ;;
    esac
done

confirm() {
    [[ "$AUTO_YES" == true ]] && return 0
    read -r -p "$1 [y/N] " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

if command -v pacman >/dev/null 2>&1; then
    echo "Detected pacman (Arch-based system)"
    if confirm "Install i3 and common packages using pacman?"; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --needed --noconfirm \
            i3-wm i3status i3lock dmenu rofi picom feh compton polybar \
            alacritty kitty dunst lxappearance network-manager-applet
        echo "i3 and related packages installed (Arch)."
    else
        echo "Installation cancelled"
        exit 0
    fi
elif command -v apt >/dev/null 2>&1; then
    echo "Detected apt (Debian/Ubuntu)"
    if confirm "Install i3 and common packages using apt?"; then
        sudo apt update
        sudo apt install -y i3 i3status i3lock dmenu rofi picom feh polybar \
            alacritty kitty dunst lxappearance network-manager-gnome
        echo "i3 and related packages installed (Debian/Ubuntu)."
    else
        echo "Installation cancelled"
        exit 0
    fi
elif command -v dnf >/dev/null 2>&1; then
    echo "Detected dnf (Fedora)"
    if confirm "Install i3 and common packages using dnf?"; then
        sudo dnf upgrade --refresh -y
        sudo dnf install -y i3 i3status i3lock dmenu rofi picom feh polybar \
            alacritty kitty dunst lxappearance NetworkManager-gnome-applet
        echo "i3 and related packages installed (Fedora)."
    else
        echo "Installation cancelled"
        exit 0
    fi
else
    echo "Unsupported distribution. Please install i3 and the required packages manually."
    exit 1
fi
