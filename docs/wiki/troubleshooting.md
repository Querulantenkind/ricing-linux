# Troubleshooting Guide

This guide covers common issues you might encounter when setting up or using Hyprland or i3wm, along with their solutions.

## General Issues

### System Won't Boot to Window Manager

**Symptoms**: Black screen or return to login after attempting to start WM.

**Solutions**:
1. Check logs:
   ```bash
   # For systemd-based systems
   journalctl -b -0
   
   # For X11 specifically
   cat ~/.local/share/xorg/Xorg.0.log
   
   # For Hyprland
   cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log
   ```

2. Verify your display manager is configured:
   ```bash
   # Check if display manager is running
   systemctl status display-manager
   
   # Check available sessions
   ls /usr/share/xsessions/    # For X11
   ls /usr/share/wayland-sessions/  # For Wayland
   ```

3. Test WM from TTY:
   ```bash
   # Switch to TTY (Ctrl+Alt+F2)
   # For i3:
   startx
   
   # For Hyprland:
   Hyprland
   ```

### Configuration File Not Loading

**Symptoms**: Changes to config file don't take effect.

**Solutions**:
1. Check config file location:
   ```bash
   # i3
   ls -la ~/.config/i3/config
   
   # Hyprland
   ls -la ~/.config/hypr/hyprland.conf
   ```

2. Verify syntax:
   ```bash
   # i3
   i3 -C
   
   # Hyprland will show errors in log
   cat /tmp/hypr/*/hyprland.log | grep -i error
   ```

3. Reload configuration:
   ```bash
   # i3
   i3-msg reload
   
   # Hyprland
   hyprctl reload
   ```

### Keybindings Not Working

**Symptoms**: Keyboard shortcuts don't execute commands.

**Solutions**:
1. Test if WM receives input:
   ```bash
   # Monitor i3 events
   i3-msg -t subscribe -m '[ "binding" ]'
   
   # Monitor Hyprland events
   hyprctl event
   ```

2. Check for conflicts:
   ```bash
   # Search for duplicate bindings in config
   grep "bindsym" ~/.config/i3/config | sort
   grep "bind" ~/.config/hypr/hyprland.conf | sort
   ```

3. Verify Mod key is correctly set:
   ```bash
   # i3: Check Mod1 (Alt) or Mod4 (Super)
   xmodmap | grep mod
   
   # Test key detection
   xev  # For X11
   wev  # For Wayland
   ```

## Hyprland-Specific Issues

### NVIDIA GPU Problems

**Symptoms**: Crashes, artifacts, or black screen with NVIDIA.

**Solutions**:
1. Ensure minimum driver version:
   ```bash
   nvidia-smi | grep "Driver Version"
   # Need 515+ for basic support, 525+ recommended
   ```

2. Enable necessary environment variables in `hyprland.conf`:
   ```bash
   env = LIBVA_DRIVER_NAME,nvidia
   env = XDG_SESSION_TYPE,wayland
   env = GBM_BACKEND,nvidia-drm
   env = __GLX_VENDOR_LIBRARY_NAME,nvidia
   env = WLR_NO_HARDWARE_CURSORS,1
   ```

3. Enable DRM kernel mode setting:
   ```bash
   # Add to /etc/modprobe.d/nvidia.conf
   options nvidia-drm modeset=1
   
   # Rebuild initramfs
   sudo mkinitcpio -P
   ```

### Screen Tearing

**Symptoms**: Visual tearing during animations or scrolling.

**Solutions**:
1. Ensure VRR is configured:
   ```bash
   # In hyprland.conf
   misc {
       vrr = 1
   }
   ```

2. Check monitor configuration:
   ```bash
   # Get current monitors
   hyprctl monitors
   
   # Set proper refresh rate
   monitor=DP-1,1920x1080@144,0x0,1
   ```

### Animations Stuttering

**Symptoms**: Choppy or laggy animations.

**Solutions**:
1. Reduce animation complexity:
   ```bash
   animations {
       enabled = yes
       bezier = myBezier, 0.05, 0.9, 0.1, 1.0
       animation = windows, 1, 4, myBezier
       animation = fade, 1, 4, default
   }
   ```

2. Check system load:
   ```bash
   htop
   # Look for CPU/GPU bottlenecks
   ```

### Cursor Invisible or Glitchy

**Symptoms**: Cursor not visible or showing artifacts.

**Solutions**:
1. Disable hardware cursors (especially NVIDIA):
   ```bash
   env = WLR_NO_HARDWARE_CURSORS,1
   ```

2. Set cursor theme:
   ```bash
   exec-once = hyprctl setcursor Bibata-Modern-Classic 24
   ```

### Apps Not Opening

**Symptoms**: Applications fail to launch or crash immediately.

**Solutions**:
1. Check if it's an X11 app needing XWayland:
   ```bash
   # Ensure XWayland is enabled
   xwayland {
       force_zero_scaling = true
   }
   ```

2. Try running from terminal to see errors:
   ```bash
   alacritty -e your-app
   ```

