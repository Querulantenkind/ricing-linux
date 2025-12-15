# Scripting and Automation

This guide covers how to create scripts and automate tasks in your window manager setup.

## Why Script Your Window Manager?

- **Efficiency**: Automate repetitive tasks
- **Customization**: Create workflows specific to you
- **Integration**: Connect different tools together
- **Power**: Leverage full system capabilities
- **Learning**: Deepen understanding of your system

## Scripting Basics

### Shell Choice

**Bash** (Universal, reliable):
```bash
#!/bin/bash
echo "Hello from bash"
```

**Zsh** (Feature-rich, modern):
```bash
#!/bin/zsh
echo "Hello from zsh"
```

**Fish** (User-friendly, different syntax):
```fish
#!/usr/bin/fish
echo "Hello from fish"
```

Most scripts use bash for compatibility.

### Script Structure

```bash
#!/bin/bash
# Script description
# Author: Your Name
# Date: YYYY-MM-DD

# Exit on error
set -e

# Variables
VARIABLE="value"

# Functions
function do_something() {
    echo "Doing something"
}

# Main logic
do_something

echo "Script complete"
```

### Making Scripts Executable

```bash
# Make executable
chmod +x script.sh

# Run script
./script.sh

# Or
bash script.sh
```

## Common Automation Tasks

### Screenshot Scripts

#### i3wm Screenshot (scrot)

```bash
#!/bin/bash
# ~/.config/scripts/screenshot.sh

DIR="$HOME/Pictures/screenshots"
mkdir -p "$DIR"
FILE="$DIR/screenshot-$(date +%Y%m%d-%H%M%S).png"

case "$1" in
    full)
        scrot "$FILE"
        ;;
    window)
        scrot -u "$FILE"
        ;;
    select)
        scrot -s "$FILE"
        ;;
    *)
        echo "Usage: $0 {full|window|select}"
        exit 1
        ;;
esac

# Copy to clipboard
xclip -selection clipboard -t image/png -i "$FILE"

# Show notification
notify-send "Screenshot" "Saved to $FILE" -i "$FILE"
```

#### Hyprland Screenshot (grim)

```bash
#!/bin/bash
# ~/.config/hypr/scripts/screenshot.sh

DIR="$HOME/Pictures/screenshots"
mkdir -p "$DIR"
FILE="$DIR/screenshot-$(date +%Y%m%d-%H%M%S).png"

case "$1" in
    full)
        grim "$FILE"
        ;;
    window)
        # Get active window geometry
        grim -g "$(hyprctl -j activewindow | jq -r '.at[0],.at[1],.size[0],.size[1] | @csv' | tr ',' ' ' | xargs printf '%d,%d %dx%d')" "$FILE"
        ;;
    select)
        grim -g "$(slurp)" "$FILE"
        ;;
    *)
        echo "Usage: $0 {full|window|select}"
        exit 1
        ;;
esac

# Copy to clipboard
wl-copy < "$FILE"

# Show notification
notify-send "Screenshot" "Saved to $FILE"
```

**Keybindings:**
```bash
# i3
bindsym Print exec ~/.config/scripts/screenshot.sh full
bindsym Shift+Print exec ~/.config/scripts/screenshot.sh select
bindsym $mod+Print exec ~/.config/scripts/screenshot.sh window

# Hyprland
bind = , Print, exec, ~/.config/hypr/scripts/screenshot.sh full
bind = SHIFT, Print, exec, ~/.config/hypr/scripts/screenshot.sh select
bind = $mainMod, Print, exec, ~/.config/hypr/scripts/screenshot.sh window
```

### Power Menu

```bash
#!/bin/bash
# ~/.config/scripts/power-menu.sh

# Options
options="Lock\nSuspend\nLogout\nReboot\nShutdown"

# Rofi/Wofi selection
if command -v rofi &> /dev/null; then
    chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")
elif command -v wofi &> /dev/null; then
    chosen=$(echo -e "$options" | wofi --dmenu -p "Power Menu")
else
    echo "No launcher found"
    exit 1
fi

# Execute action
case $chosen in
    Lock)
        if command -v i3lock &> /dev/null; then
            i3lock -c 000000
        elif command -v hyprlock &> /dev/null; then
            hyprlock
        fi
        ;;
    Suspend)
        systemctl suspend
        ;;
    Logout)
        if pgrep -x i3 > /dev/null; then
            i3-msg exit
        elif pgrep -x Hyprland > /dev/null; then
            hyprctl dispatch exit
        fi
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
esac
```

### Volume Control

```bash
#!/bin/bash
# ~/.config/scripts/volume.sh

get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1
}

get_mute() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'yes' && echo "muted" || echo "unmuted"
}

case "$1" in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

# Send notification
VOLUME=$(get_volume)
STATUS=$(get_mute)

if [ "$STATUS" = "muted" ]; then
    notify-send "Volume" "Muted" -h int:value:0 -t 1000
else
    notify-send "Volume" "$VOLUME%" -h int:value:"$VOLUME" -t 1000
fi
```

