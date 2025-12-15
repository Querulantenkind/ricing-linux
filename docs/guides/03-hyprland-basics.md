# Hyprland Basics

This guide covers the fundamentals of using Hyprland, a modern dynamic tiling Wayland compositor.

## What is Hyprland?

Hyprland is a dynamic tiling Wayland compositor written in C++. It emphasizes:
- Beautiful animations and smooth transitions
- Wayland-native performance
- Extensive customization
- Modern features and active development
- Plugin support

## Installation

### Using This Repository's Script

```bash
cd ~/Documents/ricing-linux
./scripts/installation/install-hyprland.sh
```

This installs:
- Hyprland compositor
- Waybar (status bar)
- Wofi (application launcher)
- Mako or Dunst (notifications)
- Hyprpaper (wallpaper)
- Hypridle (idle management)
- Hyprlock (screen locker)

### Manual Installation

```bash
# Arch Linux
sudo pacman -S hyprland waybar wofi mako

# Additional tools
sudo pacman -S hyprpaper hypridle hyprlock

# Utilities
sudo pacman -S grim slurp wl-clipboard cliphist
```

## First Launch

### From Display Manager

1. Logout of current session
2. Select "Hyprland" from session menu
3. Login

### From TTY

```bash
# Switch to TTY (Ctrl+Alt+F2)
Hyprland
```

### What to Expect

On first launch:
- Empty desktop with wallpaper
- Status bar at top (if configured)
- No visible windows
- Smooth animations enabled

## Configuration File

### Location

```bash
~/.config/hypr/hyprland.conf
```

### Basic Structure

```bash
# Monitor configuration
monitor=,preferred,auto,1

# Autostart programs
exec-once = waybar
exec-once = mako

# Environment variables
env = XCURSOR_SIZE,24

# Input configuration
input {
    kb_layout = us
    follow_mouse = 1
    sensitivity = 0
}

# General settings
general {
    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = rgba(33ccffee)
    col.inactive_border = rgba(595959aa)
    layout = dwindle
}

# Decoration settings
decoration {
    rounding = 10
    blur {
        enabled = true
        size = 3
        passes = 1
    }
    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
}

# Animations
animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

# Keybindings
$mainMod = SUPER

bind = $mainMod, Q, exec, alacritty
bind = $mainMod, C, killactive
bind = $mainMod, M, exit
bind = $mainMod, R, exec, wofi --show drun

# Window management
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Workspaces
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
# ... (continue for workspaces 3-10)

# Move windows to workspace
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
# ... (continue for workspaces 3-10)
```

## Essential Keybindings

### Window Management

```bash
# Terminal
Super + Q

# Close window
Super + C

# Application launcher
Super + R

# Toggle floating
Super + V

# Fullscreen
Super + F

# Exit Hyprland
Super + M
```

### Navigation

```bash
# Move focus
Super + Arrow Keys
Super + h/j/k/l (vim-style)

# Move windows
Super + Shift + Arrow Keys
Super + Shift + h/j/k/l

# Switch workspace
Super + 1-9

# Move window to workspace
Super + Shift + 1-9
```

### Mouse Actions

```bash
# Move window
Super + Left Mouse Button (drag)

# Resize window
Super + Right Mouse Button (drag)

# Switch workspace
Super + Mouse Wheel
```

## Workspaces

### Concept

Hyprland workspaces are:
- Numbered 1-10 by default
- Can be named
- Per-monitor or floating
- Dynamically created

### Configuration

```bash
# Assign workspace to monitor
workspace = 1, monitor:DP-1
workspace = 2, monitor:DP-1
workspace = 3, monitor:HDMI-A-1

# Persistent workspaces
workspace = 1, persistent:true
```

### Special Workspace (Scratchpad)

```bash
# Toggle special workspace
Super + S

# Move to special workspace
Super + Shift + S

# Configuration
bind = $mainMod, S, togglespecialworkspace
bind = $mainMod SHIFT, S, movetoworkspace, special
```

## Window Rules

Automate window behavior:

### Basic Rules

