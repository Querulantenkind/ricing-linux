# i3wm Basics

This guide covers the fundamentals of using i3, a tiling window manager for X11.

## What is i3wm?

i3 is a tiling window manager designed for X11, emphasizing:
- Simplicity and clear documentation
- Efficient use of screen space
- Keyboard-driven operation
- Stability and reliability
- Manual tiling with predictable behavior

## Installation

### Using This Repository's Script

```bash
cd ~/Documents/ricing-linux
./scripts/installation/install-i3wm.sh
```

This installs:
- i3wm (window manager)
- Polybar or i3bar (status bar)
- Rofi (application launcher)
- Dunst (notifications)
- Picom (compositor)
- feh (wallpaper)
- i3lock (screen locker)

### Manual Installation

```bash
# Arch Linux
sudo pacman -S i3-wm i3status i3lock

# Additional tools
sudo pacman -S polybar rofi dunst picom feh

# Utilities
sudo pacman -S scrot xclip maim
```

## First Launch

### From Display Manager

1. Logout of current session
2. Select "i3" from session menu
3. Login

### From TTY

```bash
# Add to ~/.xinitrc
exec i3

# Then run
startx
```

### Initial Setup

On first launch, i3 will ask:

1. **Generate config file?** → Yes
2. **Modifier key?** → Win/Super key (recommended) or Alt

i3 creates: `~/.config/i3/config`

## Configuration File

### Location

```bash
~/.config/i3/config
```

### Basic Structure

```bash
# Modifier key (Mod4 = Super, Mod1 = Alt)
set $mod Mod4

# Font for window titles and bar
font pango:JetBrains Mono 10

# Start applications on boot
exec_always --no-startup-id ~/.config/polybar/launch.sh
exec --no-startup-id picom
exec --no-startup-id dunst
exec --no-startup-id feh --bg-scale ~/Pictures/wallpaper.jpg

# Use Mouse+$mod to drag floating windows
floating_modifier $mod

# Terminal
bindsym $mod+Return exec alacritty

# Kill focused window
bindsym $mod+Shift+q kill

# Application launcher
bindsym $mod+d exec rofi -show drun

# Change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# Move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# Split orientation
bindsym $mod+v split h
bindsym $mod+b split v

# Fullscreen
bindsym $mod+f fullscreen toggle

# Layout modes
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# Toggle floating
bindsym $mod+Shift+space floating toggle

# Change focus between tiling/floating
bindsym $mod+space focus mode_toggle

# Workspaces
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# Switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
# ... (continue for 3-10)

# Move container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
# ... (continue for 3-10)

# Reload configuration
bindsym $mod+Shift+c reload

# Restart i3
bindsym $mod+Shift+r restart

# Exit i3
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'Exit i3?' -B 'Yes' 'i3-msg exit'"

# Resize mode
mode "resize" {
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt
    
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

# Window colors
client.focused          #4c7899 #285577 #ffffff #2e9ef4 #285577
client.focused_inactive #333333 #5f676a #ffffff #484e50 #5f676a
client.unfocused        #333333 #222222 #888888 #292d2e #222222
client.urgent           #2f343a #900000 #ffffff #900000 #900000

# Gaps (requires i3-gaps or i3 v4.22+)
gaps inner 10
gaps outer 5

# Smart gaps (no gaps with single window)
smart_gaps on
smart_borders on

# Border style
default_border pixel 2
default_floating_border pixel 2
```

## Essential Keybindings

### Window Management

```bash
# Terminal
Mod + Return

# Close window
Mod + Shift + Q

# Application launcher
Mod + D

# Fullscreen
Mod + F

# Toggle floating
Mod + Shift + Space

# Focus floating/tiling
Mod + Space
```

### Navigation

```bash
# Move focus (vim-style)
Mod + H/J/K/L

# Move focus (arrow keys)
Mod + Arrow Keys

# Focus parent container
Mod + A

# Focus child container
Mod + Shift + A
```

### Moving Windows

```bash
# Move window (vim-style)
Mod + Shift + H/J/K/L

# Move window (arrows)
Mod + Shift + Arrow Keys
```

### Workspaces

```bash
# Switch to workspace
Mod + 1-9 (or 0 for 10)

# Move window to workspace
Mod + Shift + 1-9

# Move to workspace with window
Mod + Ctrl + 1-9
```

### Layouts

```bash
# Split horizontal (next window)
Mod + H

# Split vertical (next window)
Mod + V

# Stacking layout
Mod + S

# Tabbed layout
Mod + W

# Toggle split layout
Mod + E
```

