# Advanced Configurations

This guide covers advanced configuration techniques for power users who want to push their setup further.

## Multi-Monitor Setups

### i3wm Multi-Monitor

#### XRandR Configuration

```bash
# List monitors
xrandr --listmonitors

# Configure monitors
xrandr --output DP-1 --primary --mode 1920x1080 --rate 144 --pos 0x0
xrandr --output HDMI-1 --mode 1920x1080 --rate 60 --pos 1920x0

# Add to i3 config
exec_always xrandr --output DP-1 --primary --mode 1920x1080 --rate 144 --pos 0x0 --output HDMI-1 --mode 1920x1080 --rate 60 --pos 1920x0
```

#### Workspace Per Monitor

```bash
# Assign workspaces to specific monitors
workspace $ws1 output DP-1
workspace $ws2 output DP-1
workspace $ws3 output DP-1
workspace $ws4 output DP-1
workspace $ws5 output DP-1
workspace $ws6 output HDMI-1
workspace $ws7 output HDMI-1
workspace $ws8 output HDMI-1
workspace $ws9 output HDMI-1
workspace $ws10 output HDMI-1
```

#### Focus Monitor

```bash
# Move focus between monitors
bindsym $mod+comma focus output left
bindsym $mod+period focus output right

# Move workspace to another monitor
bindsym $mod+Shift+comma move workspace to output left
bindsym $mod+Shift+period move workspace to output right
```

### Hyprland Multi-Monitor

#### Monitor Configuration

```bash
# Configure monitors
monitor=DP-1,1920x1080@144,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1

# Vertical stacking
monitor=DP-1,1920x1080@144,0x0,1
monitor=HDMI-A-1,1920x1080@60,0x1080,1

# Mixed DPI
monitor=eDP-1,2560x1440@60,0x0,1.5
monitor=HDMI-A-1,1920x1080@60,2560x0,1

# Disable monitor
monitor=HDMI-A-1,disable
```

#### Workspace Per Monitor

```bash
# Bind workspaces to monitors
workspace=1,monitor:DP-1,default:true
workspace=2,monitor:DP-1
workspace=3,monitor:DP-1
workspace=6,monitor:HDMI-A-1,default:true
workspace=7,monitor:HDMI-A-1
workspace=8,monitor:HDMI-A-1
```

#### Focus Monitor

```bash
# Move focus between monitors
bind = $mainMod, comma, focusmonitor, l
bind = $mainMod, period, focusmonitor, r

# Move workspace to monitor
bind = $mainMod SHIFT, comma, movecurrentworkspacetomonitor, l
bind = $mainMod SHIFT, period, movecurrentworkspacetomonitor, r
```

## Per-Application Settings

### i3wm Advanced Rules

```bash
# Complex criteria
for_window [class="^Firefox$" title="^Mozilla Firefox$"] move to workspace $ws2
for_window [class="firefox" instance="Navigator"] border pixel 2

# Multiple conditions
for_window [class="Spotify" window_role="browser"] move to workspace $ws10, floating enable

# Regex matching
for_window [title="^scratch_.*"] move scratchpad

# Window size and position
for_window [class="mpv"] floating enable, resize set 800 600, move position center

# Startup position
for_window [class="discord"] move to workspace $ws4, layout tabbed

# No focus
for_window [class="Steam" title="^Steam$"] move to workspace $ws5
no_focus [class="Steam" title="^Steam$"]
```

### Hyprland Advanced Rules

```bash
# Window rules v2
windowrulev2 = float, class:^(pavucontrol)$
windowrulev2 = size 800 600, class:^(pavucontrol)$
windowrulev2 = center, class:^(pavucontrol)$

# Conditional rules
windowrulev2 = float, class:^(firefox)$, title:^(Picture-in-Picture)$
windowrulev2 = pin, class:^(firefox)$, title:^(Picture-in-Picture)$

# Workspace rules
windowrulev2 = workspace 2 silent, class:^(code)$
windowrulev2 = workspace 3 silent, class:^(discord)$

# Opacity
windowrulev2 = opacity 0.9 0.8, class:^(Alacritty)$
windowrulev2 = opacity 1.0 override, class:^(mpv)$

# Animations
windowrulev2 = animation slide, class:^(rofi)$

# Layers
windowrulev2 = stayfocused, class:^(rofi)$

# No blur
windowrulev2 = noblur, class:^(firefox)$
```

