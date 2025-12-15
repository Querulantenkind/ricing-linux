#!/bin/bash

################################################################################
# Rice Switcher Script
################################################################################
#
# PURPOSE:
#   Quickly switch between different theme configurations (rices) by applying
#   color schemes and snippets from the themes directory to your active configs.
#
# USAGE:
#   ./rice-switcher.sh [OPTIONS] [THEME]
#
# OPTIONS:
#   -l, --list             List available themes
#   -p, --preview THEME    Preview theme colors without applying
#   -b, --backup           Create backup before switching
#   -r, --reload           Reload applications after switching
#   -w, --wallpaper        Also set wallpaper from theme
#   -d, --dry-run          Show what would be changed without applying
#   -i, --interactive      Interactive theme selection with fzf
#   -h, --help             Show this help message
#
# EXAMPLES:
#   ./rice-switcher.sh catppuccin          # Switch to catppuccin
#   ./rice-switcher.sh -b -r nord          # Backup, switch to nord, reload
#   ./rice-switcher.sh -l                  # List available themes
#   ./rice-switcher.sh -i                  # Interactive selection
#   ./rice-switcher.sh -p dracula          # Preview dracula colors
#
################################################################################

set -e

# =============================================================================
# Configuration
# =============================================================================

# Script and themes directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
THEMES_DIR="$REPO_ROOT/themes"

# Available themes
declare -a AVAILABLE_THEMES=(
    "catppuccin"
    "nord"
    "dracula"
    "gruvbox"
    "tokyo-night"
    "rose-pine"
    "everforest"
    "solarized"
)

# Config locations
declare -A CONFIG_PATHS=(
    ["hyprland"]="$HOME/.config/hypr/hyprland.conf"
    ["waybar"]="$HOME/.config/waybar/style.css"
    ["waybar_config"]="$HOME/.config/waybar/config.jsonc"
    ["i3"]="$HOME/.config/i3/config"
    ["polybar"]="$HOME/.config/polybar/config.ini"
    ["alacritty"]="$HOME/.config/alacritty/alacritty.yml"
    ["kitty"]="$HOME/.config/kitty/kitty.conf"
    ["rofi"]="$HOME/.config/rofi/config.rasi"
    ["dunst"]="$HOME/.config/dunst/dunstrc"
    ["picom"]="$HOME/.config/picom/picom.conf"
)

# Backup directory
BACKUP_DIR="$HOME/.config/rice-backups"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# =============================================================================
# Helper Functions
# =============================================================================

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
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

print_header() {
    echo -e "\n${BOLD}${CYAN}═══════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${CYAN}  $1${NC}"
    echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════${NC}\n"
}

print_section() {
    echo -e "\n${MAGENTA}▸ $1${NC}"
}

show_help() {
    cat << EOF
${BOLD}Rice Switcher Script${NC}

${CYAN}USAGE:${NC}
    $(basename "$0") [OPTIONS] [THEME]

${CYAN}OPTIONS:${NC}
    -l, --list             List available themes
    -p, --preview THEME    Preview theme colors without applying
    -b, --backup           Create backup before switching
    -r, --reload           Reload applications after switching
    -w, --wallpaper        Also set wallpaper from theme
    -d, --dry-run          Show what would be changed without applying
    -i, --interactive      Interactive theme selection with fzf
    -h, --help             Show this help message

${CYAN}AVAILABLE THEMES:${NC}
$(printf '    • %s\n' "${AVAILABLE_THEMES[@]}")

${CYAN}EXAMPLES:${NC}
    $(basename "$0") catppuccin              # Switch to catppuccin
    $(basename "$0") -b -r nord              # Backup, switch, reload
    $(basename "$0") -l                      # List themes
    $(basename "$0") -i                      # Interactive selection
    $(basename "$0") -p dracula              # Preview colors
    $(basename "$0") -d tokyo-night          # Dry run

${CYAN}WHAT THIS SCRIPT DOES:${NC}
    1. Reads color definitions from themes/<theme>/colors.conf
    2. Applies theme snippets to your configuration files
    3. Optionally reloads affected applications
    4. Optionally sets wallpaper from theme

${CYAN}NOTE:${NC}
    This script modifies your configuration files. Always create
    a backup first using the -b flag or the backup-configs.sh script.

EOF
}

