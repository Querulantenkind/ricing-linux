#!/usr/bin/env bash

################################################################################
# Install Hyprland and common Wayland tooling
################################################################################
#
# Supports Arch (pacman) out of the box. For Debian/Ubuntu and Fedora this
# script will provide guidance since packages may not be available in the
# official repositories.
#
# Usage:
#   ./install-hyprland.sh [-y]
#
################################################################################

set -euo pipefail

AUTO_YES=false

show_help() {
    cat <<EOF
Install Hyprland and related packages (best-effort).

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
    if confirm "Install Hyprland and common Wayland packages using pacman?"; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --needed --noconfirm \
            hyprland hyprpaper hyprland-git waybar polkit-gnome swaybg wl-clipboard \
            alacritty kitty rofi dunst grim slurp swaylock swayidle pamixer \
            pipewire pipewire-pulse wireplumber lib32-pipewire mesa mesa-vdpau
        echo "Hyprland packages installed (Arch)."
    else
        echo "Installation cancelled"
        exit 0
    fi
else
    echo "Non-Arch systems may require manual steps."
    echo "Suggested steps for Debian/Ubuntu or Fedora:"
    echo "  1) Install wlroots and Wayland stack for your distro"
    echo "  2) Build or install Hyprland from upstream (see https://hyprland.org/docs/)"
    echo "  3) Install dependencies: Wayland compositor, wlroots, wl-clipboard, waybar, rofi, alacritty or kitty"
    echo
    echo "Refer to the official Hyprland docs: https://hyprland.org/docs/"
fi