3. Check for missing environment variables:
   ```bash
   env = QT_QPA_PLATFORM,wayland
   env = SDL_VIDEODRIVER,wayland
   env = CLUTTER_BACKEND,wayland
   ```

## i3wm-Specific Issues

### Compositor Not Starting

**Symptoms**: No transparency, shadows, or screen tearing present.

**Solutions**:
1. Verify picom is installed:
   ```bash
   which picom
   ```

2. Check if picom is running:
   ```bash
   ps aux | grep picom
   ```

3. Start manually to see errors:
   ```bash
   picom --config ~/.config/picom/picom.conf
   ```

4. Check autostart in i3 config:
   ```bash
   grep "picom" ~/.config/i3/config
   # Should have: exec_always --no-startup-id picom
   ```

### Status Bar Not Showing

**Symptoms**: No status bar visible.

**Solutions**:
1. Check if bar is hidden:
   ```bash
   # i3 config should have
   bar {
       mode dock
       hidden_state hide
       modifier $mod
   }
   # Try pressing Mod key
   ```

2. For Polybar:
   ```bash
   # Check if running
   ps aux | grep polybar
   
   # Launch manually
   ~/.config/polybar/launch.sh
   
   # Check logs
   journalctl --user -u polybar
   ```

3. Verify bar configuration:
   ```bash
   # Test polybar config
   polybar --config=~/.config/polybar/config.ini mybar
   ```

### Gaps Not Working

**Symptoms**: Windows are touching, no gaps visible.

**Solutions**:
1. Verify i3-gaps or i3 version:
   ```bash
   i3 --version
   # Need i3-gaps or i3 v4.22+
   ```

2. Check gap configuration:
   ```bash
   # In i3 config
   gaps inner 10
   gaps outer 5
   ```

3. Ensure smart gaps is configured:
   ```bash
   smart_gaps on
   smart_borders on
   ```

### Windows Opening on Wrong Workspace

**Symptoms**: Applications open on unexpected workspaces.

**Solutions**:
1. Add window rules:
   ```bash
   # In i3 config
   assign [class="Firefox"] $ws2
   assign [class="discord"] $ws3
   ```

2. Find window class:
   ```bash
   # Run this and click on window
   xprop | grep WM_CLASS
   ```

### i3lock Not Working

**Symptoms**: Screen doesn't lock or shows errors.

**Solutions**:
1. Test i3lock directly:
   ```bash
   i3lock -c 000000
   ```

2. Check permissions:
   ```bash
   ls -l /usr/bin/i3lock
   # May need to be setuid root for some features
   ```

3. For i3lock-color:
   ```bash
   i3lock -c 000000 --show-failed-attempts
   ```

## Display Issues

### Wrong Resolution

**Symptoms**: Display not at native resolution.

**Solutions**:
1. For X11:
   ```bash
   # Check available modes
   xrandr
   
   # Set resolution
   xrandr --output HDMI-1 --mode 1920x1080 --rate 60
   
   # Add to i3 config
   exec_always xrandr --output HDMI-1 --mode 1920x1080
   ```

2. For Hyprland:
   ```bash
   # In hyprland.conf
   monitor=HDMI-A-1,1920x1080@60,0x0,1
   
   # Check current settings
   hyprctl monitors
   ```

### Multi-Monitor Issues

**Symptoms**: Monitors not detected or positioned incorrectly.

**Solutions**:
1. For X11:
   ```bash
   # List monitors
   xrandr --listmonitors
   
   # Position monitors
   xrandr --output HDMI-1 --right-of eDP-1
   
   # Use arandr for GUI configuration
   arandr
   ```

2. For Hyprland:
   ```bash
   # In hyprland.conf
   monitor=eDP-1,1920x1080@144,0x0,1
   monitor=HDMI-A-1,1920x1080@60,1920x0,1
   
   # Workspace per monitor
   workspace=1,monitor:eDP-1
   workspace=2,monitor:HDMI-A-1
   ```

### High DPI Issues

**Symptoms**: Everything too small or inconsistent sizes.

**Solutions**:
1. For X11:
   ```bash
   # Set DPI in ~/.Xresources
   Xft.dpi: 144
   
   # Reload
   xrdb ~/.Xresources
   
   # For QT apps
   export QT_SCALE_FACTOR=1.5
   ```

2. For Hyprland:
   ```bash
   # In hyprland.conf
   monitor=eDP-1,1920x1080,0x0,1.5
   
   # Per-app scaling
   env = GDK_SCALE,1.5
   env = QT_SCALE_FACTOR,1.5
   ```

## Application Issues

### Terminal Not Starting

**Symptoms**: Terminal keybind does nothing.

**Solutions**:
1. Verify terminal is installed:
   ```bash
   which alacritty
   which kitty
   ```

2. Test from another terminal:
   ```bash
   alacritty
   # Look for error messages
   ```

3. Check config syntax:
   ```bash
   alacritty --help
   # Will show if config has errors
   ```

### Rofi/Wofi Not Showing

**Symptoms**: Launcher keybind doesn't open menu.