```bash
# Float specific windows
windowrule = float, ^(pavucontrol)$
windowrule = float, ^(blueman-manager)$

# Opacity
windowrule = opacity 0.9, ^(Alacritty)$

# Workspace assignment
windowrule = workspace 2, ^(firefox)$
windowrule = workspace 3, ^(discord)$

# Size and position
windowrulev2 = size 800 600, class:^(mpv)$
windowrulev2 = center, class:^(mpv)$
```

### Advanced Rules

```bash
# Conditional rules
windowrulev2 = float, class:^(firefox)$, title:^(Picture-in-Picture)$

# Pseudo-tiling
windowrulev2 = pseudo, class:^(Steam)$

# No animations for specific windows
windowrulev2 = noanim, class:^(rofi)$

# Immediate
windowrulev2 = immediate, class:^(cs2)$
```

### Finding Window Class

```bash
# Get window info
hyprctl clients | grep class

# Or interactive
hyprctl clients
```

## Layouts

### Dwindle (Default)

Fibonacci-spiral-like tiling:

```bash
dwindle {
    pseudotile = yes
    preserve_split = yes
    no_gaps_when_only = false
}
```

**Keybindings:**
```bash
# Toggle split direction
bind = $mainMod, J, togglesplit

# Pseudo-tile
bind = $mainMod, P, pseudo
```

### Master Layout

One large master window with stack:

```bash
master {
    new_is_master = false
    new_on_top = false
    mfact = 0.5
}
```

**Keybindings:**
```bash
# Cycle layout
bind = $mainMod, Space, cyclenext

# Swap with master
bind = $mainMod, Return, layoutmsg, swapwithmaster
```

## Monitors

### Configuration

```bash
# Auto-detect with preferred settings
monitor=,preferred,auto,1

# Specific monitor
monitor=DP-1,1920x1080@144,0x0,1

# Multiple monitors
monitor=DP-1,1920x1080@144,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1

# Disable monitor
monitor=HDMI-A-1,disable

# High DPI scaling
monitor=eDP-1,2560x1440,0x0,1.5
```

### List Monitors

```bash
hyprctl monitors
```

### Change Monitor Settings

```bash
# On-the-fly
hyprctl keyword monitor DP-1,1920x1080@144,0x0,1
```

## Animations

### Configuration

```bash
animations {
    enabled = yes
    
    # Define bezier curves
    bezier = smooth, 0.16, 1, 0.3, 1
    bezier = overshot, 0.05, 0.9, 0.1, 1.05
    bezier = bounce, 1, 1.6, 0.8, 0.8
    
    # Apply to different elements
    animation = windows, 1, 5, smooth, popin 80%
    animation = windowsOut, 1, 5, smooth, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 5, default
    animation = workspaces, 1, 6, overshot, slidevert
}
```

### Animation Parameters

```
animation = NAME, ENABLED, SPEED, CURVE, STYLE

NAME: windows, windowsOut, border, fade, workspaces, etc.
ENABLED: 0 or 1
SPEED: 1-10 (higher = slower)
CURVE: default or custom bezier
STYLE: slide, popin, fade, etc.
```

### Disable Animations

```bash
animations {
    enabled = no
}
```

## Decorations

### Blur

```bash
decoration {
    blur {
        enabled = true
        size = 5
        passes = 2
        new_optimizations = true
        ignore_opacity = true
    }
}
```

### Shadows

```bash
decoration {
    drop_shadow = yes
    shadow_range = 10
    shadow_render_power = 3
    shadow_offset = 0 0
    col.shadow = rgba(1a1a1aee)
}
```

### Rounding

```bash
decoration {
    rounding = 10
}
```

### Opacity

```bash
# Per-window rules
windowrulev2 = opacity 0.9 0.8, class:^(Alacritty)$
# Format: opacity ACTIVE INACTIVE
```

## Input Configuration

### Keyboard

```bash
input {
    kb_layout = us,de
    kb_variant =
    kb_model =
    kb_options = grp:alt_shift_toggle
    kb_rules =
    
    repeat_rate = 50
    repeat_delay = 300
}
```

