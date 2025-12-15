# Performance Optimization Guide

This guide covers techniques to optimize your Hyprland or i3wm setup for better performance, lower resource usage, and smoother experience.

## Measuring Performance

Before optimizing, establish baselines:

### System Resource Usage
```bash
# Overall system stats
htop

# Memory usage
free -h

# Detailed process info
ps aux --sort=-%mem | head -20
ps aux --sort=-%cpu | head -20

# GPU usage (for Hyprland)
nvidia-smi  # NVIDIA
radeontop   # AMD
intel_gpu_top  # Intel
```

### Window Manager Performance
```bash
# Monitor frame times (Hyprland)
hyprctl monitors | grep -A 10 "Monitor"

# Check compositor performance
glxinfo | grep "direct rendering"
```

### Startup Time
```bash
# System boot
systemd-analyze

# User services
systemd-analyze blame --user

# Time WM startup
time i3        # or
time Hyprland
```

## General Optimizations

### Reduce Autostart Items

Review and minimize programs that start automatically:

**i3 Config:**
```bash
# Audit your exec commands
grep "exec" ~/.config/i3/config

# Keep only essentials:
exec --no-startup-id picom
exec --no-startup-id dunst
exec_always --no-startup-id ~/.config/polybar/launch.sh

# Move non-critical items to systemd services or manual launch
```

**Hyprland Config:**
```bash
# Audit exec-once commands
grep "exec-once" ~/.config/hypr/hyprland.conf

# Keep only essentials:
exec-once = waybar
exec-once = mako
exec-once = hyprpaper
exec-once = hypridle

# Remove unnecessary background apps
```

### Use Systemd User Services

Instead of launching everything from WM config, use systemd for better control:

```bash
# Create service: ~/.config/systemd/user/polybar.service
[Unit]
Description=Polybar status bar
PartOf=graphical-session.target

[Service]
ExecStart=/usr/bin/polybar mybar
Restart=on-failure

[Install]
WantedBy=graphical-session.target

# Enable
systemctl --user enable polybar.service
```

Benefits:
- Parallel startup
- Automatic restarts
- Better logging
- Resource limits

### Optimize Shell Startup

Slow shell startup affects terminal opening:

```bash
# Time your shell
time zsh -i -c exit
time bash -i -c exit

# Profile zsh
zsh -xv 2>&1 | ts -i "%.s" > /tmp/zsh-profile.log

# Common culprits:
# - Too many plugins
# - Slow prompt themes
# - Network checks in .zshrc/.bashrc
```

**Optimizations:**
- Use lazy loading for plugins
- Minimize startup commands
- Use faster prompt (e.g., Starship in evaluation mode)
- Cache slow operations

## i3wm-Specific Optimizations

### Compositor Settings (Picom)

Picom can be resource-intensive. Optimize its configuration:

```bash
# ~/.config/picom/picom.conf

# Use simpler backend
backend = "glx";
# or for older systems
backend = "xrender";

# Reduce vsync overhead
vsync = true;
# Try different vsync methods if issues
# vsync = false;  # Disable if not needed

# Simplify blur
blur-method = "dual_kawase";
blur-strength = 3;  # Lower values = better performance

# Reduce shadow complexity
shadow = true;
shadow-radius = 12;  # Lower = faster
shadow-opacity = 0.75;

# Disable expensive features
blur-background = false;  # If not needed
fading = false;  # If animations not important

# Performance-focused settings
glx-no-stencil = true;
glx-no-rebind-pixmap = true;
use-damage = true;  # Important for performance

# Exclude apps that don't need compositing
focus-exclude = [ "class_g = 'Cairo-clock'" ];
```

**Test impact:**
```bash
# Without compositor
killall picom
# Use system and note performance

# With compositor
picom --config ~/.config/picom/picom.conf
# Compare
```

### Status Bar Optimization (Polybar)

Reduce Polybar resource usage:

```bash
# ~/.config/polybar/config.ini

[bar/mybar]
# Reduce update frequency
interval = 2  # Default is 1

[module/cpu]
# Less frequent updates
interval = 3

[module/memory]
interval = 5

[module/filesystem]
interval = 60

# Disable modules you don't use
# Comment out expensive scripts
```

### Reduce Window Borders and Gaps

Minimal visual elements = better performance:

```bash
# Minimal borders
default_border pixel 1
default_floating_border pixel 1

# Minimal gaps
gaps inner 5
gaps outer 0

# Smart features to reduce redraws
smart_gaps on
smart_borders on
```

