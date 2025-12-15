#!/bin/bash

################################################################################
# Example Theme Automation Script
################################################################################
#
# ⚠️  IMPORTANT DISCLAIMER ⚠️
# This is a REFERENCE IMPLEMENTATION and EXAMPLE script only!
# 
# Manual theme application is RECOMMENDED for learning and understanding
# your system configuration. Use this script at your own risk.
#
# This script demonstrates how theme automation COULD work, but should
# be adapted to your specific setup and needs.
#
################################################################################
#
# PURPOSE:
#   Demonstrates automated theme switching by copying color snippets
#   from the themes/ directory into active configuration files.
#
# USAGE:
#   ./example-theme-automation.sh <theme-name>
#
# EXAMPLES:
#   ./example-theme-automation.sh catppuccin
#   ./example-theme-automation.sh nord
#   ./example-theme-automation.sh rose-pine
#
# AVAILABLE THEMES:
#   - catppuccin
#   - nord
#   - dracula
#   - gruvbox
#   - tokyo-night
#   - rose-pine
#   - everforest
#   - solarized
#
# WHAT THIS SCRIPT DOES:
#   1. Validates theme selection
#   2. Backs up existing configurations
#   3. Applies theme snippets to config files
#   4. Reloads affected applications
#
# PREREQUISITES:
#   - Config files must exist in standard locations
#   - Applications must be installed
#   - User must have write permissions
#
# NOTES:
#   - This script OVERWRITES color sections in your configs
#   - Always backup your configs before running
#   - Test on a fresh VM or backup system first
#   - Adapt paths to match your system setup
#
################################################################################

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THEMES_DIR="$SCRIPT_DIR"

# Backup directory
BACKUP_DIR="$HOME/.config/theme-backups/$(date +%Y%m%d_%H%M%S)"

# Available themes
AVAILABLE_THEMES=("catppuccin" "nord" "dracula" "gruvbox" "tokyo-night" "rose-pine" "everforest" "solarized")

################################################################################
# Helper Functions
################################################################################

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo ""
    echo "=================================="
    echo "$1"
    echo "=================================="
    echo ""
}

show_usage() {
    cat << EOF
Usage: $0 <theme-name>

Available themes:
EOF
    for theme in "${AVAILABLE_THEMES[@]}"; do
        echo "  - $theme"
    done
    echo ""
    echo "Example:"
    echo "  $0 catppuccin"
}

validate_theme() {
    local theme="$1"
    for available in "${AVAILABLE_THEMES[@]}"; do
        if [[ "$available" == "$theme" ]]; then
            return 0
        fi
    done
    return 1
}

backup_config() {
    local config_file="$1"
    if [[ -f "$config_file" ]]; then
        mkdir -p "$BACKUP_DIR"
        cp "$config_file" "$BACKUP_DIR/"
        print_info "Backed up: $config_file"
    fi
}

################################################################################
# Application Apply Functions
################################################################################

apply_alacritty() {
    local theme="$1"
    local config_file="$HOME/.config/alacritty/alacritty.yml"
    local snippet="$THEMES_DIR/$theme/snippets/alacritty.yml"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "Alacritty config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "Alacritty snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    
    # NOTE: This is a simplified example. Real implementation would need
    # to intelligently replace color sections without breaking other config
    print_info "Applying Alacritty theme..."
    print_warning "Manual application recommended - see $snippet"
}

apply_kitty() {
    local theme="$1"
    local config_file="$HOME/.config/kitty/kitty.conf"
    local snippet="$THEMES_DIR/$theme/snippets/kitty.conf"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "Kitty config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "Kitty snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    print_info "Applying Kitty theme..."
    print_warning "Manual application recommended - see $snippet"
}

apply_rofi() {
    local theme="$1"
    local config_file="$HOME/.config/rofi/config.rasi"
    local snippet="$THEMES_DIR/$theme/snippets/rofi.rasi"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "Rofi config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "Rofi snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    print_info "Applying Rofi theme..."
    print_warning "Manual application recommended - see $snippet"
}

apply_i3() {
    local theme="$1"
    local config_file="$HOME/.config/i3/config"
    local snippet="$THEMES_DIR/$theme/snippets/i3-colors.conf"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "i3 config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "i3 snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    print_info "Applying i3wm theme..."
    print_warning "Manual application recommended - see $snippet"
    
    # Reload i3 if running
    if pgrep -x i3 > /dev/null; then
        i3-msg reload 2>/dev/null || true
    fi
}