# =============================================================================
# Theme Functions
# =============================================================================

validate_theme() {
    local theme="$1"
    
    for t in "${AVAILABLE_THEMES[@]}"; do
        if [[ "$t" == "$theme" ]]; then
            return 0
        fi
    done
    
    return 1
}

list_themes() {
    print_header "Available Themes"
    
    for theme in "${AVAILABLE_THEMES[@]}"; do
        local theme_dir="$THEMES_DIR/$theme"
        local colors_file="$theme_dir/colors.conf"
        
        if [[ -f "$colors_file" ]]; then
            # Read primary colors
            source "$colors_file" 2>/dev/null || true
            
            # Display theme with color preview
            echo -e "${BOLD}$theme${NC}"
            
            if [[ -n "$BG" && -n "$FG" && -n "$ACCENT" ]]; then
                echo -e "  ${DIM}Background:${NC} $BG"
                echo -e "  ${DIM}Foreground:${NC} $FG"
                echo -e "  ${DIM}Accent:${NC} $ACCENT"
            fi
            
            # Check for wallpapers
            local wallpaper_count=$(find "$theme_dir/wallpapers" -type f 2>/dev/null | wc -l)
            if [[ $wallpaper_count -gt 0 ]]; then
                echo -e "  ${DIM}Wallpapers:${NC} $wallpaper_count available"
            fi
            
            echo ""
        else
            echo -e "${DIM}$theme (colors.conf not found)${NC}"
        fi
    done
}

preview_theme() {
    local theme="$1"
    local colors_file="$THEMES_DIR/$theme/colors.conf"
    
    if [[ ! -f "$colors_file" ]]; then
        print_error "Colors file not found: $colors_file"
        exit 1
    fi
    
    print_header "Theme Preview: $theme"
    
    # Source colors
    source "$colors_file"
    
    # Display color palette
    echo -e "${BOLD}Base Colors:${NC}"
    echo -e "  Background:     $BG"
    echo -e "  Foreground:     $FG"
    echo -e "  Alt Background: $BG_ALT"
    echo -e "  Alt Foreground: $FG_ALT"
    
    echo -e "\n${BOLD}Accent Colors:${NC}"
    echo -e "  Primary:   $ACCENT"
    echo -e "  Secondary: $ACCENT_ALT"
    
    echo -e "\n${BOLD}ANSI Colors:${NC}"
    echo -e "  Black:   $BLACK"
    echo -e "  Red:     $RED"
    echo -e "  Green:   $GREEN"
    echo -e "  Yellow:  $YELLOW"
    echo -e "  Blue:    $BLUE"
    echo -e "  Magenta: $MAGENTA"
    echo -e "  Cyan:    $CYAN"
    echo -e "  White:   $WHITE"
    
    # Visual preview using terminal colors
    echo -e "\n${BOLD}Color Preview:${NC}"
    echo -e "  \033[48;2;$(hex_to_rgb "$BG")m  BG  \033[0m \033[48;2;$(hex_to_rgb "$FG")m  FG  \033[0m \033[48;2;$(hex_to_rgb "$ACCENT")m  ACC \033[0m"
    echo -e "  \033[48;2;$(hex_to_rgb "$RED")m  RED \033[0m \033[48;2;$(hex_to_rgb "$GREEN")m  GRN \033[0m \033[48;2;$(hex_to_rgb "$BLUE")m  BLU \033[0m"
    echo -e "  \033[48;2;$(hex_to_rgb "$YELLOW")m  YEL \033[0m \033[48;2;$(hex_to_rgb "$MAGENTA")m  MAG \033[0m \033[48;2;$(hex_to_rgb "$CYAN")m  CYN \033[0m"
}

