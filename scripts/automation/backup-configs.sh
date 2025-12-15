#!/bin/bash

################################################################################
# Configuration Backup Script
################################################################################
#
# PURPOSE:
#   Backs up all rice-related configuration files to a timestamped directory
#   or creates a compressed archive for easy restoration.
#
# USAGE:
#   ./backup-configs.sh [OPTIONS]
#
# OPTIONS:
#   -d, --directory DIR    Custom backup directory (default: ~/.config-backups)
#   -c, --compress         Create compressed tar.gz archive
#   -l, --list             List all existing backups
#   -r, --restore BACKUP   Restore from a specific backup
#   -n, --name NAME        Custom backup name (default: timestamp)
#   -q, --quiet            Suppress output
#   -h, --help             Show this help message
#
# EXAMPLES:
#   ./backup-configs.sh                     # Create timestamped backup
#   ./backup-configs.sh -c                  # Create compressed backup
#   ./backup-configs.sh -n "before-change"  # Named backup
#   ./backup-configs.sh -l                  # List backups
#   ./backup-configs.sh -r 20231215_143022  # Restore specific backup
#
################################################################################

set -e

# =============================================================================
# Configuration
# =============================================================================

# Default backup location
BACKUP_BASE_DIR="${BACKUP_BASE_DIR:-$HOME/.config-backups}"

# Directories and files to backup
declare -a CONFIG_DIRS=(
    "$HOME/.config/hypr"
    "$HOME/.config/i3"
    "$HOME/.config/alacritty"
    "$HOME/.config/kitty"
    "$HOME/.config/polybar"
    "$HOME/.config/waybar"
    "$HOME/.config/rofi"
    "$HOME/.config/dunst"
    "$HOME/.config/picom"
    "$HOME/.config/nvim"
    "$HOME/.config/fish"
    "$HOME/.config/gtk-3.0"
    "$HOME/.config/gtk-4.0"
)

declare -a CONFIG_FILES=(
    "$HOME/.zshrc"
    "$HOME/.bashrc"
    "$HOME/.Xresources"
    "$HOME/.xinitrc"
)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# =============================================================================
# Helper Functions
# =============================================================================