## Custom Layouts

### i3wm Layout Saving/Loading

```bash
# Save layout
i3-save-tree --workspace 1 > ~/.config/i3/workspace1.json

# Edit to keep only useful info
# Remove "instance", "window_role", etc.

# Load layout
i3-msg "workspace 1; append_layout ~/.config/i3/workspace1.json"

# Launch applications
firefox &
code &
alacritty &
```

### Hyprland Custom Layouts

```bash
# Master layout configuration
master {
    new_is_master = false
    new_on_top = false
    no_gaps_when_only = false
    orientation = left
    inherit_fullscreen = true
    always_center_master = false
    mfact = 0.55
}

# Dwindle layout
dwindle {
    pseudotile = yes
    preserve_split = yes
    special_scale_factor = 0.8
    split_width_multiplier = 1.0
    no_gaps_when_only = false
    use_active_for_splits = true
    default_split_ratio = 1.0
}
```

## IPC Advanced Usage

### i3wm IPC Examples

```bash
# Get workspace info
i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .name'

# Get window info
i3-msg -t get_tree | jq '.. | select(.focused?==true) | .window_properties'

# Subscribe to events
i3-msg -t subscribe -m '["workspace","window"]' | while read event; do
    echo "Event: $event"
done

# Complex commands
i3-msg '[class="firefox"] focus; split v; exec alacritty'
```

### Hyprland IPC Examples

```bash
# Get active window
hyprctl activewindow -j | jq '.class'

# Get all windows
hyprctl clients -j | jq '.[] | {class, title}'

# Listen to events
socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read line; do
    echo "Event: $line"
done

# Batch commands
hyprctl --batch "dispatch workspace 2; dispatch exec firefox; dispatch workspace 3; dispatch exec code"
```

## Performance Optimization

### i3wm Performance

```bash
# Disable title bars (saves resources)
for_window [class=".*"] border pixel 2

# Reduce status bar updates
bar {
    status_command i3status
    # Or use polybar with less frequent updates
}

# Optimize picom
# In picom.conf:
backend = "glx";
vsync = true;
use-damage = true;
glx-no-stencil = true;
glx-no-rebind-pixmap = true;
```

### Hyprland Performance

```bash
# Reduce animations
animations {
    enabled = yes
    bezier = linear, 0, 0, 1, 1
    animation = windows, 1, 2, linear
    animation = windowsOut, 1, 2, linear
    animation = fade, 1, 2, linear
    animation = workspaces, 1, 2, linear
}

# Disable blur on fullscreen
windowrulev2 = noblur, fullscreen:1

# Optimize rendering
render {
    explicit_sync = 1
    direct_scanout = true
}

misc {
    vfr = true
    vrr = 1
}
```

## Security Configurations

### Screen Locker Integration

```bash
# i3lock with auto-lock
exec --no-startup-id xss-lock -- i3lock -n -c 000000

# Hyprland with hypridle
# ~/.config/hypr/hypridle.conf
general {
    lock_cmd = pidof hyprlock || hyprlock
    before_sleep_cmd = loginctl lock-session
    after_sleep_cmd = hyprctl dispatch dpms on
}

listener {
    timeout = 300
    on-timeout = brightnessctl -s set 10
    on-resume = brightnessctl -r
}

listener {
    timeout = 600
    on-timeout = loginctl lock-session
}

listener {
    timeout = 900
    on-timeout = hyprctl dispatch dpms off
    on-resume = hyprctl dispatch dpms on
}
```

### Secure Configuration

```bash
# Disable remote X11 connections (i3)
export XAUTHORITY=~/.Xauthority

# Use separate X server
startx -- :1

# Wayland is more secure by default
```

## Plugin Systems

### Hyprland Plugins

```bash
# Install hyprpm
hyprpm update

# Add plugin
hyprpm add https://github.com/user/plugin

# Enable plugin
hyprpm enable plugin-name

# List plugins
hyprpm list

# In hyprland.conf
plugin = /path/to/plugin.so
```

