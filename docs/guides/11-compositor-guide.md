# Compositor Guide

A comprehensive guide to compositors for X11 and Wayland, including Picom, and alternatives.

## Table of Contents

1. [What is a Compositor?](#what-is-a-compositor)
2. [X11 Compositors](#x11-compositors)
   - [Picom](#picom)
   - [Compiz](#compiz)
   - [Compton (Deprecated)](#compton-deprecated)
3. [Wayland Compositors](#wayland-compositors)
4. [Configuration](#configuration)
5. [Effects & Animations](#effects--animations)
6. [Performance Optimization](#performance-optimization)
7. [Troubleshooting](#troubleshooting)

---

## What is a Compositor?

A **compositor** (or compositing window manager) combines window contents into a single image before displaying on screen. This enables:

- **Transparency** - See through windows
- **Shadows** - Drop shadows under windows
- **Blur** - Blur background behind transparent windows
- **Animations** - Window open/close/focus effects
- **Vsync** - Eliminate screen tearing
- **Rounded corners** - Soften window edges

### Do You Need a Compositor?

**X11 Window Managers (i3, bspwm, etc.):**
- Don't include compositing
- Require separate compositor (Picom)
- Without compositor: no transparency, possible tearing

**Wayland Compositors (Hyprland, Sway):**
- Compositor is built-in
- No separate software needed
- Full effects out of the box

---

## X11 Compositors

### Picom

The most popular compositor for X11 ricing. Fork of Compton with active development.

#### Installation

```bash
# Arch Linux
sudo pacman -S picom

# Ubuntu/Debian
sudo apt install picom

# Fedora
sudo dnf install picom

# From source (latest features)
git clone https://github.com/yshui/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install
```

#### Basic Configuration

Create `~/.config/picom/picom.conf`:

```ini
#################################
#             Shadows           #
#################################

shadow = true;
shadow-radius = 12;
shadow-offset-x = -7;
shadow-offset-y = -7;
shadow-opacity = 0.6;

shadow-exclude = [
    "name = 'Notification'",
    "class_g = 'Conky'",
    "class_g ?= 'Notify-osd'",
    "class_g = 'Cairo-clock'",
    "_GTK_FRAME_EXTENTS@:c"
];

#################################
#           Fading              #
#################################

fading = true;
fade-in-step = 0.03;
fade-out-step = 0.03;
fade-delta = 5;

fade-exclude = [];

#################################
#   Transparency / Opacity      #
#################################

inactive-opacity = 0.95;
active-opacity = 1.0;
frame-opacity = 1.0;
inactive-opacity-override = false;

focus-exclude = [
    "class_g = 'Cairo-clock'"
];

opacity-rule = [
    "90:class_g = 'Alacritty'",
    "90:class_g = 'kitty'",
    "95:class_g = 'Rofi'",
];

#################################
#           Corners             #
#################################

corner-radius = 10;

rounded-corners-exclude = [
    "window_type = 'dock'",
    "window_type = 'desktop'"
];

#################################
#            Blur               #
#################################

blur-method = "dual_kawase";
blur-size = 12;
blur-strength = 5;
blur-background = true;
blur-background-frame = false;
blur-background-fixed = false;

blur-background-exclude = [
    "window_type = 'dock'",
    "window_type = 'desktop'",
    "_GTK_FRAME_EXTENTS@:c"
];

#################################
#       General Settings        #
#################################

backend = "glx";
vsync = true;
mark-wmwin-focused = true;
mark-ovredir-focused = true;
detect-rounded-corners = true;
detect-client-opacity = true;
detect-transient = true;
use-damage = true;
log-level = "warn";

wintypes:
{
    tooltip = { fade = true; shadow = true; opacity = 0.9; focus = true; };
    dock = { shadow = false; };
    dnd = { shadow = false; };
    popup_menu = { opacity = 0.95; };
    dropdown_menu = { opacity = 0.95; };
};
```

#### Starting Picom

**Manual start:**
```bash
picom --config ~/.config/picom/picom.conf &
```

**In i3 config:**
```bash
# ~/.config/i3/config
exec_always --no-startup-id picom --config ~/.config/picom/picom.conf
```

**In .xinitrc:**
```bash
picom &
exec i3
```

#### Picom Forks with Extra Features

**picom-ftlabs-git (Animations):**
```bash
# AUR
yay -S picom-ftlabs-git

# Enables window animations
# Add to config:
animations = true;
animation-stiffness = 200;
animation-window-mass = 0.5;
animation-dampening = 20;
animation-for-open-window = "zoom";
animation-for-unmap-window = "zoom";
```

**picom-jonaburg-git (More animations):**
```bash
yay -S picom-jonaburg-git

# Animation options
transition-length = 300;
transition-pow-x = 0.1;
transition-pow-y = 0.1;
transition-pow-w = 0.1;
transition-pow-h = 0.1;
size-transition = true;
```

#### Picom Options Reference

| Option | Description | Default |
|--------|-------------|---------|
| `shadow` | Enable shadows | false |
| `shadow-radius` | Shadow blur radius | 12 |
| `shadow-opacity` | Shadow opacity | 0.75 |
| `fading` | Enable fading | false |
| `fade-in-step` | Fade in speed | 0.028 |
| `fade-out-step` | Fade out speed | 0.03 |
| `inactive-opacity` | Unfocused window opacity | 1.0 |
| `corner-radius` | Rounded corners radius | 0 |
| `blur-method` | Blur algorithm | none |
| `backend` | Rendering backend | xrender |
| `vsync` | Vertical sync | false |

### Compiz

Classic compositor with extensive effects. Mostly for nostalgic use.

```bash
# Ubuntu
sudo apt install compiz compiz-plugins compizconfig-settings-manager

# Configure
ccsm
```

**Popular effects:**
- Wobbly windows
- Desktop cube
- Fire/Water effects
- Expo view

**Note:** Heavy, not recommended for modern ricing. Use Picom instead.

### Compton (Deprecated)

Original project, now unmaintained. Picom is the successor.

```bash
# If you have compton configs, migrate to picom
picom --config ~/.config/compton.conf  # Usually works
```

---

## Wayland Compositors

Wayland compositors have built-in compositing. No separate software needed.

### Hyprland

Full compositor with animations and effects.

```bash
# ~/.config/hypr/hyprland.conf

# Blur
decoration {
    blur {
        enabled = true
        size = 8
        passes = 2
        new_optimizations = true
    }
    
    # Shadows
    drop_shadow = true
    shadow_range = 15
    shadow_render_power = 3
    col.shadow = rgba(00000055)
    
    # Rounded corners
    rounding = 10
    
    # Opacity
    active_opacity = 1.0
    inactive_opacity = 0.9
}

# Animations
animations {
    enabled = true
    
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}
```

### Sway

Minimal compositor, fewer effects than Hyprland.

```bash
# ~/.config/sway/config

# No blur by default
# Gaps
gaps inner 10
gaps outer 5

# Borders
default_border pixel 2
```

### Other Wayland Compositors

- **River** - Dynamic tiling, minimal
- **Wayfire** - Plugin-based, 3D effects
- **labwc** - Openbox-like for Wayland

---

## Configuration

### Per-Application Settings

**Picom opacity rules:**

```ini
opacity-rule = [
    "100:class_g = 'firefox'",
    "100:class_g = 'mpv'",
    "90:class_g = 'Alacritty' && focused",
    "80:class_g = 'Alacritty' && !focused",
    "95:class_g = 'Code'",
];
```

**Finding window class:**

```bash
# X11
xprop | grep WM_CLASS
# Click on window

# Wayland (Hyprland)
hyprctl clients | grep class
```

**Picom shadow exclude:**

```ini
shadow-exclude = [
    "class_g = 'Polybar'",
    "class_g = 'Rofi'",
    "window_type = 'menu'",
    "window_type = 'dropdown_menu'",
    "window_type = 'popup_menu'",
    "window_type = 'tooltip'",
    "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'",
];
```

### Backend Selection

**GLX (Recommended for most):**
```ini
backend = "glx";
glx-no-stencil = true;
glx-no-rebind-pixmap = true;
```

**EGL (Newer, may have issues):**
```ini
backend = "egl";
```

**XRender (Software, fallback):**
```ini
backend = "xrender";
```

### Multiple Monitors

**Picom handles multiple monitors automatically.**

For monitor-specific blur/effects, use window rules based on position or workspace.

---

## Effects & Animations

### Blur Effects

**Picom blur methods:**

```ini
# Dual Kawase (fast, good quality)
blur-method = "dual_kawase";
blur-strength = 5;

# Gaussian (classic)
blur-method = "gaussian";
blur-size = 12;
blur-deviation = 5.0;

# Box blur (very fast)
blur-method = "box";
blur-size = 12;

# Kernel blur (custom)
blur-method = "kernel";
blur-kern = "3x3box";
```

**Hyprland blur:**
```bash
decoration {
    blur {
        enabled = true
        size = 8          # Blur radius
        passes = 2        # Quality (more = better but slower)
        noise = 0.02      # Add noise for style
        contrast = 1.0
        brightness = 1.0
        vibrancy = 0.2    # Color vibrancy
    }
}
```

### Animations

**Hyprland animations:**

```bash
animations {
    enabled = true
    
    # Custom curves
    bezier = overshot, 0.05, 0.9, 0.1, 1.1
    bezier = smoothOut, 0.36, 0, 0.66, -0.56
    bezier = smoothIn, 0.25, 1, 0.5, 1
    
    # Window animations
    animation = windows, 1, 5, overshot, slide
    animation = windowsOut, 1, 4, smoothOut, slide
    animation = windowsMove, 1, 4, default
    
    # Fade animations
    animation = fade, 1, 5, smoothIn
    animation = fadeOut, 1, 5, smoothOut
    
    # Workspace animations
    animation = workspaces, 1, 6, default, slidevert
    # Options: slide, slidevert, fade, slidefade, slidefadevert
}
```

**Picom-ftlabs animations:**

```ini
animations = true;
animation-stiffness-in-tag = 125;
animation-stiffness-tag-change = 90;

animation-window-mass = 0.4;
animation-dampening = 15;
animation-clamping = true;

animation-for-open-window = "zoom";       # zoom, fly-in, slide-up, slide-down, slide-left, slide-right
animation-for-unmap-window = "squeeze";   # zoom, fly-in, slide-up, slide-down, slide-left, slide-right, squeeze
animation-for-transient-window = "slide-down";
```

### Rounded Corners

**Picom:**
```ini
corner-radius = 12;

rounded-corners-exclude = [
    "window_type = 'dock'",
    "window_type = 'desktop'",
    "class_g = 'Polybar'",
    "class_g = 'Rofi'",
];
```

**Hyprland:**
```bash
decoration {
    rounding = 10
}

# Per-window rules
windowrulev2 = rounding 0, class:^(Polybar)$
```

### Shadows

**Picom shadow tuning:**

```ini
shadow = true;
shadow-radius = 15;
shadow-offset-x = -15;
shadow-offset-y = -15;
shadow-opacity = 0.5;

# Shadow color (requires glx backend)
shadow-red = 0.0;
shadow-green = 0.0;
shadow-blue = 0.0;
```

**Hyprland:**
```bash
decoration {
    drop_shadow = true
    shadow_range = 20
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
    col.shadow_inactive = rgba(1a1a1a88)
    shadow_offset = 0 5
    shadow_scale = 1.0
}
```

---

## Performance Optimization

### Picom Performance

**For low-end hardware:**

```ini
# Use XRender backend
backend = "xrender";

# Disable expensive effects
shadow = false;
blur-background = false;
fading = false;

# Or minimal blur
blur-method = "box";
blur-size = 5;

# Reduce shadow complexity
shadow-radius = 5;
```

**For high-end hardware:**

```ini
backend = "glx";
vsync = true;
glx-no-stencil = true;
glx-no-rebind-pixmap = true;
use-damage = true;

# Full effects
blur-method = "dual_kawase";
blur-strength = 8;
```

### Hyprland Performance

```bash
# For performance
misc {
    vfr = true                  # Variable frame rate
    vrr = 1                     # Variable refresh rate
}

decoration {
    blur {
        enabled = true
        size = 5                # Lower = faster
        passes = 1              # Lower = faster
        new_optimizations = true
    }
}

# Disable animations if needed
animations {
    enabled = false
}
```

### Benchmark Your Setup

**Check FPS:**
```bash
# X11
glxgears -info

# Monitor compositor performance
picom --diagnostics
```

---

## Troubleshooting

### Screen Tearing

**Picom:**
```ini
vsync = true;
backend = "glx";
glx-use-copysubbuffer-mesa = true;
```

**NVIDIA:**
```bash
# /etc/X11/xorg.conf.d/20-nvidia.conf
Section "Device"
    Identifier "NVIDIA"
    Driver "nvidia"
    Option "TripleBuffer" "true"
EndSection

Section "Screen"
    Identifier "Screen0"
    Option "metamodes" "nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
EndSection
```

### Blur Not Working

**Check backend:**
```ini
backend = "glx";  # Required for blur
blur-method = "dual_kawase";
blur-background = true;
```

**Check exclusions:**
```ini
# Remove from blur-background-exclude if needed
```

### Shadows on Panels

**Exclude panels:**
```ini
shadow-exclude = [
    "class_g = 'Polybar'",
    "window_type = 'dock'",
];
```

### Flickering

**Try these options:**
```ini
unredir-if-possible = false;
use-damage = false;  # May reduce performance
```

### Window Borders Invisible

```ini
# Use frame opacity
frame-opacity = 1.0;
```

### Picom Crashes

**Check log:**
```bash
picom --config ~/.config/picom/picom.conf --log-level=debug

# Or log to file
picom --config ~/.config/picom/picom.conf 2>&1 | tee picom.log
```

**Common fixes:**
- Update graphics drivers
- Try different backend (glx/xrender)
- Remove problematic effects
- Check for conflicting compositor

### Compositor Not Starting

**Check for existing compositor:**
```bash
# Kill existing
pkill picom
pkill compton

# Start fresh
picom --config ~/.config/picom/picom.conf &
```

**Check dependencies:**
```bash
# Required libraries
ldd $(which picom) | grep "not found"
```

---

## Quick Reference

### Picom Commands

```bash
# Start
picom --config ~/.config/picom/picom.conf &

# Restart
pkill picom && picom --config ~/.config/picom/picom.conf &

# Debug mode
picom --diagnostics

# Test config
picom --config ~/.config/picom/picom.conf --log-level=debug
```

### Effect Comparison

| Effect | Picom | Hyprland | Sway |
|--------|-------|----------|------|
| Blur | ✓ | ✓ | ✗ |
| Shadows | ✓ | ✓ | ✗ |
| Rounded corners | ✓ | ✓ | ✗ |
| Animations | ✓ (fork) | ✓ | ✗ |
| Transparency | ✓ | ✓ | ✓ |
| Vsync | ✓ | ✓ | ✓ |

---

## See Also

- [configs/picom/picom.conf](../../configs/picom/picom.conf)
- [Hyprland Configuration](03-hyprland-basics.md)
- [Performance Guide](../wiki/performance.md)
- [Picom GitHub](https://github.com/yshui/picom)