### Brightness Control

```bash
#!/bin/bash
# ~/.config/scripts/brightness.sh

get_brightness() {
    brightnessctl get
}

get_max() {
    brightnessctl max
}

get_percent() {
    echo $(($(get_brightness) * 100 / $(get_max)))
}

case "$1" in
    up)
        brightnessctl set +5%
        ;;
    down)
        brightnessctl set 5%-
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

# Send notification
PERCENT=$(get_percent)
notify-send "Brightness" "$PERCENT%" -h int:value:"$PERCENT" -t 1000
```

## Window Manager Automation

### Workspace Automation

#### Auto-assign Applications

```bash
#!/bin/bash
# ~/.config/scripts/workspace-setup.sh

# i3 example
if pgrep -x i3 > /dev/null; then
    i3-msg 'workspace 1; exec firefox'
    sleep 1
    i3-msg 'workspace 2; exec code'
    sleep 1
    i3-msg 'workspace 3; exec alacritty'
    sleep 1
    i3-msg 'workspace 4; exec discord'
fi

# Hyprland example
if pgrep -x Hyprland > /dev/null; then
    hyprctl dispatch workspace 1
    hyprctl dispatch exec firefox
    sleep 1
    hyprctl dispatch workspace 2
    hyprctl dispatch exec code
    sleep 1
    hyprctl dispatch workspace 3
    hyprctl dispatch exec alacritty
    sleep 1
    hyprctl dispatch workspace 4
    hyprctl dispatch exec discord
fi
```

### Theme Switcher

```bash
#!/bin/bash
# themes/apply-theme.sh

THEME="$1"
CONFIG_DIR="$HOME/.config"
THEME_DIR="$HOME/Documents/ricing-linux/themes"

if [ -z "$THEME" ]; then
    echo "Usage: $0 <theme-name>"
    echo "Available themes:"
    ls -1 "$THEME_DIR"
    exit 1
fi

if [ ! -d "$THEME_DIR/$THEME" ]; then
    echo "Theme $THEME not found"
    exit 1
fi

echo "Applying theme: $THEME"

# Source color definitions
source "$THEME_DIR/$THEME/colors.conf"

# Update i3 config
if [ -f "$CONFIG_DIR/i3/config" ]; then
    sed -i "s|source.*colors\.conf|source $THEME_DIR/$THEME/colors.conf|" "$CONFIG_DIR/i3/config"
    i3-msg reload
fi

# Update Hyprland config
if [ -f "$CONFIG_DIR/hypr/hyprland.conf" ]; then
    sed -i "s|source.*colors\.conf|source = $THEME_DIR/$THEME/colors.conf|" "$CONFIG_DIR/hypr/hyprland.conf"
    hyprctl reload
fi

# Update terminal
if [ -f "$CONFIG_DIR/alacritty/alacritty.yml" ]; then
    cp "$THEME_DIR/$THEME/alacritty.yml" "$CONFIG_DIR/alacritty/"
fi

# Update waybar/polybar
if [ -f "$CONFIG_DIR/waybar/style.css" ]; then
    cp "$THEME_DIR/$THEME/waybar-style.css" "$CONFIG_DIR/waybar/style.css"
    pkill -SIGUSR2 waybar
fi

if [ -f "$CONFIG_DIR/polybar/config.ini" ]; then
    cp "$THEME_DIR/$THEME/polybar-colors.ini" "$CONFIG_DIR/polybar/colors.ini"
    ~/.config/polybar/launch.sh
fi

echo "Theme $THEME applied successfully"
```

## System Integration

### Startup Script

```bash
#!/bin/bash
# ~/.config/scripts/startup.sh

# Wait for window manager
sleep 2

# Set wallpaper
if command -v feh &> /dev/null; then
    feh --bg-scale ~/Pictures/wallpapers/current.jpg &
elif command -v hyprpaper &> /dev/null; then
    hyprpaper &
fi

# Start compositor (if i3)
if pgrep -x i3 > /dev/null; then
    picom -b
fi

# Start status bar
if command -v waybar &> /dev/null && pgrep -x Hyprland > /dev/null; then
    waybar &
elif command -v polybar &> /dev/null; then
    ~/.config/polybar/launch.sh &
fi

# Notification daemon
if ! pgrep -x dunst > /dev/null; then
    dunst &
fi

# Network manager applet
nm-applet --indicator &

# Bluetooth manager
blueman-applet &

# Clipboard manager (Wayland)
if pgrep -x Hyprland > /dev/null; then
    wl-paste --watch cliphist store &
fi

# Polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

echo "Startup complete"
```

### Backup Script