### Popular Plugins

- **Hyprspace**: Overview/expose effect
- **hy3**: Alternative tiling layout
- **hypr-dynamic-cursors**: Animated cursors
- **split-monitor-workspaces**: Per-monitor workspace management

## Integration with Desktop Services

### D-Bus Integration

```bash
# Monitor notifications
dbus-monitor "interface='org.freedesktop.Notifications'"

# Send notifications
gdbus call --session \
    --dest org.freedesktop.Notifications \
    --object-path /org/freedesktop/Notifications \
    --method org.freedesktop.Notifications.Notify \
    "App" 0 "icon" "Title" "Body" "[]" "{}" 5000
```

### Portal Integration (Wayland)

```bash
# Install xdg-desktop-portal
sudo pacman -S xdg-desktop-portal-gtk xdg-desktop-portal-hyprland

# Start portals
/usr/lib/xdg-desktop-portal-hyprland
/usr/lib/xdg-desktop-portal

# Configure
# ~/.config/xdg-desktop-portal/hyprland-portals.conf
[preferred]
default=hyprland;gtk
org.freedesktop.impl.portal.Screenshot=hyprland
org.freedesktop.impl.portal.ScreenCast=hyprland
```

## Remote Control

### SSH Control

```bash
# Remote i3 control
ssh user@host "DISPLAY=:0 i3-msg workspace 2"

# Remote Hyprland control
ssh user@host "HYPRLAND_INSTANCE_SIGNATURE=... hyprctl dispatch workspace 2"
```

### HTTP API (Custom)

```bash
#!/bin/bash
# Simple HTTP API for window manager control

while true; do
    REQUEST=$(echo -e "HTTP/1.1 200 OK\n\n" | nc -l 8080)
    COMMAND=$(echo "$REQUEST" | grep "GET" | cut -d' ' -f2 | cut -d'/' -f2)
    
    case $COMMAND in
        "workspace"*)
            WS=$(echo "$COMMAND" | cut -d'/' -f2)
            i3-msg "workspace $WS"
            ;;
    esac
done
```

## Configuration Management

### Git-based Dotfiles

```bash
# Initialize dotfiles repo
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no

# Add files
dotfiles add .config/i3/config
dotfiles add .config/hypr/hyprland.conf
dotfiles commit -m "Initial commit"
dotfiles remote add origin git@github.com:user/dotfiles.git
dotfiles push
```

### GNU Stow Method

```bash
# Structure
dotfiles/
├── i3/
│   └── .config/i3/config
├── hyprland/
│   └── .config/hypr/hyprland.conf
└── alacritty/
    └── .config/alacritty/alacritty.yml

# Deploy
cd ~/dotfiles
stow i3
stow hyprland
stow alacritty
```

## Testing Configurations

### Safe Testing

```bash
# Test i3 config
i3 -C

# Run i3 in nested X session
Xephyr :1 -screen 1920x1080 &
DISPLAY=:1 i3

# Test Hyprland in nested session
Hyprland -c ~/.config/hypr/test.conf
```

### Configuration Validation

```bash
#!/bin/bash
# Validate i3 config

if i3 -C; then
    echo "Configuration valid"
    i3-msg reload
else
    echo "Configuration has errors"
    exit 1
fi
```

## Troubleshooting Advanced Issues

### Debug Mode

```bash
# i3 debug logging
i3 --shmlog-size=26214400
i3-dump-log > /tmp/i3.log

# Hyprland debug
HYPRLAND_LOG_WLR=1 Hyprland
```

### Performance Profiling

```bash
# Profile startup
systemd-analyze blame --user

# Monitor resource usage
htop -p $(pgrep -d',' i3)
htop -p $(pgrep -d',' Hyprland)
```

## Resources

- i3 User Guide: https://i3wm.org/docs/userguide.html
- Hyprland Wiki: https://wiki.hyprland.org
- Arch Wiki: Comprehensive documentation
- r/unixporn: Community inspiration

## Conclusion

Advanced configurations allow you to extract maximum value from your window manager. Experiment carefully, document your changes, and always keep backups. The possibilities are limited only by your imagination and scripting skills.