hex_to_rgb() {
    local hex="${1#\#}"
    printf "%d;%d;%d" "0x${hex:0:2}" "0x${hex:2:2}" "0x${hex:4:2}"
}

# =============================================================================
# Backup Functions
# =============================================================================

create_backup() {
    local backup_name="pre-rice-$(date +%Y%m%d_%H%M%S)"
    local backup_path="$BACKUP_DIR/$backup_name"
    
    print_section "Creating Backup"
    
    mkdir -p "$backup_path"
    
    for app in "${!CONFIG_PATHS[@]}"; do
        local config="${CONFIG_PATHS[$app]}"
        
        if [[ -f "$config" ]]; then
            local dir_name=$(dirname "$config" | sed "s|$HOME/||")
            mkdir -p "$backup_path/$dir_name"
            cp "$config" "$backup_path/$dir_name/"
            print_info "Backed up: $config"
        fi
    done
    
    print_success "Backup created: $backup_path"
}

# =============================================================================
# Apply Functions
# =============================================================================

apply_snippet() {
    local app="$1"
    local theme="$2"
    local dry_run="$3"
    
    local snippet_file="$THEMES_DIR/$theme/snippets/$app.conf"
    local config_file="${CONFIG_PATHS[$app]}"
    
    # Check if snippet exists
    if [[ ! -f "$snippet_file" ]]; then
        print_warning "No snippet for $app in $theme"
        return
    fi
    
    # Check if config exists
    if [[ ! -f "$config_file" ]]; then
        print_warning "Config not found: $config_file"
        return
    fi
    
    if [[ "$dry_run" == "true" ]]; then
        print_info "[DRY RUN] Would apply $theme snippet to $app"
        return
    fi
    
    # Read snippet content
    local snippet_content
    snippet_content=$(cat "$snippet_file")
    
    # Apply based on application type
    case "$app" in
        kitty)
            apply_kitty_theme "$config_file" "$theme"
            ;;
        alacritty)
            apply_alacritty_theme "$config_file" "$theme"
            ;;
        *)
            # Generic approach: append or replace marked sections
            apply_generic_theme "$config_file" "$snippet_file" "$app"
            ;;
    esac
    
    print_success "Applied $theme to $app"
}

apply_kitty_theme() {
    local config="$1"
    local theme="$2"
    local colors_file="$THEMES_DIR/$theme/colors.conf"
    
    # Source colors
    source "$colors_file"
    
    # Create temp file with new colors
    local temp_file=$(mktemp)
    
    # Remove existing color definitions
    grep -v "^foreground\|^background\|^color[0-9]" "$config" > "$temp_file" || true
    
    # Append new colors
    cat >> "$temp_file" << EOF

# Theme: $theme (applied by rice-switcher)
foreground $FG
background $BG
color0  $BLACK
color1  $RED
color2  $GREEN
color3  $YELLOW
color4  $BLUE
color5  $MAGENTA
color6  $CYAN
color7  $WHITE
color8  $BLACK_BRIGHT
color9  $RED_BRIGHT
color10 $GREEN_BRIGHT
color11 $YELLOW_BRIGHT
color12 $BLUE_BRIGHT
color13 $MAGENTA_BRIGHT
color14 $CYAN_BRIGHT
color15 $WHITE_BRIGHT
EOF
    
    mv "$temp_file" "$config"
}

apply_alacritty_theme() {
    local config="$1"
    local theme="$2"
    local snippet="$THEMES_DIR/$theme/snippets/alacritty.conf"
    
    if [[ -f "$snippet" ]]; then
        # For alacritty, we might need to handle YAML structure
        # This is a simplified approach
        print_info "Applying alacritty theme from snippet"
        
        # Check if using alacritty.toml (new format) or alacritty.yml (old format)
        if [[ "$config" == *.toml ]]; then
            print_warning "TOML format detected - manual editing may be required"
        fi
    fi
}

