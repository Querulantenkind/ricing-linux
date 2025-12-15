# Application Launcher Comparison

Application launchers are essential tools for quickly finding and launching programs in a tiling window manager. This guide compares the most popular options.

## Overview

| Launcher | Protocol | Language | Customization | Performance | Learning Curve |
|----------|----------|----------|---------------|-------------|----------------|
| Rofi | X11 | C | High | Fast | Easy |
| Wofi | Wayland | C | Medium | Fast | Easy |
| dmenu | X11 | C | Low | Very Fast | Easy |
| Fuzzel | Wayland | C | Low | Very Fast | Easy |
| Ulauncher | Both | Python | High | Medium | Easy |
| Albert | Both | C++ | High | Fast | Medium |

## Rofi

### Overview
Rofi is the most popular and feature-rich launcher for X11 systems.

### Pros
- Highly customizable themes
- Multiple modes (drun, run, ssh, window)
- Script integration
- Large community and theme collection
- Plugin support
- Excellent documentation

### Cons
- X11 only (no native Wayland)
- Can be complex to configure
- CSS-like theming has learning curve

### Configuration
```bash
# ~/.config/rofi/config.rasi
configuration {
    modi: "drun,run,window,ssh";
    show-icons: true;
    terminal: "alacritty";
    drun-display-format: "{name}";
    display-drun: "Applications";
    display-run: "Run";
    display-window: "Windows";
}

@theme "catppuccin-mocha"
```

### Usage
```bash
# Application launcher
rofi -show drun

# Run command
rofi -show run

# Window switcher
rofi -show window

# SSH launcher
rofi -show ssh
```

### Theming
Rofi has extensive theming capabilities with CSS-like syntax:
```css
* {
    background-color: #1e1e2e;
    text-color: #cdd6f4;
    border-color: #89b4fa;
}

window {
    width: 600px;
    border: 2px;
    border-radius: 10px;
    padding: 20px;
}
```

### Best For
- i3wm users
- Users wanting maximum customization
- Those who need advanced features
- Users comfortable with X11

## Wofi

### Overview
Wofi is Wayland's answer to Rofi, designed as a native Wayland launcher.

### Pros
- Native Wayland support
- Rofi-like functionality
- CSS styling
- Fast and lightweight
- Simple to configure

### Cons
- Fewer features than Rofi
- Smaller theme collection
- Less mature project
- Limited plugin ecosystem

### Configuration
```bash
# ~/.config/wofi/config
width=600
height=400
show=drun
term=alacritty
insensitive=true
prompt=Search
```

### Styling
```css
/* ~/.config/wofi/style.css */
window {
    background-color: #1e1e2e;
    border: 2px solid #89b4fa;
    border-radius: 10px;
}

#input {
    background-color: #313244;
    color: #cdd6f4;
    border-radius: 5px;
    padding: 10px;
}

#entry:selected {
    background-color: #89b4fa;
}
```

### Usage
```bash
# Application launcher
wofi --show drun

# Run command
wofi --show run

# DMenu mode
echo -e "Option 1\nOption 2" | wofi --dmenu
```

### Best For
- Hyprland users
- Users wanting native Wayland
- Those who value simplicity
- Users transitioning from Rofi

## dmenu

### Overview
The classic, minimalist launcher from the suckless project.

### Pros
- Extremely fast and lightweight
- Simple and predictable
- Scriptable for custom menus
- Works as both launcher and prompt
- Very stable

### Cons
- Minimal features
- Basic appearance
- Requires patching for features
- Manual compilation needed

### Configuration
Configured by editing source code and recompiling:
```c
/* config.h */
static const char *fonts[] = {
    "monospace:size=10"
};

static const char *colors[SchemeLast][2] = {
    [SchemeNorm] = { "#bbbbbb", "#222222" },
    [SchemeSel]  = { "#eeeeee", "#005577" },
};
```

### Usage
```bash
# As application launcher (with script)
dmenu_run

# As generic menu
echo -e "Option 1\nOption 2\nOption 3" | dmenu

# Custom prompt
ls | dmenu -p "Select file:"
```

### Patching
Common patches:
- Center: Center dmenu on screen
- Height: Custom height
- Line height: Better text spacing
- Fuzzymatch: Fuzzy search

### Best For
- Minimalists
- Suckless philosophy followers
- Users who want extreme simplicity
- Script-heavy workflows

## Fuzzel

### Overview
A fast, lightweight Wayland-native launcher.

### Pros
- Very fast startup
- Low resource usage
- Native Wayland
- Simple configuration
- Clean appearance

### Cons
- Minimal features
- Limited customization
- Small community
- Basic theming only

### Configuration
```ini
# ~/.config/fuzzel/fuzzel.ini
[main]
font=JetBrains Mono:size=11
dpi-aware=yes
icon-theme=Papirus-Dark
width=40

[colors]
background=1e1e2edd
text=cdd6f4ff
match=89b4faff
selection=313244ff
selection-text=cdd6f4ff
border=89b4faff
```

### Usage
```bash
# Launch fuzzel
fuzzel

# DMenu mode
echo -e "Option 1\nOption 2" | fuzzel --dmenu
```