### Optimize Window Rules

Prevent unnecessary operations:

```bash
# Assign windows to workspaces at launch
assign [class="firefox"] $ws1
# Prevents workspace switching

# Set default floating for specific apps
for_window [class="Pavucontrol"] floating enable
# Avoids tiling recalculation
```

## Hyprland-Specific Optimizations

### Animation Optimization

Animations look great but cost performance:

```bash
# ~/.config/hypr/hyprland.conf

animations {
    enabled = yes
    
    # Use simpler bezier curves
    bezier = simple, 0.16, 1, 0.3, 1
    
    # Reduce animation time
    animation = windows, 1, 3, simple
    animation = windowsOut, 1, 3, simple
    animation = border, 1, 5, default
    animation = fade, 1, 4, default
    animation = workspaces, 1, 4, simple
}

# For maximum performance, disable animations
animations {
    enabled = no
}
```

### Decoration Optimization

Reduce visual effects:

```bash
decoration {
    rounding = 5  # Lower values = better performance
    
    # Disable expensive effects
    blur {
        enabled = false  # Blur is expensive
    }
    
    drop_shadow = false  # Shadows cost performance
    
    # Minimal shadow if needed
    shadow_range = 10  # Lower range
    shadow_render_power = 2  # Lower power
}
```

### Layout Optimization

Some layouts are more efficient:

```bash
# Use master layout for better performance
master {
    new_is_master = false
    mfact = 0.5
}

# Dwindle is also efficient
dwindle {
    pseudotile = false  # Disable if not needed
    preserve_split = yes
}
```

### Rendering Optimization

Optimize rendering pipeline:

```bash
render {
    # Explicit sync (better frame pacing)
    explicit_sync = 1
    
    # Direct scanout (when supported)
    direct_scanout = true
}

misc {
    # Disable features you don't use
    vfr = true  # Variable frame rate
    vrr = 1     # Variable refresh rate
    
    # Reduce unnecessary redraws
    no_direct_scanout = false
    
    # Performance settings
    disable_hyprland_logo = true
    disable_splash_rendering = true
}
```

### Monitor Optimization

Proper monitor configuration helps:

```bash
# Use exact refresh rates
monitor=DP-1,1920x1080@144,0x0,1

# Disable monitors you don't use
monitor=HDMI-A-1,disable

# For laptops, consider lower refresh when on battery
# Can be scripted based on power state
```

## GPU-Specific Optimizations

### NVIDIA Optimization

```bash
# Environment variables in hyprland.conf
env = LIBVA_DRIVER_NAME,nvidia
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = WLR_NO_HARDWARE_CURSORS,1

# Force maximum performance
env = __GL_GSYNC_ALLOWED,1
env = __GL_VRR_ALLOWED,1

# Kernel parameter for better performance
# Add to kernel parameters:
nvidia-drm.modeset=1 nvidia.NVreg_PreserveVideoMemoryAllocations=1
```

### AMD Optimization

```bash
# Enable TearFree
# In /etc/X11/xorg.conf.d/20-amdgpu.conf (for i3/X11)
Section "Device"
    Identifier "AMD"
    Driver "amdgpu"
    Option "TearFree" "true"
    Option "DRI" "3"
EndSection

# For Hyprland (Wayland), usually works out of box
# But can force features:
env = WLR_DRM_NO_ATOMIC,1  # If issues with atomic modesetting
```

### Intel Optimization

```bash
# Usually good by default
# For X11, enable TearFree:
# In /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "TearFree" "true"
    Option "DRI" "3"
EndSection
```

## Terminal Optimization

Terminals can be resource-heavy with many instances:

### Choose Efficient Terminal
```bash
# Performance comparison (generally):
# 1. st (simple terminal) - fastest
# 2. alacritty - very fast, GPU-accelerated
# 3. kitty - fast, feature-rich
# 4. wezterm - slower, feature-heavy
# 5. urxvt - lightweight but dated
```

### Optimize Alacritty
```yaml
# ~/.config/alacritty/alacritty.yml

# Reduce scrollback
scrolling:
  history: 5000  # Default 10000

# Simple shell integration
shell:
  program: /bin/zsh
  # Don't run complex commands at startup

# Disable features you don't use
window:
  decorations: none
  dynamic_title: false

# Optimize rendering
draw_bold_text_with_bright_colors: false
```

### Optimize Kitty
```bash
# ~/.config/kitty/kitty.conf

# Reduce memory usage
scrollback_lines 5000

# Disable features
update_check_interval 0
enable_audio_bell no

# Performance
repaint_delay 10
input_delay 3
sync_to_monitor yes
```

