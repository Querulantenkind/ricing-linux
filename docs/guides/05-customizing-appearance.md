# Customizing Appearance

This guide covers how to customize the visual appearance of your system, from colors and fonts to themes and wallpapers.

## Color Schemes

### Choosing a Color Scheme

See [Color Schemes Reference](../references/color-schemes.md) for detailed information on popular schemes.

**Quick recommendations:**
- **Catppuccin Mocha**: Modern, pastel, excellent contrast
- **Nord**: Cool blues, professional look
- **Gruvbox**: Warm, retro aesthetic
- **Dracula**: Vibrant, high contrast
- **Tokyo Night**: Clean, contemporary

### Applying Themes from This Repository

```bash
cd ~/Documents/ricing-linux/themes

# List available themes
ls -la

# Apply a theme (automatically updates all configs)
./apply-theme.sh catppuccin
./apply-theme.sh nord
./apply-theme.sh gruvbox
./apply-theme.sh dracula
./apply-theme.sh tokyo-night
```

This updates:
- Window manager colors
- Status bar theme
- Terminal colors
- Application launcher
- Notification daemon
- GTK theme

### Manual Color Configuration

#### i3wm Colors

```bash
# ~/.config/i3/config

# Define colors
set $bg      #1e1e2e
set $fg      #cdd6f4
set $accent  #89b4fa
set $urgent  #f38ba8
set $inactive #45475a

# Window colors
#                       border    background  text    indicator  child_border
client.focused          $accent   $accent     $bg     $accent    $accent
client.focused_inactive $inactive $inactive   $fg     $inactive  $inactive
client.unfocused        $bg       $bg         $fg     $bg        $bg
client.urgent           $urgent   $urgent     $bg     $urgent    $urgent
client.placeholder      $bg       $bg         $fg     $bg        $bg
client.background       $bg

# i3bar colors
bar {
    colors {
        background $bg
        statusline $fg
        separator  $inactive
        
        #                  border    background  text
        focused_workspace  $accent   $accent     $bg
        active_workspace   $inactive $inactive   $fg
        inactive_workspace $bg       $bg         $inactive
        urgent_workspace   $urgent   $urgent     $bg
    }
}
```

#### Hyprland Colors

```bash
# ~/.config/hypr/hyprland.conf

general {
    col.active_border = rgb(89b4fa)
    col.inactive_border = rgb(45475a)
}

decoration {
    col.shadow = rgba(1a1a1aee)
}

# Or use gradients
general {
    col.active_border = rgb(89b4fa) rgb(cba6f7) 45deg
}
```

## Fonts

### Recommended Fonts

**Monospace (Coding/Terminal):**
- JetBrains Mono (ligatures, clean)
- Fira Code (ligatures, popular)
- Hack (clear, readable)
- Cascadia Code (Microsoft, ligatures)
- Source Code Pro (Adobe, classic)

**Sans-Serif (UI):**
- Inter (modern, clean)
- Roboto (Google, familiar)
- Noto Sans (comprehensive)
- Ubuntu (friendly)

**Icon Fonts:**
- Font Awesome (web icons)
- Material Design Icons
- Nerd Fonts (patched fonts with icons)

### Installing Fonts

```bash
# System-wide installation
sudo pacman -S ttf-jetbrains-mono ttf-fira-code ttf-hack
sudo pacman -S ttf-font-awesome

# From AUR
yay -S nerd-fonts-complete

# Manual installation
mkdir -p ~/.local/share/fonts
cp *.ttf ~/.local/share/fonts/
fc-cache -fv
```

### Fonts in This Repository

Included in `assets/fonts/`:
- JetBrains Mono
- Fira Code

To install:
```bash
cp -r ~/Documents/ricing-linux/assets/fonts/JetBrainsMono ~/.local/share/fonts/
cp -r ~/Documents/ricing-linux/assets/fonts/FiraCode ~/.local/share/fonts/
fc-cache -fv
```

### Configuring Fonts

#### Terminal (Alacritty)

```yaml
# ~/.config/alacritty/alacritty.yml
font:
  normal:
    family: JetBrains Mono
    style: Regular
  bold:
    family: JetBrains Mono
    style: Bold
  italic:
    family: JetBrains Mono
    style: Italic
  size: 11.0
```

