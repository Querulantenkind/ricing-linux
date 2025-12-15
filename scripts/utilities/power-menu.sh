#!/usr/bin/env bash

################################################################################
# Power Menu
################################################################################
# Presents a simple power menu using rofi/dmenu (if available) or a simple
# terminal prompt. Options: Lock, Suspend, Reboot, Shutdown, Logout
################################################################################

set -euo pipefail

MENU_CMD=$(command -v rofi || command -v dmenu || true)
LOCK_CMD=""
if command -v hyprlock &>/dev/null; then
    LOCK_CMD="hyprlock -d"
elif command -v swaylock &>/dev/null; then
    LOCK_CMD="swaylock"
elif command -v i3lock &>/dev/null; then
    LOCK_CMD="i3lock -c 000000"
fi

show_help() {
    cat <<EOF
Power Menu

Usage: $(basename "$0") [--no-confirm]

Options:
  --no-confirm    Do not ask for confirmation for destructive actions
  -h              Show help
EOF
}

NO_CONFIRM=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --no-confirm) NO_CONFIRM=true; shift ;;
        -h|--help) show_help; exit 0 ;;
        *) echo "Unknown option: $1"; show_help; exit 1 ;;
    esac
done

options=("Lock" "Suspend" "Reboot" "Shutdown" "Logout" "Cancel")

if [[ -n "$MENU_CMD" ]]; then
    choice=$(printf '%s\n' "${options[@]}" | $MENU_CMD -p "Power" -i -no-custom)
else
    echo "Select an option:"; printf '%s\n' "${options[@]}"
    read -r choice
fi

confirm() {
    if [[ "$NO_CONFIRM" == true ]]; then
        return 0
    fi
    read -rp "$1 [y/N] " -n 1 -r; echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

case "$choice" in
    Lock)
        if [[ -n "$LOCK_CMD" ]]; then
            eval "$LOCK_CMD" &
        else
            echo "No lock command found"
            exit 1
        fi
        ;;
    Suspend)
        if confirm "Suspend now?"; then
            systemctl suspend
        fi
        ;;
    Reboot)
        if confirm "Reboot now?"; then
            systemctl reboot
        fi
        ;;
    Shutdown)
        if confirm "Shutdown now?"; then
            systemctl poweroff
        fi
        ;;
    Logout)
        if confirm "Logout now?"; then
            # Try common session managers
            if command -v hyprctl &>/dev/null && [[ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
                hyprctl dispatch exit
            elif command -v i3-msg &>/dev/null; then
                i3-msg exit
            else
                echo "Unable to determine session to logout. Use your session manager."; exit 1
            fi
        fi
        ;;
    *)
        exit 0
        ;;
esac