print_info() {
    [[ "$QUIET" != "true" ]] && echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    [[ "$QUIET" != "true" ]] && echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    [[ "$QUIET" != "true" ]] && echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

print_header() {
    [[ "$QUIET" != "true" ]] && echo -e "\n${BOLD}${CYAN}=== $1 ===${NC}\n"
}

show_help() {
    cat << EOF
${BOLD}Configuration Backup Script${NC}

${CYAN}USAGE:${NC}
    $(basename "$0") [OPTIONS]

${CYAN}OPTIONS:${NC}
    -d, --directory DIR    Custom backup directory (default: ~/.config-backups)
    -c, --compress         Create compressed tar.gz archive
    -l, --list             List all existing backups
    -r, --restore BACKUP   Restore from a specific backup
    -n, --name NAME        Custom backup name (default: timestamp)
    -q, --quiet            Suppress output
    -h, --help             Show this help message

${CYAN}EXAMPLES:${NC}
    $(basename "$0")                         # Create timestamped backup
    $(basename "$0") -c                      # Create compressed backup
    $(basename "$0") -n "before-hyprland"    # Named backup
    $(basename "$0") -l                      # List all backups
    $(basename "$0") -r 20231215_143022      # Restore backup

${CYAN}BACKED UP LOCATIONS:${NC}
    ~/.config/hypr          Hyprland configuration
    ~/.config/i3            i3wm configuration
    ~/.config/alacritty     Alacritty terminal
    ~/.config/kitty         Kitty terminal
    ~/.config/polybar       Polybar status bar
    ~/.config/waybar        Waybar status bar
    ~/.config/rofi          Rofi launcher
    ~/.config/dunst         Dunst notifications
    ~/.config/picom         Picom compositor
    ~/.config/nvim          Neovim editor
    ~/.config/fish          Fish shell
    ~/.config/gtk-*         GTK themes
    ~/.zshrc, ~/.bashrc     Shell configs

EOF
}

# =============================================================================
# Core Functions
# =============================================================================

check_dependencies() {
    local deps=("tar" "cp" "mkdir")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            print_error "Required command '$dep' not found"
            exit 1
        fi
    done
}

create_backup_dir() {
    local backup_dir="$1"
    
    if [[ -d "$backup_dir" ]]; then
        print_warning "Backup directory already exists: $backup_dir"
        read -p "Overwrite? [y/N] " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Backup cancelled"
            exit 0
        fi
        rm -rf "$backup_dir"
    fi
    
    mkdir -p "$backup_dir"
    print_info "Created backup directory: $backup_dir"
}

backup_configs() {
    local backup_dir="$1"
    local count=0
    local failed=0
    
    print_header "Backing Up Configuration Directories"
    
    for dir in "${CONFIG_DIRS[@]}"; do
        if [[ -d "$dir" ]]; then
            local dir_name=$(basename "$dir")
            local parent_name=$(basename "$(dirname "$dir")")
            local target="$backup_dir/$parent_name/$dir_name"
            
            mkdir -p "$(dirname "$target")"
            if cp -r "$dir" "$target" 2>/dev/null; then
                print_info "Backed up: $dir"
                ((count++))
            else
                print_warning "Failed to backup: $dir"
                ((failed++))
            fi
        else
            print_warning "Directory not found: $dir"
        fi
    done
    
    print_header "Backing Up Configuration Files"
    
    mkdir -p "$backup_dir/home"
    for file in "${CONFIG_FILES[@]}"; do
        if [[ -f "$file" ]]; then
            local file_name=$(basename "$file")
            if cp "$file" "$backup_dir/home/$file_name" 2>/dev/null; then
                print_info "Backed up: $file"
                ((count++))
            else
                print_warning "Failed to backup: $file"
                ((failed++))
            fi
        else
            print_warning "File not found: $file"
        fi
    done
    
    # Create metadata file
    cat > "$backup_dir/backup-info.txt" << EOF
Backup Information
==================
Date: $(date '+%Y-%m-%d %H:%M:%S')
Host: $(hostname)
User: $(whoami)
Kernel: $(uname -r)
Items backed up: $count
Failed: $failed

Backed up directories:
$(printf '%s\n' "${CONFIG_DIRS[@]}")

Backed up files:
$(printf '%s\n' "${CONFIG_FILES[@]}")
EOF
    
    print_success "Backup complete: $count items backed up, $failed failed"
}

compress_backup() {
    local backup_dir="$1"
    local archive_name="$backup_dir.tar.gz"
    
    print_header "Creating Compressed Archive"
    
    if tar -czf "$archive_name" -C "$(dirname "$backup_dir")" "$(basename "$backup_dir")" 2>/dev/null; then
        local size=$(du -h "$archive_name" | cut -f1)
        print_success "Created archive: $archive_name ($size)"
        
        # Remove uncompressed backup
        rm -rf "$backup_dir"
        print_info "Removed uncompressed backup"
    else
        print_error "Failed to create archive"
        exit 1
    fi
}

list_backups() {
    print_header "Available Backups"
    
    if [[ ! -d "$BACKUP_BASE_DIR" ]]; then
        print_warning "No backups found in $BACKUP_BASE_DIR"
        exit 0
    fi
    
    local count=0
    
    # List directories
    for backup in "$BACKUP_BASE_DIR"/*/; do
        if [[ -d "$backup" ]]; then
            local name=$(basename "$backup")
            local info_file="$backup/backup-info.txt"
            local date="Unknown"
            
            if [[ -f "$info_file" ]]; then
                date=$(grep "^Date:" "$info_file" | cut -d: -f2- | xargs)
            fi
            
            local size=$(du -sh "$backup" 2>/dev/null | cut -f1)
            echo -e "${CYAN}📁${NC} $name ${YELLOW}($size)${NC} - $date"
            ((count++))
        fi
    done
    
    # List archives
    for archive in "$BACKUP_BASE_DIR"/*.tar.gz; do
        if [[ -f "$archive" ]]; then
            local name=$(basename "$archive" .tar.gz)
            local size=$(du -h "$archive" | cut -f1)
            local date=$(stat -c %y "$archive" 2>/dev/null | cut -d. -f1)
            
            echo -e "${CYAN}📦${NC} $name ${YELLOW}($size)${NC} - $date [compressed]"
            ((count++))
        fi
    done
    
    if [[ $count -eq 0 ]]; then
        print_warning "No backups found"
    else
        echo ""
        print_info "Total: $count backup(s)"
    fi
}

restore_backup() {
    local backup_name="$1"
    local backup_path="$BACKUP_BASE_DIR/$backup_name"
    local is_archive=false
    
    print_header "Restoring Backup: $backup_name"
    
    # Check if it's an archive
    if [[ -f "$backup_path.tar.gz" ]]; then
        is_archive=true
        backup_path="$backup_path.tar.gz"
    elif [[ ! -d "$backup_path" ]]; then
        print_error "Backup not found: $backup_name"
        print_info "Use -l to list available backups"
        exit 1
    fi
    
    # Confirm restoration
    print_warning "This will overwrite your current configuration files!"
    read -p "Continue? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Restoration cancelled"
        exit 0
    fi
    
    # Extract if archive
    if [[ "$is_archive" == "true" ]]; then
        print_info "Extracting archive..."
        local temp_dir=$(mktemp -d)
        tar -xzf "$backup_path" -C "$temp_dir"
        backup_path="$temp_dir/$backup_name"
    fi
    
    # Restore .config directories
    if [[ -d "$backup_path/.config" ]]; then
        for dir in "$backup_path/.config"/*/; do
            local dir_name=$(basename "$dir")
            local target="$HOME/.config/$dir_name"
            
            if [[ -d "$target" ]]; then
                rm -rf "$target"
            fi
            
            cp -r "$dir" "$target"
            print_info "Restored: $target"
        done
    fi
    
    # Restore home files
    if [[ -d "$backup_path/home" ]]; then
        for file in "$backup_path/home"/.*; do
            if [[ -f "$file" ]]; then
                local file_name=$(basename "$file")
                cp "$file" "$HOME/$file_name"
                print_info "Restored: $HOME/$file_name"
            fi
        done
    fi
    
    # Cleanup temp directory
    if [[ "$is_archive" == "true" ]]; then
        rm -rf "$temp_dir"
    fi
    
    print_success "Restoration complete!"
    print_warning "You may need to reload your window manager or restart applications"
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    local compress=false
    local list_only=false
    local restore_name=""
    local backup_name=""
    QUIET=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -d|--directory)
                BACKUP_BASE_DIR="$2"
                shift 2
                ;;
            -c|--compress)
                compress=true
                shift
                ;;
            -l|--list)
                list_only=true
                shift
                ;;
            -r|--restore)
                restore_name="$2"
                shift 2
                ;;
            -n|--name)
                backup_name="$2"
                shift 2
                ;;
            -q|--quiet)
                QUIET=true
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    check_dependencies
    
    # List backups
    if [[ "$list_only" == "true" ]]; then
        list_backups
        exit 0
    fi
    
    # Restore backup
    if [[ -n "$restore_name" ]]; then
        restore_backup "$restore_name"
        exit 0
    fi
    
    # Create backup
    if [[ -z "$backup_name" ]]; then
        backup_name=$(date +%Y%m%d_%H%M%S)
    fi
    
    local backup_dir="$BACKUP_BASE_DIR/$backup_name"
    
    print_header "Configuration Backup Script"
    print_info "Backup location: $backup_dir"
    
    create_backup_dir "$backup_dir"
    backup_configs "$backup_dir"
    
    if [[ "$compress" == "true" ]]; then
        compress_backup "$backup_dir"
    fi
    
    print_header "Backup Complete"
    print_success "Your configurations have been backed up successfully!"
}

main "$@"