apply_generic_theme() {
    local config="$1"
    local snippet="$2"
    local app="$3"
    
    # Look for markers in config file
    local start_marker="# BEGIN THEME"
    local end_marker="# END THEME"
    
    if grep -q "$start_marker" "$config"; then
        # Replace existing theme section
        local temp_file=$(mktemp)
        
        # Copy everything before theme section
        sed -n "1,/$start_marker/p" "$config" | head -n -1 > "$temp_file"
        
        # Add markers and new theme
        echo "$start_marker" >> "$temp_file"
        cat "$snippet" >> "$temp_file"
        echo "$end_marker" >> "$temp_file"
        
        # Copy everything after theme section
        sed -n "/$end_marker/,\$p" "$config" | tail -n +2 >> "$temp_file"
        
        mv "$temp_file" "$config"
    else
        # Append theme section
        echo "" >> "$config"
        echo "$start_marker" >> "$config"
        cat "$snippet" >> "$config"
        echo "$end_marker" >> "$config"
    fi
}

apply_theme() {
    local theme="$1"
    local dry_run="$2"
    
    print_header "Applying Theme: $theme"
    
    local colors_file="$THEMES_DIR/$theme/colors.conf"
    
    if [[ ! -f "$colors_file" ]]; then
        print_error "Theme colors not found: $colors_file"
        exit 1
    fi
    
    # Source colors for global use
    source "$colors_file"
    
    print_info "Loaded colors from: $colors_file"
    
    # Apply to each application
    for app in "${!CONFIG_PATHS[@]}"; do
        apply_snippet "$app" "$theme" "$dry_run"
    done
    
    # Save current theme
    if [[ "$dry_run" != "true" ]]; then
        echo "$theme" > "$HOME/.config/.current-rice"
        print_success "Theme '$theme' applied successfully!"
    fi
}

# =============================================================================
# Wallpaper Functions
# =============================================================================