## Application-Specific Tips

### Firefox/Chrome
```bash
# Use Wayland native (better performance on Hyprland)
# Firefox: about:config
# Set widget.use-xdg-desktop-portal.file-picker to 1
# Or start with: MOZ_ENABLE_WAYLAND=1 firefox

# Chrome/Chromium flags:
--enable-features=UseOzonePlatform
--ozone-platform=wayland
```

### VS Code
```bash
# Disable GPU acceleration if causing issues
code --disable-gpu

# Or in settings.json
"window.titleBarStyle": "custom"
```

### Electron Apps
```bash
# Many electron apps have Wayland support
--enable-features=UseOzonePlatform --ozone-platform=wayland

# Add to .desktop file or create wrapper
```

## System-Level Optimizations

### Disable Unnecessary Services

```bash
# List running services
systemctl list-units --type=service --state=running

# Disable unneeded services
sudo systemctl disable bluetooth.service  # If you don't use BT
sudo systemctl disable cups.service       # If no printer
```

### CPU Governor

```bash
# Check current governor
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Set performance governor (more power, better performance)
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# For laptops on battery, schedutil is good balance
echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Make permanent with cpupower
sudo cpupower frequency-set -g performance
```

### I/O Scheduler

```bash
# Check current scheduler
cat /sys/block/sda/queue/scheduler

# For SSDs, use none or mq-deadline
echo none | sudo tee /sys/block/nvme0n1/queue/scheduler

# For HDDs, use mq-deadline or bfq
```

### Swappiness

```bash
# Reduce swappiness for better responsiveness (if enough RAM)
sudo sysctl vm.swappiness=10

# Make permanent in /etc/sysctl.d/99-swappiness.conf
vm.swappiness=10
```

## Memory Management

### Reduce Memory Usage

```bash
# Find memory hogs
ps aux --sort=-%mem | head -20

# Clear cache (usually not needed, but can help)
sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
```

### Use Lighter Alternatives

| Heavy | Light Alternative |
|-------|------------------|
| Firefox | Brave, qutebrowser |
| Chrome | Brave, Chromium |
| VS Code | Neovim, Helix |
| Electron apps | Native alternatives |
| GIMP | Pinta, Krita |

## Monitoring Performance

### Real-time Monitoring

```bash
# System overview
btop  # or htop

# Per-process GPU usage (NVIDIA)
nvtop

# Disk I/O
iotop

# Network
iftop
```

### Create Performance Scripts

```bash
# ~/scripts/perf-check.sh
#!/bin/bash
echo "=== CPU ==="
top -bn1 | head -20

echo -e "\n=== Memory ==="
free -h

echo -e "\n=== GPU ==="
nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv

echo -e "\n=== Top Processes ==="
ps aux --sort=-%mem | head -10
```

## Benchmarking

Compare different configurations:

```bash
# Test WM startup time
time i3
time Hyprland

# Test application launch
time alacritty -e exit

# Stress test
stress-ng --cpu 4 --timeout 60s

# Graphics benchmark
glxgears  # Simple FPS test
vblank_mode=0 glxgears  # Unlimited FPS
```

## Performance Checklist

Quick checklist for optimization:

- [ ] Minimize autostart items
- [ ] Optimize compositor settings (picom)
- [ ] Reduce animation complexity (Hyprland)
- [ ] Disable blur and heavy effects
- [ ] Use simple status bar modules
- [ ] Optimize terminal configuration
- [ ] Set appropriate CPU governor
- [ ] Disable unused system services
- [ ] Use lightweight alternatives where possible
- [ ] Monitor resource usage regularly

## Performance vs Features Trade-off

Balance performance with usability:

**Maximum Performance:**
- No animations
- No compositor (X11) or minimal effects
- Basic status bar
- Minimal autostart
- May sacrifice aesthetics

**Balanced:**
- Simple animations
- Essential compositor features
- Feature-rich status bar
- Necessary background apps
- Good middle ground

**Feature-Rich:**
- Full animations and effects
- All features enabled
- Multiple status bar modules
- Many background apps
- Requires good hardware

## Conclusion

Performance optimization is about finding the right balance for your hardware and usage. Start with measurements, make incremental changes, and test the impact. Not all optimizations will benefit every system - focus on what matters for your specific setup.

Most modern systems can handle full-featured rices without issues. Optimize when you notice problems or are on limited hardware.