**Solutions**:
1. Test manually:
   ```bash
   rofi -show drun
   wofi --show drun
   ```

2. Check for conflicts:
   ```bash
   # Kill existing instances
   killall rofi
   killall wofi
   ```

3. Verify theme exists:
   ```bash
   ls ~/.config/rofi/themes/
   ls ~/.config/wofi/
   ```

### Notifications Not Appearing

**Symptoms**: No notification popups.

**Solutions**:
1. Check notification daemon:
   ```bash
   # Kill existing daemons
   killall dunst
   killall mako
   
   # Start manually
   dunst &
   mako &
   ```

2. Test notification:
   ```bash
   notify-send "Test" "This is a test notification"
   ```

3. Check configuration:
   ```bash
   # Dunst
   cat ~/.config/dunst/dunstrc
   
   # Mako
   cat ~/.config/mako/config
   ```

## Performance Issues

### High CPU Usage

**Symptoms**: CPU constantly high with window manager.

**Solutions**:
1. Identify culprit:
   ```bash
   htop
   # Sort by CPU usage
   ```

2. Reduce status bar polling:
   ```bash
   # In polybar config
   interval = 5  # Increase interval
   ```

3. Disable expensive animations:
   ```bash
   # Hyprland
   animations {
       enabled = false
   }
   ```

### High Memory Usage

**Symptoms**: Excessive RAM consumption.

**Solutions**:
1. Check for memory leaks:
   ```bash
   ps aux --sort=-%mem | head
   ```

2. Restart window manager:
   ```bash
   # i3
   i3-msg restart
   
   # Hyprland
   hyprctl reload
   ```

### Slow Startup

**Symptoms**: Long time from login to usable desktop.

**Solutions**:
1. Check autostart items:
   ```bash
   # i3
   grep "exec" ~/.config/i3/config
   
   # Hyprland
   grep "exec-once" ~/.config/hypr/hyprland.conf
   ```

2. Use systemd services for non-critical items:
   ```bash
   systemctl --user enable polybar.service
   ```

3. Profile startup:
   ```bash
   systemd-analyze blame
   ```

## Theme Issues

### GTK Theme Not Applied

**Symptoms**: GTK apps don't match system theme.

**Solutions**:
1. Set GTK theme:
   ```bash
   # In ~/.config/gtk-3.0/settings.ini
   [Settings]
   gtk-theme-name=Catppuccin-Mocha
   gtk-icon-theme-name=Papirus-Dark
   ```

2. For Wayland, use environment variables:
   ```bash
   env = GTK_THEME,Catppuccin-Mocha
   ```

3. Use tools:
   ```bash
   lxappearance  # X11
   nwg-look      # Wayland
   ```

### Colors Not Matching

**Symptoms**: Inconsistent colors across components.

**Solutions**:
1. Verify all components source the same color file:
   ```bash
   # Create central colors file
   ~/.config/colors.conf
   
   # Source in each config
   source = ~/.config/colors.conf
   ```

2. Reload all components after theme change:
   ```bash
   ./apply-theme.sh
   ```

### Font Issues

**Symptoms**: Wrong fonts or missing glyphs.

**Solutions**:
1. Install required fonts:
   ```bash
   # Check installed fonts
   fc-list | grep "JetBrains"
   
   # Refresh font cache
   fc-cache -fv
   ```

2. Configure font fallback:
   ```bash
   # In ~/.config/fontconfig/fonts.conf
   ```

## Audio/Media Issues

### Media Keys Not Working

**Symptoms**: Volume/brightness keys don't work.

**Solutions**:
1. Bind media keys:
   ```bash
   # i3 config
   bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
   bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
   bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
   ```

2. For brightness:
   ```bash
   bindsym XF86MonBrightnessUp exec brightnessctl set +5%
   bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
   ```

### No Audio

**Symptoms**: System has no sound output.

**Solutions**:
1. Check PipeWire/PulseAudio:
   ```bash
   systemctl --user status pipewire pipewire-pulse
   pactl info
   ```

2. List sinks:
   ```bash
   pactl list sinks short
   ```

3. Set default sink:
   ```bash
   pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
   ```

## Network Issues

### Network Applet Not Showing

**Symptoms**: No network icon in system tray.

**Solutions**:
1. For i3/X11:
   ```bash
   exec --no-startup-id nm-applet
   ```

2. For Hyprland:
   ```bash
   exec-once = nm-applet --indicator
   ```

3. Use NetworkManager:
   ```bash
   nmcli device wifi list
   nmcli device wifi connect SSID password PASSWORD
   ```

## Getting Help

If issues persist:

1. Check official documentation:
   - Hyprland: https://wiki.hyprland.org
   - i3: https://i3wm.org/docs

2. Search GitHub issues:
   - This repository
   - Upstream projects

3. Community resources:
   - r/unixporn (show your setup, ask questions)
   - Arch Wiki (comprehensive guides)
   - Distribution forums

4. Collect debugging info:
   ```bash
   # System info
   neofetch
   
   # GPU info
   lspci | grep -i vga
   
   # Logs
   journalctl -b -0 > system.log
   ```