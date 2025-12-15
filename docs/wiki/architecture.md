# System Architecture

This document explains how the different components of a riced Linux system work together, focusing on Hyprland and i3wm setups.

## Overview

A complete rice consists of multiple components that interact to create your desktop environment:

```
Display Server (X11/Wayland)
    ├── Window Manager (i3/Hyprland)
    ├── Compositor (Picom for X11)
    ├── Status Bar (Polybar/Waybar)
    ├── Notification Daemon (Dunst/Mako)
    ├── Application Launcher (Rofi/Wofi)
    ├── Terminal Emulator (Alacritty/Kitty)
    ├── Wallpaper Manager (feh/hyprpaper)
    └── Various Scripts & Utilities
```

## Component Interactions

### Startup Sequence

#### X11 (i3wm) Startup
1. Display Manager (LightDM/SDDM) starts
2. User logs in, display manager starts i3
3. i3 reads `~/.config/i3/config`
4. i3 executes autostart commands:
   - Compositor (picom)
   - Status bar (polybar)
   - Notification daemon (dunst)
   - Wallpaper setter (feh)
   - Other autostart programs
5. System is ready for use

#### Wayland (Hyprland) Startup
1. Display Manager starts
2. User logs in, display manager starts Hyprland
3. Hyprland reads `~/.config/hypr/hyprland.conf`
4. Hyprland acts as compositor (no separate picom)
5. Hyprland executes autostart:
   - Status bar (waybar)
   - Notification daemon (mako/dunst)
   - Wallpaper manager (hyprpaper)
   - Idle manager (hypridle)
   - Other autostart programs
6. System is ready for use

### Window Manager Core

The window manager is the central component:

**Responsibilities:**
- Window placement and sizing
- Workspace management
- Keybinding handling
- Focus management
- Window decorations (borders)
- Layout algorithms

**Input/Output:**
- Input: Keyboard/mouse events from display server
- Output: Window positions/sizes to display server
- IPC: Commands from external scripts

### Status Bar Integration

#### Polybar (X11)
```
Polybar → Reads system info
   ├── CPU usage (via /proc)
   ├── Memory (via /proc)
   ├── Network (via network manager)
   ├── Battery (via /sys)
   ├── Date/time (system clock)
   └── Custom scripts

Polybar → Sends to X11 → Displayed
Polybar ← i3 IPC → Workspace info
```

#### Waybar (Wayland)
```
Waybar → Reads system info
   ├── Same sources as Polybar
   └── Hyprland IPC for workspace info

Waybar → Wayland → Displayed
```

### Notification Flow

```
Application
    ↓
DBus notification
    ↓
Notification Daemon (dunst/mako)
    ↓
Compare with rules (urgency, app name)
    ↓
Display notification
    ↓
Window Manager positions notification
    ↓
Compositor renders notification
```

### Application Launcher Flow

```
User presses hotkey
    ↓
Window Manager catches keybind
    ↓
Launches rofi/wofi
    ↓
Launcher scans .desktop files
    ↓
User types and selects app
    ↓
Launcher executes application
    ↓
Window Manager places new window
```

## Configuration File Hierarchy

### X11 (i3wm) Configuration
```
~/.config/
├── i3/
│   ├── config (main i3 config)
│   └── i3status.conf
├── polybar/
│   ├── config.ini
│   └── launch.sh
├── picom/
│   └── picom.conf
├── dunst/
│   └── dunstrc
├── rofi/
│   ├── config.rasi
│   └── themes/
├── alacritty/
│   └── alacritty.yml
└── kitty/
    └── kitty.conf
```

### Wayland (Hyprland) Configuration
```
~/.config/
├── hypr/
│   ├── hyprland.conf (main config)
│   ├── hyprpaper.conf
│   ├── hypridle.conf
│   └── hyprlock.conf
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── mako/
│   └── config (or dunst for Wayland)
├── wofi/
│   ├── config
│   └── style.css
├── alacritty/
│   └── alacritty.yml
└── kitty/
    └── kitty.conf
```

## Inter-Process Communication

### i3 IPC

i3 provides a socket for external communication:
```bash
# Get workspace info
i3-msg -t get_workspaces

# Switch workspace
i3-msg workspace 2

# Move window
i3-msg move container to workspace 3
```

Used by:
- Status bars (workspace info)
- Scripts (automation)
- External tools (i3-save-tree)

### Hyprland IPC

Hyprland uses a Unix socket:
```bash
# Get workspace info
hyprctl workspaces

# Switch workspace
hyprctl dispatch workspace 2

# Move window
hyprctl dispatch movetoworkspace 3
```

Used by:
- Status bars (waybar)
- Scripts (automation)
- Plugins

## Theme Application