#### Terminal (Kitty)

```bash
# ~/.config/kitty/kitty.conf
font_family      JetBrains Mono
bold_font        JetBrains Mono Bold
italic_font      JetBrains Mono Italic
bold_italic_font JetBrains Mono Bold Italic
font_size 11.0
```

#### Window Manager

```bash
# i3
font pango:JetBrains Mono 10

# Hyprland (in waybar)
// ~/.config/waybar/config.jsonc
"font-family": "JetBrains Mono",
"font-size": 11,
```

#### Rofi/Wofi

```css
/* Rofi: ~/.config/rofi/config.rasi */
* {
    font: "JetBrains Mono 11";
}

/* Wofi: ~/.config/wofi/style.css */
window {
    font-family: "JetBrains Mono";
    font-size: 11pt;
}
```

## Borders and Gaps

### i3wm Configuration

```bash
# Border style
default_border pixel 2
default_floating_border pixel 2

# Or with title bar
default_border normal 2

# Remove title bars
for_window [class=".*"] border pixel 2

# Gaps
gaps inner 10
gaps outer 5

# Smart gaps (hide when one window)
smart_gaps on
smart_borders on

# Border only when multiple windows
smart_borders no_gaps
```

### Hyprland Configuration

```bash
general {
    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = rgba(89b4faee)
    col.inactive_border = rgba(45475aaa)
    
    # No borders with one window
    no_border_on_floating = false
}
```

### Dynamic Gap Control

```bash
# i3
bindsym $mod+g gaps inner current plus 5
bindsym $mod+Shift+g gaps inner current minus 5

# Hyprland
bind = $mainMod, G, exec, hyprctl keyword general:gaps_in $(($(hyprctl getoption general:gaps_in | grep int | awk '{print $2}') + 5))
```

## Wallpapers

### Wallpaper Collection

Included in `assets/wallpapers/`:
- abstract/
- cyberpunk/
- minimal/
- nature/

### Setting Wallpapers

#### i3wm (with feh)

```bash
# In i3 config
exec_always --no-startup-id feh --bg-scale ~/Pictures/wallpaper.jpg

# Random wallpaper from folder
exec_always --no-startup-id feh --bg-scale --randomize ~/Pictures/wallpapers/*

# Different wallpaper per monitor
exec_always --no-startup-id feh --bg-scale ~/.config/wallpapers/monitor1.jpg --bg-scale ~/.config/wallpapers/monitor2.jpg
```

#### Hyprland (with hyprpaper)

```bash
# ~/.config/hypr/hyprpaper.conf
preload = ~/Pictures/wallpaper.jpg
wallpaper = ,~/Pictures/wallpaper.jpg

# Per-monitor
preload = ~/Pictures/wall1.jpg
preload = ~/Pictures/wall2.jpg
wallpaper = DP-1,~/Pictures/wall1.jpg
wallpaper = HDMI-A-1,~/Pictures/wall2.jpg

# In hyprland.conf
exec-once = hyprpaper
```

#### Alternative: swaybg (Wayland)

```bash
exec-once = swaybg -i ~/Pictures/wallpaper.jpg -m fill
```

### Dynamic Wallpapers

```bash
# Rotate wallpapers every hour
# Add to crontab: crontab -e
0 * * * * DISPLAY=:0 feh --bg-scale --randomize ~/Pictures/wallpapers/*
```

## Opacity and Transparency

### Picom (i3wm)

```bash
# ~/.config/picom/picom.conf

# Opacity
opacity-rule = [
    "90:class_g = 'Alacritty'",
    "85:class_g = 'Rofi'",
    "95:class_g = 'code-oss'"
];

# Inactive window opacity
inactive-opacity = 0.9;
active-opacity = 1.0;
frame-opacity = 0.9;

# Focus-based opacity
focus-exclude = [
    "class_g = 'mpv'",
    "class_g = 'firefox' && focused"
];
```

### Hyprland

```bash
# Window rules
windowrulev2 = opacity 0.9 0.8, class:^(Alacritty)$
windowrulev2 = opacity 0.95 0.9, class:^(Code)$
# Format: opacity ACTIVE INACTIVE

# Global
decoration {
    active_opacity = 1.0
    inactive_opacity = 0.9
}
```