```bash
#!/bin/bash
# scripts/automation/backup-configs.sh

BACKUP_DIR="$HOME/backups/dotfiles"
DATE=$(date +%Y%m%d-%H%M%S)
BACKUP_FILE="$BACKUP_DIR/config-backup-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "Creating backup..."

tar -czf "$BACKUP_FILE" \
    -C "$HOME" \
    .config/i3 \
    .config/hypr \
    .config/waybar \
    .config/polybar \
    .config/alacritty \
    .config/kitty \
    .config/rofi \
    .config/wofi \
    .config/dunst \
    .config/picom \
    .config/nvim \
    .zshrc \
    .bashrc \
    2>/dev/null

echo "Backup created: $BACKUP_FILE"

# Keep only last 5 backups
cd "$BACKUP_DIR"
ls -t config-backup-*.tar.gz | tail -n +6 | xargs -r rm

echo "Old backups cleaned up"
```

## Advanced Scripts

### Window Switcher

```bash
#!/bin/bash
# ~/.config/scripts/window-switcher.sh

if pgrep -x i3 > /dev/null; then
    i3-msg -t get_tree | \
        jq -r '.nodes[].nodes[].nodes[] | select(.window_properties) | "\(.window_properties.class): \(.name)"' | \
        rofi -dmenu -i -p "Switch to" | \
        cut -d: -f1 | \
        xargs -I {} i3-msg '[class="{}"] focus'
elif pgrep -x Hyprland > /dev/null; then
    hyprctl clients -j | \
        jq -r '.[] | "\(.class): \(.title)"' | \
        wofi --dmenu -p "Switch to" | \
        cut -d: -f1 | \
        xargs -I {} hyprctl dispatch focuswindow "class:{}"
fi
```

### Dynamic Wallpaper

```bash
#!/bin/bash
# ~/.config/scripts/dynamic-wallpaper.sh

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
HOUR=$(date +%H)

# Select wallpaper based on time
if [ $HOUR -ge 6 ] && [ $HOUR -lt 12 ]; then
    WALLPAPER="$WALLPAPER_DIR/morning.jpg"
elif [ $HOUR -ge 12 ] && [ $HOUR -lt 18 ]; then
    WALLPAPER="$WALLPAPER_DIR/afternoon.jpg"
elif [ $HOUR -ge 18 ] && [ $HOUR -lt 22 ]; then
    WALLPAPER="$WALLPAPER_DIR/evening.jpg"
else
    WALLPAPER="$WALLPAPER_DIR/night.jpg"
fi

# Set wallpaper
if command -v feh &> /dev/null; then
    feh --bg-scale "$WALLPAPER"
elif command -v hyprpaper &> /dev/null; then
    hyprctl hyprpaper wallpaper ",${WALLPAPER}"
fi
```

## Systemd Integration

### Create User Service

```ini
# ~/.config/systemd/user/dynamic-wallpaper.service
[Unit]
Description=Dynamic Wallpaper Changer

[Service]
Type=oneshot
ExecStart=%h/.config/scripts/dynamic-wallpaper.sh

[Install]
WantedBy=default.target
```

### Timer for Regular Execution

```ini
# ~/.config/systemd/user/dynamic-wallpaper.timer
[Unit]
Description=Change wallpaper hourly

[Timer]
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target
```

**Enable:**
```bash
systemctl --user enable --now dynamic-wallpaper.timer
```

## Debugging Scripts

### Add Logging

```bash
#!/bin/bash

LOGFILE="$HOME/.local/share/scripts/script.log"
mkdir -p "$(dirname "$LOGFILE")"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" >> "$LOGFILE"
}

log "Script started"
# Your script here
log "Script completed"
```

### Error Handling

```bash
#!/bin/bash
set -euo pipefail  # Exit on error, undefined vars, pipe failures

trap 'echo "Error on line $LINENO"' ERR

# Your script here
```

## Script Repository Structure

```
scripts/
├── automation/
│   ├── backup-configs.sh
│   ├── rice-switcher.sh
│   └── update-system.sh
├── installation/
│   ├── install-dependencies.sh
│   ├── install-hyprland.sh
│   └── install-i3wm.sh
└── utilities/
    ├── audio-control.sh
    ├── brightness.sh
    ├── power-menu.sh
    ├── screen-record.sh
    └── screenshot.sh
```

## Best Practices

1. **Start with shebang**: `#!/bin/bash`
2. **Use set -e**: Exit on errors
3. **Check dependencies**: Verify commands exist
4. **Add help text**: Usage instructions
5. **Log actions**: For debugging
6. **Test incrementally**: Small changes
7. **Version control**: Use git
8. **Document**: Comments and README

## Next Steps

With automation mastered:
1. Explore advanced features: [Advanced Configurations](08-advanced-configurations.md)
2. Share your scripts with the community
3. Contribute to this repository

## Resources

- Bash Guide: mywiki.wooledge.org/BashGuide
- ShellCheck: Online shell script validator
- Advanced Bash Scripting Guide
- This repository's scripts/ directory

## Conclusion

Scripting transforms your window manager from a tool into a personalized system. Start with simple scripts, gradually add complexity, and build a suite of automation that matches your workflow perfectly.