### Theme Structure
```
Theme (e.g., Catppuccin)
├── Color definitions
│   ├── Background colors
│   ├── Foreground colors
│   ├── Accent colors
│   └── Special colors
│
└── Applied to:
    ├── Window Manager (borders, gaps)
    ├── Status Bar (colors, styling)
    ├── Terminal (color scheme)
    ├── Application Launcher (styling)
    ├── Notifications (colors)
    ├── GTK Applications (GTK theme)
    └── Wallpaper (matching aesthetic)
```

### Theme Application Process
```
1. Define colors in theme file
2. Source color file in configs:
   - i3 config includes colors
   - Polybar includes colors
   - Terminal includes colors
   - Rofi includes colors
3. Apply GTK theme for applications
4. Set matching wallpaper
5. Reload all components
```

## Resource Management

### Memory Usage

Typical memory footprint:

**i3wm Setup:**
- i3wm: 10-20 MB
- Picom: 20-40 MB
- Polybar: 15-30 MB
- Dunst: 5-10 MB
- Terminal: 20-50 MB per instance
- Total base: ~100-150 MB

**Hyprland Setup:**
- Hyprland: 50-100 MB (includes compositor)
- Waybar: 20-40 MB
- Mako: 5-10 MB
- Terminal: 20-50 MB per instance
- Total base: ~100-200 MB

Both are significantly lighter than full desktop environments (GNOME ~1GB, KDE ~700MB).

### CPU Usage

**Idle State:**
- Window Manager: <1%
- Status Bar: 1-2% (polling intervals)
- Compositor: <1%

**Active Use:**
- Animations (Hyprland): 5-15%
- Window operations: Brief spikes
- Typically very light CPU usage

## Signal Flow

### Keyboard Input
```
Keyboard
    ↓
Kernel (evdev)
    ↓
Display Server (X11/Wayland)
    ↓
Window Manager (checks keybinds)
    ↓
If bound: Execute action
If not: Pass to focused application
    ↓
Application handles input
```

### Window Creation
```
User launches application
    ↓
Application requests window
    ↓
Display Server creates window
    ↓
Window Manager assigns workspace/position
    ↓
Window Manager applies rules (size, float, etc.)
    ↓
Compositor renders window
    ↓
Display output
```

## Script Integration Points

### Common Script Triggers
1. **Keybindings**: Direct execution from WM
2. **Status Bar Modules**: Periodic polling
3. **Hooks**: Events (window open, workspace change)
4. **Systemd Services**: Background monitoring
5. **Notification Actions**: Click handlers

### Example Script Flow
```bash
# Screenshot script triggered by keybind
User presses Print
    ↓
i3/Hyprland catches keybind
    ↓
Executes screenshot.sh
    ↓
Script uses scrot/grim
    ↓
Saves to ~/Pictures/
    ↓
Sends notification via notify-send
    ↓
Dunst/Mako displays notification
```

## Plugin Architecture

### Hyprland Plugins
Hyprland supports plugins for extended functionality:
- Written in C++
- Can hook into Hyprland events
- Can add new IPC commands
- Examples: hyprspace, hy3

### i3 Extensions
i3 doesn't have native plugins, but tools extend it:
- i3-gaps (merged into i3 v4.22+)
- i3ipc (Python library)
- External scripts via IPC

## System Integration

### Session Management
```
Display Manager
    ↓
Starts WM session
    ↓
WM registers with session bus
    ↓
Systemd user services start
    ↓
WM autostart executes
    ↓
Full session running
```

### Power Management
```
System event (low battery, lid close)
    ↓
Systemd/logind
    ↓
DBus signal
    ↓
Power management daemon
    ↓
Execute action (lock, suspend)
    ↓
WM cooperates (Hyprland lock, i3lock)
```

## Component Communication Matrix

| Component | Communicates With | Method |
|-----------|-------------------|--------|
| Window Manager | Display Server | Native protocol |
| Status Bar | Window Manager | IPC socket |
| Status Bar | System | /proc, /sys, NetworkManager |
| Notifications | Applications | DBus |
| Notifications | Window Manager | Window creation |
| Launcher | .desktop files | File reading |
| Scripts | Window Manager | IPC commands |
| Terminal | Shell | PTY |
| Compositor | Display | Direct rendering |

## Modular Design Benefits

Each component is independent:
- Can be replaced without affecting others
- Easy to customize individual parts
- Failure of one component doesn't crash system
- Can mix and match components
- Easy to debug specific issues

## Example Workflows

### Workspace Switching
```
1. User presses Mod+2
2. WM receives keybind
3. WM switches to workspace 2
4. WM sends IPC update
5. Status bar updates workspace indicator
6. Compositor animates transition (Hyprland)
```

### Window Rule Application
```
1. Application launches
2. Window created with class/title
3. WM reads window properties
4. WM matches against rules
5. WM applies: workspace, size, float status
6. Window appears in correct location
```

## Conclusion

Understanding this architecture helps you:
- Debug issues more effectively
- Customize your setup intelligently
- Choose appropriate components
- Optimize performance
- Create integrated workflows

All components work together through well-defined interfaces, making the system both powerful and maintainable.