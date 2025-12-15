#!/bin/bash

################################################################################
# System Update Helper Script
################################################################################
#
# PURPOSE:
#   Comprehensive system update script that handles package updates,
#   AUR helpers, flatpak, and optional cleanup operations.
#
# USAGE:
#   ./update-system.sh [OPTIONS]
#
# OPTIONS:
#   -a, --all              Run all update operations
#   -s, --system           Update system packages only
#   -f, --flatpak          Update flatpak packages only
#   -c, --clean            Clean package cache and orphans
#   -n, --notify           Send desktop notification on completion
#   -y, --yes              Skip confirmation prompts
#   -q, --quiet            Minimal output
#   -h, --help             Show this help message
#
# EXAMPLES:
#   ./update-system.sh              # Interactive system update
#   ./update-system.sh -a           # Full update with all options
#   ./update-system.sh -s -c        # Update system and clean cache
#   ./update-system.sh -a -y -n     # Full auto update with notification
#
################################################################################

set -e

# =============================================================================
# Configuration
# =============================================================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m'

# Logging
LOG_FILE="/tmp/system-update-$(date +%Y%m%d).log"

# =============================================================================
# Helper Functions
# =============================================================================

print_info() {
    [[ "$QUIET" != "true" ]] && echo -e "${BLUE}[INFO]${NC} $1"
    echo "[$(date '+%H:%M:%S')] INFO: $1" >> "$LOG_FILE"
}

print_success() {
    [[ "$QUIET" != "true" ]] && echo -e "${GREEN}[SUCCESS]${NC} $1"
    echo "[$(date '+%H:%M:%S')] SUCCESS: $1" >> "$LOG_FILE"
}

print_warning() {
    [[ "$QUIET" != "true" ]] && echo -e "${YELLOW}[WARNING]${NC} $1"
    echo "[$(date '+%H:%M:%S')] WARNING: $1" >> "$LOG_FILE"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
    echo "[$(date '+%H:%M:%S')] ERROR: $1" >> "$LOG_FILE"
}

print_header() {
    [[ "$QUIET" != "true" ]] && echo -e "\n${BOLD}${CYAN}══════════════════════════════════════════${NC}"
    [[ "$QUIET" != "true" ]] && echo -e "${BOLD}${CYAN}  $1${NC}"
    [[ "$QUIET" != "true" ]] && echo -e "${BOLD}${CYAN}══════════════════════════════════════════${NC}\n"
}

print_section() {
    [[ "$QUIET" != "true" ]] && echo -e "\n${MAGENTA}▸ $1${NC}"
}

show_help() {
    cat << EOF
${BOLD}System Update Helper Script${NC}

${CYAN}USAGE:${NC}
    $(basename "$0") [OPTIONS]

${CYAN}OPTIONS:${NC}
    -a, --all              Run all update operations
    -s, --system           Update system packages only
    -f, --flatpak          Update flatpak packages only
    -c, --clean            Clean package cache and orphans
    -n, --notify           Send desktop notification on completion
    -y, --yes              Skip confirmation prompts
    -q, --quiet            Minimal output
    -h, --help             Show this help message

${CYAN}EXAMPLES:${NC}
    $(basename "$0")                  # Interactive system update
    $(basename "$0") -a               # Full update with all options
    $(basename "$0") -s -c            # Update system and clean cache
    $(basename "$0") -a -y -n         # Full auto update with notification

${CYAN}SUPPORTED PACKAGE MANAGERS:${NC}
    • pacman (Arch Linux)
    • yay, paru (AUR helpers)
    • apt (Debian/Ubuntu)
    • dnf (Fedora)
    • flatpak

${CYAN}LOG FILE:${NC}
    $LOG_FILE

EOF
}

send_notification() {
    local title="$1"
    local message="$2"
    local urgency="${3:-normal}"
    
    if command -v notify-send &> /dev/null; then
        notify-send -u "$urgency" "$title" "$message"
    fi
}

confirm_action() {
    local message="$1"
    
    if [[ "$AUTO_YES" == "true" ]]; then
        return 0
    fi
    
    read -p "$message [y/N] " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

# =============================================================================
# Detection Functions
# =============================================================================

detect_distro() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo "$ID"
    elif [[ -f /etc/arch-release ]]; then
        echo "arch"
    elif [[ -f /etc/debian_version ]]; then
        echo "debian"
    elif [[ -f /etc/fedora-release ]]; then
        echo "fedora"
    else
        echo "unknown"
    fi
}