## Blur Effects

### Picom Blur

```bash
blur-method = "dual_kawase";
blur-strength = 5;
blur-background = true;

blur-background-exclude = [
    "window_type = 'dock'",
    "window_type = 'desktop'",
    "_GTK_FRAME_EXTENTS@:c",
    "class_g = 'firefox' && argb"
];
```

### Hyprland Blur

```bash
decoration {
    blur {
        enabled = true
        size = 5
        passes = 2
        new_optimizations = true
        ignore_opacity = false
        xray = false
        noise = 0.0117
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
    }
}
```

## Shadows

### Picom Shadows

```bash
shadow = true;
shadow-radius = 12;
shadow-opacity = 0.75;
shadow-offset-x = -12;
shadow-offset-y = -12;

shadow-exclude = [
    "name = 'Notification'",
    "class_g = 'Conky'",
    "_GTK_FRAME_EXTENTS@:c"
];
```

### Hyprland Shadows

```bash
decoration {
    drop_shadow = yes
    shadow_range = 10
    shadow_render_power = 3
    shadow_offset = 0 0
    col.shadow = rgba(1a1a1aee)
    col.shadow_inactive = rgba(1a1a1a99)
}
```

## Rounding

### Picom Corner Rounding

```bash
corner-radius = 10;
rounded-corners-exclude = [
    "window_type = 'dock'",
    "window_type = 'desktop'"
];
```

### Hyprland Rounding

```bash
decoration {
    rounding = 10
}

# Disable for specific windows
windowrulev2 = rounding 0, class:^(firefox)$
```

## GTK Theme

### Installing GTK Themes

```bash
# Popular themes
sudo pacman -S arc-gtk-theme
sudo pacman -S materia-gtk-theme

# Catppuccin
yay -S catppuccin-gtk-theme-mocha

# Manual installation
mkdir -p ~/.themes
cp -r Theme-Name ~/.themes/
```

### Configuring GTK

```bash
# ~/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name=Catppuccin-Mocha
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Sans 10
gtk-cursor-theme-name=Bibata-Modern-Classic
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull

# Also create gtk-4.0/settings.ini with same content
```

### GUI Theme Selector

```bash
# For X11
lxappearance

# For Wayland
nwg-look
```

## Icon Theme

### Installing Icon Themes

```bash
# Popular icon themes
sudo pacman -S papirus-icon-theme
sudo pacman -S arc-icon-theme

# Catppuccin
yay -S catppuccin-cursors-mocha

# Manual
mkdir -p ~/.icons
cp -r Icon-Theme ~/.icons/
```

### Setting Icon Theme

Set in GTK settings (shown above) or:

```bash
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
```

## Cursor Theme

### Installing Cursor Themes

```bash
sudo pacman -S bibata-cursor-theme
yay -S catppuccin-cursors-mocha
```

### Setting Cursor Theme

```bash
# For X11 - ~/.Xresources
Xcursor.theme: Bibata-Modern-Classic
Xcursor.size: 24

# Reload
xrdb ~/.Xresources

# For Hyprland
exec-once = hyprctl setcursor Bibata-Modern-Classic 24

# Or in config
env = XCURSOR_THEME,Bibata-Modern-Classic
env = XCURSOR_SIZE,24
```

## Status Bar Customization

### Polybar (i3wm)

```ini
; ~/.config/polybar/config.ini

[bar/main]
width = 100%
height = 30
background = #1e1e2e
foreground = #cdd6f4

line-size = 3
border-size = 0
padding = 2
module-margin = 1

font-0 = JetBrains Mono:size=10;2
font-1 = Font Awesome 6 Free:style=Solid:size=10;2

modules-left = i3 xwindow
modules-center = date
modules-right = pulseaudio memory cpu battery

[module/i3]
type = internal/i3
format = <label-state> <label-mode>

label-focused = %index%
label-focused-background = #89b4fa
label-focused-foreground = #1e1e2e
label-focused-padding = 2

label-unfocused = %index%
label-unfocused-padding = 2

label-urgent = %index%
label-urgent-background = #f38ba8
label-urgent-padding = 2
```