### System

```bash
# Reload config
Mod + Shift + C

# Restart i3
Mod + Shift + R

# Exit i3
Mod + Shift + E

# Resize mode
Mod + R
```

## Workspaces

### Concept

i3 workspaces are:
- Numbered 1-10 by default
- Can be named
- Independent on each monitor
- Automatically created when accessed

### Named Workspaces

```bash
# Define workspace names
set $ws1 "1:web"
set $ws2 "2:code"
set $ws3 "3:term"
set $ws4 "4:chat"
set $ws5 "5:music"

# Use as before
bindsym $mod+1 workspace $ws1
```

### Workspace Assignment

```bash
# Assign applications to workspaces
assign [class="firefox"] $ws1
assign [class="Code"] $ws2
assign [class="discord"] $ws4
assign [class="Spotify"] $ws5
```

### Multi-Monitor Workspaces

```bash
# Assign workspaces to monitors
workspace $ws1 output DP-1
workspace $ws2 output DP-1
workspace $ws3 output HDMI-1
```

## Window Rules

### Basic Rules

```bash
# Float specific windows
for_window [class="Pavucontrol"] floating enable
for_window [class="Blueman-manager"] floating enable
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable

# Resize floating windows
for_window [class="mpv"] floating enable, resize set 800 600

# Position windows
for_window [class="calculator"] floating enable, move position center

# Sticky windows (visible on all workspaces)
for_window [class="notepadqq"] sticky enable
```

### Finding Window Properties

```bash
# Run in terminal, then click window
xprop

# Look for:
# WM_CLASS(STRING) = "instance", "class"
# WM_WINDOW_ROLE(STRING) = "role"
```

## Containers and Tree Structure

### Understanding Containers

i3 uses a tree structure:

```
Output (Monitor)
  └─ Workspace
      ├─ Container (horizontal split)
      │   ├─ Window 1
      │   └─ Window 2
      └─ Container (vertical split)
          ├─ Window 3
          └─ Container (tabbed)
              ├─ Window 4
              └─ Window 5
```

### Manipulating Containers

```bash
# Focus parent (moves up tree)
Mod + A

# Split current container
Mod + H (horizontal)
Mod + V (vertical)

# Change container layout
Mod + S (stacking)
Mod + W (tabbed)
Mod + E (toggle split)
```

## Layouts

### Split Container (Default)

Windows side by side or stacked:

```bash
# Next window splits horizontal
bindsym $mod+h split h

# Next window splits vertical
bindsym $mod+v split v
```

### Stacking Layout

Windows stacked with title bars:

```bash
bindsym $mod+s layout stacking
```

### Tabbed Layout

Windows as tabs:

```bash
bindsym $mod+w layout tabbed
```

### Toggle Between Layouts

```bash
bindsym $mod+e layout toggle split

# Or cycle through all
bindsym $mod+x layout toggle all
```

## Gaps

### Configuration

```bash
# Inner gaps (between windows)
gaps inner 10

# Outer gaps (screen edges)
gaps outer 5

# Smart gaps (disable when one window)
smart_gaps on

# Smart borders
smart_borders on
```

### Per-Workspace Gaps

```bash
workspace $ws1 gaps inner 0
workspace $ws1 gaps outer 0

workspace $ws2 gaps inner 15
```

### Runtime Gap Control

```bash
# Increase/decrease gaps
bindsym $mod+plus gaps inner current plus 5
bindsym $mod+minus gaps inner current minus 5

bindsym $mod+Shift+plus gaps outer current plus 5
bindsym $mod+Shift+minus gaps outer current minus 5
```

## Scratchpad

Hidden workspace for quick access:

### Using Scratchpad

```bash
# Send window to scratchpad
Mod + Shift + Minus

# Show/hide scratchpad window
Mod + Minus

# Configuration
bindsym $mod+Shift+minus move scratchpad
bindsym $mod+minus scratchpad show
```

### Scratchpad for Specific App

```bash
# Start app in scratchpad
exec --no-startup-id alacritty --class scratchpad
for_window [class="scratchpad"] move scratchpad

# Show with keybind
bindsym $mod+grave [class="scratchpad"] scratchpad show
```

## Floating Windows

### Toggle Floating

```bash
# Make window float
Mod + Shift + Space

# Toggle focus tiling/floating
Mod + Space
```

### Move Floating Windows

```bash
# Drag with mouse
Mod + Left Click (drag)

# Keyboard
Mod + Shift + H/J/K/L

# Move to position
bindsym $mod+c move position center
bindsym $mod+t move position mouse
```