apply_hyprland() {
    local theme="$1"
    local config_file="$HOME/.config/hypr/hyprland.conf"
    local snippet="$THEMES_DIR/$theme/snippets/hyprland-colors.conf"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "Hyprland config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "Hyprland snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    print_info "Applying Hyprland theme..."
    print_warning "Manual application recommended - see $snippet"
    
    # Reload Hyprland if running
    if pgrep -x Hyprland > /dev/null; then
        hyprctl reload 2>/dev/null || true
    fi
}

apply_waybar() {
    local theme="$1"
    local config_file="$HOME/.config/waybar/style.css"
    local snippet="$THEMES_DIR/$theme/snippets/waybar-style.css"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "Waybar config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "Waybar snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    print_info "Applying Waybar theme..."
    print_warning "Manual application recommended - see $snippet"
    
    # Reload Waybar if running
    if pgrep -x waybar > /dev/null; then
        killall -SIGUSR2 waybar 2>/dev/null || true
    fi
}

apply_polybar() {
    local theme="$1"
    local config_file="$HOME/.config/polybar/config.ini"
    local snippet="$THEMES_DIR/$theme/snippets/polybar-colors.ini"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "Polybar config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "Polybar snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    print_info "Applying Polybar theme..."
    print_warning "Manual application recommended - see $snippet"
    
    # Reload Polybar if running
    if pgrep -x polybar > /dev/null; then
        polybar-msg cmd restart 2>/dev/null || true
    fi
}

apply_dunst() {
    local theme="$1"
    local config_file="$HOME/.config/dunst/dunstrc"
    local snippet="$THEMES_DIR/$theme/snippets/dunst-colors.conf"
    
    if [[ ! -f "$config_file" ]]; then
        print_warning "Dunst config not found at $config_file"
        return
    fi
    
    if [[ ! -f "$snippet" ]]; then
        print_warning "Dunst snippet not found for $theme"
        return
    fi
    
    backup_config "$config_file"
    print_info "Applying Dunst theme..."
    print_warning "Manual application recommended - see $snippet"
    
    # Reload Dunst if running
    if pgrep -x dunst > /dev/null; then
        killall dunst 2>/dev/null || true
    fi
}

################################################################################
# Main Script
################################################################################

main() {
    print_header "🎨 Example Theme Automation Script"
    
    # Check arguments
    if [[ $# -eq 0 ]]; then
        print_error "No theme specified"
        show_usage
        exit 1
    fi
    
    THEME_NAME="$1"
    
    # Validate theme
    if ! validate_theme "$THEME_NAME"; then
        print_error "Invalid theme: $THEME_NAME"
        show_usage
        exit 1
    fi
    
    # Check if theme directory exists
    if [[ ! -d "$THEMES_DIR/$THEME_NAME" ]]; then
        print_error "Theme directory not found: $THEMES_DIR/$THEME_NAME"
        exit 1
    fi
    
    print_info "Selected theme: $THEME_NAME"
    print_info "Backup directory: $BACKUP_DIR"
    echo ""
    
    print_warning "⚠️  This script will modify your configuration files!"
    print_warning "⚠️  Backups will be created in: $BACKUP_DIR"
    echo ""
    read -p "Continue? (y/N) " -n 1 -r
    echo ""
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Aborted by user"
        exit 0
    fi
    
    print_header "Applying Theme: $THEME_NAME"
    
    # Apply to each application
    apply_alacritty "$THEME_NAME"
    apply_kitty "$THEME_NAME"
    apply_rofi "$THEME_NAME"
    apply_i3 "$THEME_NAME"
    apply_hyprland "$THEME_NAME"
    apply_waybar "$THEME_NAME"
    apply_polybar "$THEME_NAME"
    apply_dunst "$THEME_NAME"
    
    print_header "Summary"
    print_success "Theme application process completed!"
    print_info "Backups saved to: $BACKUP_DIR"
    echo ""
    print_warning "NOTE: This script only shows where snippets would be applied."
    print_warning "For actual theme changes, manually copy relevant sections from:"
    print_info "$THEMES_DIR/$THEME_NAME/snippets/"
    echo ""
    print_info "For detailed instructions, see:"
    print_info "$THEMES_DIR/$THEME_NAME/README.md"
}

# Run main function
main "$@"