detect_aur_helper() {
    if command -v paru &> /dev/null; then
        echo "paru"
    elif command -v yay &> /dev/null; then
        echo "yay"
    elif command -v trizen &> /dev/null; then
        echo "trizen"
    else
        echo ""
    fi
}

# =============================================================================
# Update Functions
# =============================================================================

update_arch() {
    local aur_helper=$(detect_aur_helper)
    
    print_section "Updating Arch Linux packages"
    
    if [[ -n "$aur_helper" ]]; then
        print_info "Using AUR helper: $aur_helper"
        
        if [[ "$AUTO_YES" == "true" ]]; then
            $aur_helper -Syu --noconfirm
        else
            $aur_helper -Syu
        fi
    else
        print_info "Using pacman (no AUR helper detected)"
        
        if [[ "$AUTO_YES" == "true" ]]; then
            sudo pacman -Syu --noconfirm
        else
            sudo pacman -Syu
        fi
    fi
    
    print_success "Arch packages updated"
}

update_debian() {
    print_section "Updating Debian/Ubuntu packages"
    
    sudo apt update
    
    if [[ "$AUTO_YES" == "true" ]]; then
        sudo apt upgrade -y
        sudo apt dist-upgrade -y
    else
        sudo apt upgrade
        sudo apt dist-upgrade
    fi
    
    print_success "Debian/Ubuntu packages updated"
}

update_fedora() {
    print_section "Updating Fedora packages"
    
    if [[ "$AUTO_YES" == "true" ]]; then
        sudo dnf upgrade -y
    else
        sudo dnf upgrade
    fi
    
    print_success "Fedora packages updated"
}

update_flatpak() {
    if ! command -v flatpak &> /dev/null; then
        print_warning "Flatpak is not installed"
        return
    fi
    
    print_section "Updating Flatpak packages"
    
    if [[ "$AUTO_YES" == "true" ]]; then
        flatpak update -y
    else
        flatpak update
    fi
    
    print_success "Flatpak packages updated"
}

update_system_packages() {
    local distro=$(detect_distro)
    
    print_header "System Package Update"
    print_info "Detected distribution: $distro"
    
    case "$distro" in
        arch|manjaro|endeavouros|artix)
            update_arch
            ;;
        debian|ubuntu|linuxmint|pop)
            update_debian
            ;;
        fedora)
            update_fedora
            ;;
        *)
            print_error "Unsupported distribution: $distro"
            print_info "Please update manually using your package manager"
            return 1
            ;;
    esac
}

# =============================================================================
# Cleanup Functions
# =============================================================================

clean_arch() {
    local aur_helper=$(detect_aur_helper)
    
    print_section "Cleaning Arch Linux system"
    
    # Remove orphaned packages
    print_info "Checking for orphaned packages..."
    local orphans=$(pacman -Qtdq 2>/dev/null || true)
    
    if [[ -n "$orphans" ]]; then
        print_info "Found orphaned packages:"
        echo "$orphans"
        
        if confirm_action "Remove orphaned packages?"; then
            sudo pacman -Rns $(pacman -Qtdq) --noconfirm
            print_success "Orphaned packages removed"
        fi
    else
        print_info "No orphaned packages found"
    fi
    
    # Clean package cache
    print_info "Cleaning package cache..."
    
    if command -v paccache &> /dev/null; then
        sudo paccache -r
        print_success "Package cache cleaned (keeping last 3 versions)"
    else
        print_warning "paccache not found. Install pacman-contrib for cache cleaning"
    fi
    
    # Clean AUR cache
    if [[ -n "$aur_helper" ]]; then
        print_info "Cleaning AUR build cache..."
        
        case "$aur_helper" in
            yay)
                yay -Sc --noconfirm
                ;;
            paru)
                paru -Sc --noconfirm
                ;;
        esac
        
        print_success "AUR cache cleaned"
    fi
}

clean_debian() {
    print_section "Cleaning Debian/Ubuntu system"
    
    print_info "Removing unused packages..."
    sudo apt autoremove -y
    
    print_info "Cleaning package cache..."
    sudo apt autoclean
    sudo apt clean
    
    print_success "System cleaned"
}

