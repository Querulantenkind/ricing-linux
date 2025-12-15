#!/usr/bin/env bash

################################################################################
# Icon Theme Installer
################################################################################
# Installs popular icon themes for Linux ricing.
# Supports Arch (pacman/AUR), Debian/Ubuntu (apt), and Fedora (dnf).
################################################################################

set -euo pipefail

AUTO_YES=false
INSTALL_ALL=false

show_help() {
    cat <<EOF
Icon Theme Installer

Install popular icon themes for your rice.

Usage: $(basename "$0") [OPTIONS]

Options:
  -a, --all         Install all recommended icon themes
  -y, --yes         Non-interactive mode
  -h, --help        Show this help

Available themes:
  • Papirus (recommended)
  • Breeze
  • Numix
  • Font Awesome
  • Bibata Cursor Theme

EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -a|--all) INSTALL_ALL=true; shift ;;
        -y|--yes) AUTO_YES=true; shift ;;
        -h|--help) show_help; exit 0 ;;
        *) echo "Unknown option: $1" >&2; show_help; exit 1 ;;
    esac
done

confirm() {
    [[ "$AUTO_YES" == true ]] && return 0
    read -rp "$1 [y/N] " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

detect_pkg_manager() {
    if command -v pacman &>/dev/null; then
        echo pacman
    elif command -v apt &>/dev/null; then
        echo apt
    elif command -v dnf &>/dev/null; then
        echo dnf
    else
        echo unknown
    fi
}

PKG_MANAGER=$(detect_pkg_manager)

if [[ "$PKG_MANAGER" == unknown ]]; then
    echo "Unsupported package manager" >&2
    exit 1
fi

echo "Detected: $PKG_MANAGER"
echo ""

# Papirus Icon Theme
if [[ "$INSTALL_ALL" == true ]] || confirm "Install Papirus icon theme?"; then
    echo "Installing Papirus..."
    case "$PKG_MANAGER" in
        pacman)
            sudo pacman -S --needed --noconfirm papirus-icon-theme
            ;;
        apt)
            sudo add-apt-repository -y ppa:papirus/papirus || true
            sudo apt update
            sudo apt install -y papirus-icon-theme
            ;;
        dnf)
            sudo dnf install -y papirus-icon-theme
            ;;
    esac
    echo "✓ Papirus installed"
fi

# Breeze Icons
if [[ "$INSTALL_ALL" == true ]] || confirm "Install Breeze icon theme?"; then
    echo "Installing Breeze..."
    case "$PKG_MANAGER" in
        pacman)
            sudo pacman -S --needed --noconfirm breeze-icons
            ;;
        apt)
            sudo apt install -y breeze-icon-theme
            ;;
        dnf)
            sudo dnf install -y breeze-icon-theme
            ;;
    esac
    echo "✓ Breeze installed"
fi

# Font Awesome (for icons in status bars)
if [[ "$INSTALL_ALL" == true ]] || confirm "Install Font Awesome?"; then
    echo "Installing Font Awesome..."
    case "$PKG_MANAGER" in
        pacman)
            sudo pacman -S --needed --noconfirm ttf-font-awesome
            ;;
        apt)
            sudo apt install -y fonts-font-awesome
            ;;
        dnf)
            sudo dnf install -y fontawesome-fonts
            ;;
    esac
    echo "✓ Font Awesome installed"
fi

# Numix (if available)
if [[ "$PKG_MANAGER" == "pacman" ]]; then
    if [[ "$INSTALL_ALL" == true ]] || confirm "Install Numix icon theme? (AUR required)"; then
        if command -v yay &>/dev/null; then
            yay -S --needed --noconfirm numix-icon-theme-git numix-circle-icon-theme-git
            echo "✓ Numix installed"
        elif command -v paru &>/dev/null; then
            paru -S --needed --noconfirm numix-icon-theme-git numix-circle-icon-theme-git
            echo "✓ Numix installed"
        else
            echo "⚠ Numix requires AUR helper (yay or paru)"
        fi
    fi
fi

# Bibata Cursor Theme (if available)
if [[ "$PKG_MANAGER" == "pacman" ]]; then
    if [[ "$INSTALL_ALL" == true ]] || confirm "Install Bibata cursor theme? (AUR required)"; then
        if command -v yay &>/dev/null; then
            yay -S --needed --noconfirm bibata-cursor-theme
            echo "✓ Bibata cursor installed"
        elif command -v paru &>/dev/null; then
            paru -S --needed --noconfirm bibata-cursor-theme
            echo "✓ Bibata cursor installed"
        else
            echo "⚠ Bibata requires AUR helper (yay or paru)"
        fi
    fi
fi

# Update icon cache
echo ""
echo "Updating icon cache..."
if command -v gtk-update-icon-cache &>/dev/null; then
    for theme_dir in /usr/share/icons/*/ ~/.local/share/icons/*/; do
        if [[ -d "$theme_dir" ]]; then
            gtk-update-icon-cache -f -t "$theme_dir" 2>/dev/null || true
        fi
    done
    echo "✓ Icon cache updated"
fi

echo ""
echo "Installation complete!"
echo ""
echo "To set an icon theme:"
echo "  • GTK: Use lxappearance or edit ~/.config/gtk-3.0/settings.ini"
echo "  • Qt: Use qt5ct or kvantum"
echo "  • i3/Polybar: Already configured in theme snippets"
echo "  • Hyprland/Waybar: Already configured in theme snippets"
echo ""
echo "Recommended icon themes by color scheme:"
echo "  • Dark themes: Papirus-Dark, Breeze-Dark"
echo "  • Light themes: Papirus-Light, Breeze"