### Mouse

```bash
input {
    follow_mouse = 1
    mouse_refocus = true
    sensitivity = 0
    accel_profile = flat
}
```

### Touchpad

```bash
input {
    touchpad {
        natural_scroll = yes
        tap-to-click = yes
        drag_lock = no
        disable_while_typing = yes
    }
}
```

## Gestures

```bash
gestures {
    workspace_swipe = yes
    workspace_swipe_fingers = 3
    workspace_swipe_distance = 300
    workspace_swipe_cancel_ratio = 0.5
}
```

## IPC and Control

### hyprctl Commands

```bash
# Get active window info
hyprctl activewindow

# List all windows
hyprctl clients

# List workspaces
hyprctl workspaces

# Reload config
hyprctl reload

# Execute dispatcher
hyprctl dispatch workspace 2
hyprctl dispatch movetoworkspace 3

# Set keyword
hyprctl keyword general:gaps_in 10
```

### Dispatchers

Control Hyprland from scripts:

```bash
# Examples
hyprctl dispatch exec alacritty
hyprctl dispatch killactive
hyprctl dispatch workspace 5
hyprctl dispatch movetoworkspace 3
hyprctl dispatch togglefloating
hyprctl dispatch fullscreen 1
```

## Status Bar Integration (Waybar)

### Workspace Module

```json
// ~/.config/waybar/config.jsonc
"hyprland/workspaces": {
    "format": "{icon}",
    "on-click": "activate",
    "format-icons": {
        "1": "1",
        "2": "2",
        "active": "",
        "default": ""
    },
    "sort-by-number": true
}
```

### Window Title

```json
"hyprland/window": {
    "format": "{}",
    "max-length": 50,
    "separate-outputs": true
}
```

## Common Tasks

### Screenshot

```bash
# Full screen
grim ~/Pictures/screenshot.png

# Select area
grim -g "$(slurp)" ~/Pictures/screenshot.png

# Current window
grim -g "$(hyprctl -j activewindow | jq -r '.at,.size | join(","))" ~/Pictures/screenshot.png

# Keybinding
bind = , Print, exec, grim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png
bind = SHIFT, Print, exec, grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png
```

### Screen Recording

```bash
# With wf-recorder
wf-recorder -f ~/Videos/recording.mp4

# Select area
wf-recorder -g "$(slurp)" -f ~/Videos/recording.mp4
```

### Lock Screen

```bash
# With hyprlock
bind = $mainMod, L, exec, hyprlock

# With swaylock
bind = $mainMod, L, exec, swaylock
```

### Clipboard Manager

```bash
# Start cliphist
exec-once = wl-paste --watch cliphist store

# Show clipboard history
bind = $mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy
```

## Troubleshooting

### Check Logs

```bash
# Hyprland log
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log

# Watch live
tail -f /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log
```

### Common Issues

**Black Screen:**
- Check GPU drivers
- Try disabling VRR: `misc { vrr = 0 }`

**Cursor Issues:**
- Set `WLR_NO_HARDWARE_CURSORS=1`

**Apps Not Opening:**
- Check XWayland: `xwayland { force_zero_scaling = true }`

**Screen Tearing:**
- Enable VRR: `misc { vrr = 1 }`

## Next Steps

Now that you know Hyprland basics:

1. Customize your appearance: [Customizing Appearance](05-customizing-appearance.md)
2. Master keybindings: [Keybindings Explained](06-keybindings-explained.md)
3. Create automation: [Scripting & Automation](07-scripting-automation.md)
4. Explore advanced features: [Advanced Configurations](08-advanced-configurations.md)

## Resources

- Official Wiki: https://wiki.hyprland.org
- GitHub: https://github.com/hyprwm/Hyprland
- Discord: https://discord.gg/hQ9XvMUjjr
- Reddit: r/hyprland

## Conclusion

Hyprland offers a modern, beautiful tiling experience with Wayland. Its smooth animations and extensive customization make it a favorite among ricers. Take time to explore the configuration options and make it your own.