clean_fedora() {
    print_section "Cleaning Fedora system"
    
    print_info "Removing unused packages..."
    sudo dnf autoremove -y
    
    print_info "Cleaning package cache..."
    sudo dnf clean all
    
    print_success "System cleaned"
}

clean_flatpak() {
    if ! command -v flatpak &> /dev/null; then
        return
    fi
    
    print_section "Cleaning Flatpak"
    
    print_info "Removing unused Flatpak runtimes..."
    flatpak uninstall --unused -y 2>/dev/null || true
    
    print_success "Flatpak cleaned"
}

clean_system() {
    local distro=$(detect_distro)
    
    print_header "System Cleanup"
    
    case "$distro" in
        arch|manjaro|endeavouros|artix)
            clean_arch
            ;;
        debian|ubuntu|linuxmint|pop)
            clean_debian
            ;;
        fedora)
            clean_fedora
            ;;
        *)
            print_warning "Cleanup not supported for: $distro"
            ;;
    esac
    
    clean_flatpak
    
    # Clean common caches
    print_section "Cleaning user caches"
    
    # Clean thumbnail cache
    if [[ -d "$HOME/.cache/thumbnails" ]]; then
        local thumb_size=$(du -sh "$HOME/.cache/thumbnails" 2>/dev/null | cut -f1)
        print_info "Thumbnail cache size: $thumb_size"
        
        if confirm_action "Clean thumbnail cache?"; then
            rm -rf "$HOME/.cache/thumbnails"/*
            print_success "Thumbnail cache cleaned"
        fi
    fi
    
    # Show disk usage
    print_section "Disk Usage Summary"
    df -h / | tail -n 1 | awk '{print "Root partition: " $3 " used / " $2 " total (" $5 " used)"}'
}

# =============================================================================
# Summary Functions
# =============================================================================

show_summary() {
    local start_time="$1"
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    local minutes=$((duration / 60))
    local seconds=$((duration % 60))
    
    print_header "Update Summary"
    
    echo -e "${GREEN}✓${NC} Update completed successfully"
    echo -e "${BLUE}⏱${NC} Duration: ${minutes}m ${seconds}s"
    echo -e "${BLUE}📋${NC} Log file: $LOG_FILE"
    
    # Show what was updated
    local distro=$(detect_distro)
    
    case "$distro" in
        arch|manjaro|endeavouros|artix)
            local updated_count=$(grep -c "upgrading\|installing" "$LOG_FILE" 2>/dev/null || echo "0")
            echo -e "${BLUE}📦${NC} Packages processed: ~$updated_count"
            ;;
    esac
    
    if [[ "$NOTIFY" == "true" ]]; then
        send_notification "System Update Complete" "Update finished in ${minutes}m ${seconds}s"
    fi
}

# =============================================================================
# Main Script
# =============================================================================

main() {
    local do_system=false
    local do_flatpak=false
    local do_clean=false
    local do_all=false
    AUTO_YES=false
    QUIET=false
    NOTIFY=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -a|--all)
                do_all=true
                shift
                ;;
            -s|--system)
                do_system=true
                shift
                ;;
            -f|--flatpak)
                do_flatpak=true
                shift
                ;;
            -c|--clean)
                do_clean=true
                shift
                ;;
            -n|--notify)
                NOTIFY=true
                shift
                ;;
            -y|--yes)
                AUTO_YES=true
                shift
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
    
    # Initialize log
    echo "=== System Update Log - $(date) ===" > "$LOG_FILE"
    
    local start_time=$(date +%s)
    
    print_header "System Update Helper"
    print_info "Log file: $LOG_FILE"
    
    # Handle --all flag
    if [[ "$do_all" == "true" ]]; then
        do_system=true
        do_flatpak=true
        do_clean=true
    fi
    
    # Default to system update if nothing specified
    if [[ "$do_system" == "false" && "$do_flatpak" == "false" && "$do_clean" == "false" ]]; then
        do_system=true
    fi
    
    # Perform updates
    if [[ "$do_system" == "true" ]]; then
        update_system_packages
    fi
    
    if [[ "$do_flatpak" == "true" ]]; then
        print_header "Flatpak Update"
        update_flatpak
    fi
    
    if [[ "$do_clean" == "true" ]]; then
        clean_system
    fi
    
    show_summary "$start_time"
}

main "$@"