### Waybar (Hyprland)

```jsonc
// ~/.config/waybar/config.jsonc
{
    "layer": "top",
    "height": 30,
    "modules-left": ["hyprland/workspaces", "hyprland/window"],
    "modules-center": ["clock"],
    "modules-right": ["pulseaudio", "memory", "cpu", "battery"],
    
    "hyprland/workspaces": {
        "format": "{icon}",
        "format-icons": {
            "1": "1",
            "2": "2",
            "active": "",
            "default": ""
        }
    }
}
```

```css
/* ~/.config/waybar/style.css */
* {
    font-family: JetBrains Mono;
    font-size: 13px;
}

window#waybar {
    background: #1e1e2e;
    color: #cdd6f4;
}

#workspaces button {
    padding: 0 10px;
    background: transparent;
    color: #6c7086;
}

#workspaces button.active {
    background: #89b4fa;
    color: #1e1e2e;
}
```

## Application Launcher Styling

### Rofi

```css
/* ~/.config/rofi/config.rasi */

configuration {
    show-icons: true;
    icon-theme: "Papirus-Dark";
}

* {
    background-color: #1e1e2e;
    text-color: #cdd6f4;
    font: "JetBrains Mono 11";
}

window {
    width: 600px;
    border: 2px;
    border-color: #89b4fa;
    border-radius: 10px;
    padding: 20px;
}

inputbar {
    background-color: #313244;
    padding: 10px;
    border-radius: 5px;
}

listview {
    lines: 10;
    padding: 10px 0;
}

element selected {
    background-color: #89b4fa;
    text-color: #1e1e2e;
    border-radius: 5px;
}
```

## Notification Styling

### Dunst

```ini
# ~/.config/dunst/dunstrc

[global]
font = JetBrains Mono 10
frame_width = 2
frame_color = "#89b4fa"

[urgency_low]
background = "#1e1e2e"
foreground = "#cdd6f4"
timeout = 5

[urgency_normal]
background = "#1e1e2e"
foreground = "#cdd6f4"
timeout = 10

[urgency_critical]
background = "#1e1e2e"
foreground = "#f38ba8"
frame_color = "#f38ba8"
timeout = 0
```

## Testing Your Theme

### Preview Terminal Colors

```bash
# Show all 256 colors
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash

# Basic 16 colors
for i in {0..15}; do
    printf "\x1b[48;5;${i}m%3d\e[0m " "$i"
    [ $((($i + 1) % 8)) == 0 ] && echo
done
```

### Take Screenshots

```bash
# Save your rice
scrot ~/Pictures/rice-$(date +%Y%m%d-%H%M%S).png

# Hyprland
grim ~/Pictures/rice-$(date +%Y%m%d-%H%M%S).png
```

## Backup Your Configuration

```bash
# Create backup
./scripts/automation/backup-configs.sh

# Or manual
tar -czf ~/rice-backup-$(date +%Y%m%d).tar.gz \
    ~/.config/i3 \
    ~/.config/hypr \
    ~/.config/polybar \
    ~/.config/waybar \
    ~/.config/alacritty \
    ~/.config/rofi
```

## Sharing Your Rice

When sharing on r/unixporn or similar:

1. Take clean screenshots
2. Show different applications
3. Include neofetch/fastfetch output
4. List your components
5. Share dotfiles (GitHub)
6. Credit inspirations

## Next Steps

With a customized appearance:

1. Master keybindings: [Keybindings Explained](06-keybindings-explained.md)
2. Automate tasks: [Scripting & Automation](07-scripting-automation.md)
3. Advanced tweaks: [Advanced Configurations](08-advanced-configurations.md)

## Resources

- r/unixporn: Rice showcase and inspiration
- dotfiles.github.io: Curated dotfiles list
- color.adobe.com: Color palette generator
- coolors.co: Color scheme generator
- terminal.sexy: Terminal color designer

## Conclusion

Customizing appearance is one of the most rewarding aspects of ricing. Take your time, experiment with different combinations, and create something uniquely yours. Remember: the best rice is one that makes you happy to use your system every day.