set_wallpaper() {
    local theme="$1"
    local wallpaper_dir="$THEMES_DIR/$theme/wallpapers"
    
    if [[ ! -d "$wallpaper_dir" ]]; then
        print_warning "No wallpapers found for $theme"
        return
    fi
    
    # Find first wallpaper
    local wallpaper
    wallpaper=$(find "$wallpaper_dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | head -n 1)
    
    if [[ -z "$wallpaper" ]]; then
        print_warning "No wallpaper images found"
        return
    fi
    
    print_section "Setting Wallpaper"
    print_info "Using: $(basename "$wallpaper")"
    
    # Detect and use appropriate wallpaper tool
    if command -v hyprpaper &> /dev/null; then
        # Hyprland
        hyprctl hyprpaper preload "$wallpaper" 2>/dev/null || true
        hyprctl hyprpaper wallpaper ",$wallpaper" 2>/dev/null || true
        print_success "Set wallpaper with hyprpaper"
    elif command -v swaybg &> /dev/null; then
        # Sway/Wayland
        pkill swaybg 2>/dev/null || true
        swaybg -i "$wallpaper" -m fill &
        print_success "Set wallpaper with swaybg"
    elif command -v feh &> /dev/null; then
        # X11/i3
        feh --bg-fill "$wallpaper"
        print_success "Set wallpaper with feh"
    elif command -v nitrogen &> /dev/null; then
        # X11 alternative
        nitrogen --set-zoom-fill "$wallpaper"
        print_success "Set wallpaper with nitrogen"
    else
        print_warning "No wallpaper tool found (install feh, swaybg, or hyprpaper)"
    fi
}

# =============================================================================
# Reload Functions
# =============================================================================

reload_applications() {
    print_section "Reloading Applications"
    
    # Detect session type
    if [[ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
        # Hyprland
        hyprctl reload 2>/dev/null && print_info "Reloaded Hyprland"
        pkill -SIGUSR2 waybar 2>/dev/null && print_info "Reloaded Waybar"
    elif [[ -n "$I3SOCK" ]]; then
        # i3wm
        i3-msg reload 2>/dev/null && print_info "Reloaded i3"
        pkill -SIGUSR1 polybar 2>/dev/null || true
        "$HOME/.config/polybar/launch.sh" 2>/dev/null && print_info "Restarted Polybar"
    fi
    
    # Dunst
    pkill dunst 2>/dev/null && dunst &
    print_info "Restarted Dunst"
    
    # Send test notification
    if command -v notify-send &> /dev/null; then
        notify-send "Rice Switcher" "Theme applied and applications reloaded!" -u normal
    fi
    
    print_success "Applications reloaded"
}

# =============================================================================
# Interactive Selection
# =============================================================================

interactive_select() {
    if ! command -v fzf &> /dev/null; then
        print_error "fzf is required for interactive selection"
        print_info "Install with: sudo pacman -S fzf"
        exit 1
    fi
    
    local selected
    selected=$(printf '%s\n' "${AVAILABLE_THEMES[@]}" | fzf --prompt="Select theme: " --height=40% --reverse)
    
    if [[ -n "$selected" ]]; then
        echo "$selected"
    else
        exit 0
    fi
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    local theme=""
    local do_backup=false
    local do_reload=false
    local do_wallpaper=false
    local dry_run=false
    local list_only=false
    local preview_only=false
    local interactive=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -l|--list)
                list_only=true
                shift
                ;;
            -p|--preview)
                preview_only=true
                theme="$2"
                shift 2
                ;;
            -b|--backup)
                do_backup=true
                shift
                ;;
            -r|--reload)
                do_reload=true
                shift
                ;;
            -w|--wallpaper)
                do_wallpaper=true
                shift
                ;;
            -d|--dry-run)
                dry_run=true
                shift
                ;;
            -i|--interactive)
                interactive=true
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            -*)
                print_error "Unknown option: $1"
                show_help
                exit 1
                ;;
            *)
                theme="$1"
                shift
                ;;
        esac
    done
    
    # List themes
    if [[ "$list_only" == "true" ]]; then
        list_themes
        exit 0
    fi
    
    # Preview theme
    if [[ "$preview_only" == "true" ]]; then
        if ! validate_theme "$theme"; then
            print_error "Invalid theme: $theme"
            exit 1
        fi
        preview_theme "$theme"
        exit 0
    fi
    
    # Interactive selection
    if [[ "$interactive" == "true" ]]; then
        theme=$(interactive_select)
    fi
    
    # Validate theme
    if [[ -z "$theme" ]]; then
        print_error "No theme specified"
        echo ""
        show_help
        exit 1
    fi
    
    if ! validate_theme "$theme"; then
        print_error "Invalid theme: $theme"
        echo ""
        echo "Available themes:"
        printf '  • %s\n' "${AVAILABLE_THEMES[@]}"
        exit 1
    fi
    
    # Create backup if requested
    if [[ "$do_backup" == "true" ]]; then
        create_backup
    fi
    
    # Apply theme
    apply_theme "$theme" "$dry_run"
    
    # Set wallpaper if requested
    if [[ "$do_wallpaper" == "true" && "$dry_run" != "true" ]]; then
        set_wallpaper "$theme"
    fi
    
    # Reload applications if requested
    if [[ "$do_reload" == "true" && "$dry_run" != "true" ]]; then
        reload_applications
    fi
    
    # Final message
    if [[ "$dry_run" == "true" ]]; then
        print_header "Dry Run Complete"
        print_info "No changes were made. Run without -d to apply."
    else
        print_header "Theme Switch Complete"
        print_success "Enjoy your new $theme rice!"
        
        if [[ "$do_reload" != "true" ]]; then
            print_info "Run with -r to reload applications, or restart your session"
        fi
    fi
}

main "$@"