### Resize Floating

```bash
# Mouse
Mod + Right Click (drag)

# Keyboard (in resize mode)
Mod + R, then H/J/K/L
```

## Modes

Create custom keybinding modes:

### Resize Mode (Built-in)

```bash
mode "resize" {
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt
    
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"
```

### Custom Modes

```bash
# Power mode
mode "power" {
    bindsym l exec i3lock, mode "default"
    bindsym s exec systemctl suspend, mode "default"
    bindsym r exec systemctl reboot
    bindsym p exec systemctl poweroff
    bindsym Escape mode "default"
}
bindsym $mod+Shift+p mode "power"

# System mode
mode "system" {
    bindsym e exec i3-msg exit
    bindsym r exec i3-msg restart
    bindsym c exec i3-msg reload
    bindsym Escape mode "default"
}
bindsym $mod+Escape mode "system"
```

## Status Bar

### i3bar (Default)

```bash
bar {
    status_command i3status
    position top
    
    colors {
        background #1e1e2e
        statusline #cdd6f4
        separator  #6c7086
        
        # Type             Border    BG        Text
        focused_workspace  #89b4fa #89b4fa #1e1e2e
        active_workspace   #313244 #313244 #cdd6f4
        inactive_workspace #313244 #313244 #6c7086
        urgent_workspace   #f38ba8 #f38ba8 #1e1e2e
    }
}
```

### Polybar (Recommended)

```bash
# In i3 config
bar {
    # Disable i3bar
    mode invisible
}

exec_always --no-startup-id ~/.config/polybar/launch.sh
```

## Compositor (Picom)

### Basic Configuration

```bash
# Start picom
exec_always --no-startup-id picom

# ~/.config/picom/picom.conf
backend = "glx";
vsync = true;

shadow = true;
shadow-radius = 10;

fading = true;
fade-in-step = 0.03;
fade-out-step = 0.03;

inactive-opacity = 0.9;
frame-opacity = 0.9;
```

## IPC and Control

### i3-msg Commands

```bash
# Execute i3 commands
i3-msg workspace 2
i3-msg move container to workspace 3
i3-msg layout tabbed
i3-msg reload
i3-msg restart

# Get information
i3-msg -t get_workspaces
i3-msg -t get_outputs
i3-msg -t get_tree

# Subscribe to events
i3-msg -t subscribe -m '["workspace","window"]'
```

## Common Tasks

### Screenshot

```bash
# Full screen
bindsym Print exec scrot ~/Pictures/screenshot-%Y-%m-%d-%T.png

# Select area
bindsym --release Shift+Print exec scrot -s ~/Pictures/screenshot-%Y-%m-%d-%T.png

# Current window
bindsym --release $mod+Print exec scrot -u ~/Pictures/screenshot-%Y-%m-%d-%T.png
```

### Lock Screen

```bash
bindsym $mod+l exec i3lock -c 000000

# Or with i3lock-color
bindsym $mod+l exec i3lock -i ~/Pictures/lockscreen.png
```

### Volume Control

```bash
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
```

### Brightness Control

```bash
bindsym XF86MonBrightnessUp exec brightnessctl set +5%
bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
```

## Troubleshooting

### Check Config Syntax

```bash
i3 -C
# or
i3-msg -t command reload
```

### View i3 Log

```bash
cat ~/.local/share/xorg/Xorg.0.log
journalctl -b --user-unit=i3
```

### Common Issues

**Gaps Not Working:**
- Check i3 version: `i3 --version`
- Need i3-gaps or i3 >= 4.22

**Polybar Not Starting:**
- Check launch script permissions
- Kill existing instances first

**Compositor Issues:**
- Try different picom backend
- Disable problematic features

## Next Steps

Now that you know i3 basics:

1. Customize appearance: [Customizing Appearance](05-customizing-appearance.md)
2. Master keybindings: [Keybindings Explained](06-keybindings-explained.md)
3. Create automation: [Scripting & Automation](07-scripting-automation.md)
4. Explore advanced features: [Advanced Configurations](08-advanced-configurations.md)

## Resources

- Official User Guide: https://i3wm.org/docs/userguide.html
- i3 FAQ: https://i3wm.org/docs/faq.html
- Arch Wiki: https://wiki.archlinux.org/title/I3
- Reddit: r/i3wm

## Conclusion

i3 is a stable, mature tiling window manager with excellent documentation. Its predictable behavior and simplicity make it an excellent choice for both beginners and power users. Take time to read the official documentation and experiment with configurations.