### Best For
- Users wanting minimal Wayland launcher
- Performance-focused setups
- Those who prefer simplicity
- Complement to Hyprland

## Ulauncher

### Overview
A modern, extensible launcher with GUI configuration.

### Pros
- GUI preferences
- Extension system
- Works on both X11 and Wayland
- User-friendly
- Plugin marketplace

### Cons
- Python-based (slower startup)
- Higher resource usage
- Less keyboard-focused
- Can feel heavy for tiling WM

### Features
- Calculator
- File search
- Custom web searches
- Clipboard history
- Extensions for various services

### Best For
- Users wanting GUI configuration
- Those who need extensions
- Users transitioning from full DE
- Those who value ease of use

## Feature Comparison

### Modes and Functionality

| Feature | Rofi | Wofi | dmenu | Fuzzel | Ulauncher |
|---------|------|------|-------|--------|----------|
| App Launcher | Yes | Yes | Script | Yes | Yes |
| Run Command | Yes | Yes | Yes | No | Yes |
| Window Switcher | Yes | No | No | No | No |
| SSH Launcher | Yes | No | No | No | No |
| File Browser | Plugin | No | Script | No | Extension |
| Calculator | Plugin | No | No | No | Built-in |
| Custom Scripts | Yes | Yes | Yes | Limited | Extension |

### Appearance

| Feature | Rofi | Wofi | dmenu | Fuzzel | Ulauncher |
|---------|------|------|-------|--------|----------|
| Icons | Yes | Yes | Patch | Yes | Yes |
| Themes | Many | Some | Patches | Few | Themes |
| CSS Styling | Yes | Yes | No | No | Limited |
| Transparency | Yes | Yes | Patch | Yes | Yes |
| Border Radius | Yes | Yes | No | Yes | Yes |

### Performance

| Launcher | Startup Time | RAM Usage | CPU Usage |
|----------|-------------|-----------|------------|
| dmenu | <10ms | 2-5 MB | Minimal |
| Fuzzel | ~20ms | 5-10 MB | Low |
| Rofi | ~50ms | 10-20 MB | Low |
| Wofi | ~50ms | 10-20 MB | Low |
| Ulauncher | ~200ms | 40-60 MB | Medium |

## Configuration Examples

### Keybindings

**i3wm with Rofi:**
```bash
bindsym $mod+d exec rofi -show drun
bindsym $mod+Shift+d exec rofi -show run
bindsym $mod+Tab exec rofi -show window
```

**Hyprland with Wofi:**
```bash
bind = $mainMod, R, exec, wofi --show drun
bind = $mainMod SHIFT, R, exec, wofi --show run
```

**Hyprland with Fuzzel:**
```bash
bind = $mainMod, R, exec, fuzzel
```

### Custom Scripts

**Power Menu with Rofi:**
```bash
#!/bin/bash
options="Shutdown\nReboot\nLogout\nLock"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power")

case $chosen in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Logout) i3-msg exit ;;
    Lock) i3lock ;;
esac
```

**File Search with Wofi:**
```bash
#!/bin/bash
selected=$(fd . $HOME -type f | wofi --dmenu -p "Open file")
[ -n "$selected" ] && xdg-open "$selected"
```

## Recommendations

### For i3wm
**Primary: Rofi**
- Best features and customization
- Large community
- Extensive themes

**Alternative: dmenu**
- If you want minimalism
- Extremely lightweight

### For Hyprland
**Primary: Wofi**
- Native Wayland
- Good balance of features and performance
- Rofi-like experience

**Alternative: Fuzzel**
- If you want minimal and fast
- Simple configuration

### For Both
**Ulauncher**
- If you want GUI configuration
- Need extension system
- Prefer ease of use

## Theming Tips

### Match Your Color Scheme
All launchers should match your overall theme:
```bash
# Define colors once
BG="#1e1e2e"
FG="#cdd6f4"
ACCENT="#89b4fa"

# Use in launcher configs
```

### Icon Themes
Ensure consistent icons:
```bash
# Install icon theme
sudo pacman -S papirus-icon-theme

# Set in launcher config
# Rofi: configuration { icon-theme: "Papirus-Dark"; }
# Wofi: icon-theme=Papirus-Dark
```

### Font Consistency
Use same font as your terminal/system:
```bash
font=JetBrains Mono:size=11
```

## Troubleshooting

### Rofi Not Showing Icons
```bash
# Check icon theme installed
ls /usr/share/icons/

# Set in config
show-icons: true;
icon-theme: "Papirus-Dark";
```

### Wofi Appears Tiny
```bash
# Set explicit size in config
width=600
height=400
```

### Launcher Not Finding Apps
```bash
# Update desktop database
sudo update-desktop-database

# Check .desktop files exist
ls /usr/share/applications/
ls ~/.local/share/applications/
```

## Conclusion

Your choice of launcher depends on your window manager and preferences:

- **Rofi**: Best overall for X11, highly customizable
- **Wofi**: Best for Wayland, good balance
- **dmenu**: Best for minimalists
- **Fuzzel**: Best for Wayland minimalists
- **Ulauncher**: Best for GUI preference

All are included in this repository's configs, so you can try each and decide what works best for your workflow.