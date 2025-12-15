#!/usr/bin/env bash

################################################################################
# Install Dependencies
################################################################################
#
# Installs a set of useful packages commonly required by this rice.
# Supports Arch (pacman), Debian/Ubuntu (apt) and Fedora (dnf).
#
# Usage:
#   ./install-dependencies.sh [-y]
#
# Options:
#   -y    Non-interactive / assume yes
#   -h    Show help
#
################################################################################

set -euo pipefail

AUTO_YES=false

show_help() {
    cat <<EOF
Install common dependencies for this rice.

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
    if [[ "$AUTO_YES" == true ]]; then
        return 0
    fi

    read -r -p "$1 [y/N] " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

detect_pkg_manager() {
    if command -v pacman >/dev/null 2>&1; then
        echo pacman
    elif command -v apt >/dev/null 2>&1; then
        echo apt
    elif command -v dnf >/dev/null 2>&1; then
        echo dnf
    else
        echo unknown
    fi
}

PKG_MANAGER=$(detect_pkg_manager)

if [[ "$PKG_MANAGER" == "unknown" ]]; then
    echo "Unsupported distribution or package manager not found." >&2
    exit 1
fi

# Common packages across distros (best-effort mapping)
COMMON_PACKAGES=(
    git
    curl
    wget
    unzip
    p7zip
    fzf
    jq
    imagemagick
    libnotify
    ripgrep
    bat
    htop
    python
    python-pip
    wl-clipboard
    xclip
)

FONT_PACKAGES=()

case "$PKG_MANAGER" in
    pacman)
        PKG_INSTALL=(sudo pacman -S --needed --noconfirm)
        FONT_PACKAGES+=(ttf-fira-code ttf-jetbrains-mono) ;;
    apt)
        PKG_INSTALL=(sudo apt install -y)
        COMMON_PACKAGES+=(build-essential)
        FONT_PACKAGES+=(fonts-firacode fonts-jetbrains-mono) ;;
    dnf)
        PKG_INSTALL=(sudo dnf install -y)
        FONT_PACKAGES+=(fira-code-fonts jetbrains-mono-fonts) ;;
esac

install_packages() {
    local -n pkgs=$1

    if [[ ${#pkgs[@]} -eq 0 ]]; then
        echo "No packages to install"
        return
    fi

    echo "Installing packages: ${pkgs[*]}"
    if confirm "Proceed with installation?"; then
        "${PKG_INSTALL[@]}" "${pkgs[@]}"
    else
        echo "Installation cancelled by user"
        exit 0
    fi
}

main() {
    echo "Detected package manager: $PKG_MANAGER"

    install_packages COMMON_PACKAGES

    # Fonts
    if confirm "Install recommended fonts (Fira Code, JetBrains Mono)?"; then
        install_packages FONT_PACKAGES
    fi

    echo "Done."
    echo "Tip: Some packages may be named differently on your distro."
}

main
