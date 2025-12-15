# Terminal Emulator Comparison

The terminal is arguably the most important application in a tiling window manager setup. This guide compares popular terminal emulators to help you choose the right one.

## Overview

| Terminal | GPU Accelerated | Config Format | Performance | Features | Learning Curve |
|----------|----------------|---------------|-------------|----------|----------------|
| Alacritty | Yes | YAML/TOML | Excellent | Minimal | Easy |
| Kitty | Yes | Custom | Excellent | Rich | Medium |
| WezTerm | Yes | Lua | Good | Very Rich | Medium |
| st | No | C (source) | Excellent | Minimal | Hard |
| urxvt | No | Xresources | Good | Medium | Medium |
| foot | Yes | INI | Excellent | Minimal | Easy |

## Alacritty

### Overview
A fast, GPU-accelerated terminal emulator with a focus on simplicity and performance.

### Pros
- Blazing fast
- GPU acceleration
- Simple YAML/TOML configuration
- Cross-platform (Linux, macOS, Windows, BSD)
- Works on both X11 and Wayland
- Low resource usage
- Active development

### Cons
- Minimal features (by design)
- No tabs or splits built-in
- No ligature support (intentional)
- Less customization than Kitty

### Configuration
```yaml
# ~/.config/alacritty/alacritty.yml

window:
  padding:
    x: 10
    y: 10
  opacity: 0.9
  decorations: none

font:
  normal:
    family: JetBrains Mono
    style: Regular
  size: 11.0

colors:
  primary:
    background: '#1e1e2e'
    foreground: '#cdd6f4'
  normal:
    black:   '#45475a'
    red:     '#f38ba8'
    green:   '#a6e3a1'
    yellow:  '#f9e2af'
    blue:    '#89b4fa'
    magenta: '#f5c2e7'
    cyan:    '#94e2d5'
    white:   '#bac2de'

key_bindings:
  - { key: V, mods: Control|Shift, action: Paste }
  - { key: C, mods: Control|Shift, action: Copy }
  - { key: Plus, mods: Control, action: IncreaseFontSize }
  - { key: Minus, mods: Control, action: DecreaseFontSize }
```

### Best For
- Users who want maximum performance
- Those who prefer simplicity
- Users who use tmux for multiplexing
- Cross-platform users
- Wayland users

### Performance
- Startup: ~15ms
- RAM: 15-25 MB per instance
- CPU: Very low
- GPU: Efficient use

## Kitty

### Overview
A feature-rich, GPU-accelerated terminal with extensive customization options.

### Pros
- GPU accelerated
- Built-in tabs and splits
- Font ligature support
- Image display in terminal
- Extensive features
- Highly customizable
- Good documentation
- Wayland and X11 support

### Cons
- More resource usage than Alacritty
- Custom config format
- Can be overwhelming for beginners
- Slower startup than Alacritty

### Configuration
```bash
# ~/.config/kitty/kitty.conf

# Fonts
font_family      JetBrains Mono
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        11.0

# Cursor
cursor_shape block
cursor_blink_interval 0

# Mouse
mouse_hide_wait 3.0
url_style curly

# Window
window_padding_width 10
window_margin_width 0
background_opacity 0.9

# Tabs
tab_bar_style powerline
tab_powerline_style slanted

# Colors (Catppuccin)
foreground #cdd6f4
background #1e1e2e

color0 #45475a
color1 #f38ba8
color2 #a6e3a1
color3 #f9e2af
color4 #89b4fa
color5 #f5c2e7
color6 #94e2d5
color7 #bac2de

# Keybindings
map ctrl+shift+c copy_to_clipboard
map ctrl+shift+v paste_from_clipboard
map ctrl+shift+t new_tab
map ctrl+shift+w close_tab
```

### Special Features
- Image display: `kitty +kitten icat image.png`
- Diff viewer: `kitty +kitten diff file1 file2`
- Unicode input: `kitty +kitten unicode_input`
- SSH integration with file transfer

### Best For
- Users wanting all-in-one solution
- Those who need tabs/splits built-in
- Users who display images in terminal
- Those who value ligatures
- Power users who want many features

### Performance
- Startup: ~50ms
- RAM: 30-50 MB per instance
- CPU: Low
- GPU: Moderate use

## WezTerm

### Overview
A powerful terminal with Lua configuration and extensive features.

### Pros
- GPU accelerated
- Lua configuration (very flexible)
- Built-in multiplexer
- Font ligatures
- Image protocol support
- Cross-platform
- Tabs and splits
- Very actively developed

### Cons
- Higher resource usage
- Slower than Alacritty/Kitty
- Lua learning curve
- Can be complex to configure

### Configuration
```lua
-- ~/.config/wezterm/wezterm.lua
local wezterm = require 'wezterm'

return {
  font = wezterm.font 'JetBrains Mono',
  font_size = 11.0,
  
  color_scheme = 'Catppuccin Mocha',
  
  window_background_opacity = 0.9,
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
  
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  
  keys = {
    { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
    { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  },
}
```

### Best For
- Users who want advanced scripting
- Those comfortable with Lua
- Users wanting built-in multiplexer
- Power users needing flexibility
- Cross-platform consistency

### Performance
- Startup: ~100ms
- RAM: 40-70 MB per instance
- CPU: Low to moderate
- GPU: Moderate use

## st (Simple Terminal)

### Overview
The suckless terminal - minimal, fast, and configured by editing source code.

### Pros
- Extremely fast
- Minimal resource usage
- Simple codebase
- Highly hackable
- No dependencies
- Very stable

### Cons
- Requires compilation
- No configuration file
- Basic features only
- Patching required for features
- Manual updates

### Configuration
Edit `config.h` and recompile:
```c
/* config.h */

static char *font = "JetBrains Mono:pixelsize=14";

static unsigned int borderpx = 10;

static const char *colorname[] = {
    /* 8 normal colors */
    "#45475a", /* black */
    "#f38ba8", /* red */
    "#a6e3a1", /* green */
    "#f9e2af", /* yellow */
    "#89b4fa", /* blue */
    "#f5c2e7", /* magenta */
    "#94e2d5", /* cyan */
    "#bac2de", /* white */
};

static float alpha = 0.9;
```

### Popular Patches
- Alpha (transparency)
- Scrollback
- Ligatures
- Clipboard
- Font size adjustment

### Best For
- Minimalists
- Suckless philosophy followers
- Users comfortable compiling
- Those wanting ultimate control
- Embedded systems

### Performance
- Startup: <10ms
- RAM: 5-10 MB
- CPU: Minimal
- GPU: None

## foot

### Overview
A fast, lightweight Wayland-native terminal emulator.

### Pros
- Native Wayland (no XWayland)
- Very fast
- Low resource usage
- Simple INI configuration
- Good feature set
- Excellent performance

### Cons
- Wayland only (no X11)
- Smaller community
- Fewer features than Kitty
- Less themes available

### Configuration
```ini
# ~/.config/foot/foot.ini

[main]
font=JetBrains Mono:size=11
dpi-aware=yes

[cursor]
style=block
blink=no

[colors]
foreground=cdd6f4
background=1e1e2e

regular0=45475a
regular1=f38ba8
regular2=a6e3a1
regular3=f9e2af
regular4=89b4fa
regular5=f5c2e7
regular6=94e2d5
regular7=bac2de

[key-bindings]
clipboard-copy=Control+Shift+c
clipboard-paste=Control+Shift+v
font-increase=Control+plus
font-decrease=Control+minus
```

### Best For
- Hyprland users
- Users wanting Wayland-native terminal
- Those who value performance
- Minimalists on Wayland
- Low-end hardware on Wayland

### Performance
- Startup: ~10ms
- RAM: 10-20 MB
- CPU: Very low
- GPU: Efficient

## urxvt (rxvt-unicode)

### Overview
A classic, lightweight X11 terminal with daemon mode.

### Pros
- Very mature and stable
- Daemon mode (lower resource use)
- Perl extension system
- Good Unicode support
- Low resource usage

### Cons
- X11 only
- Dated appearance
- Xresources configuration
- Less active development
- Quirky behavior sometimes

### Configuration
```bash
# ~/.Xresources

URxvt.font: xft:JetBrains Mono:size=11
URxvt.scrollBar: false
URxvt.cursorBlink: false

URxvt.background: #1e1e2e
URxvt.foreground: #cdd6f4

URxvt.color0: #45475a
URxvt.color1: #f38ba8
URxvt.color2: #a6e3a1
URxvt.color3: #f9e2af
URxvt.color4: #89b4fa
URxvt.color5: #f5c2e7
URxvt.color6: #94e2d5
URxvt.color7: #bac2de

URxvt.perl-ext-common: default,clipboard,url-select
```

Load with: `xrdb ~/.Xresources`

### Best For
- i3wm users
- Those on X11 who want lightweight
- Users wanting daemon mode
- Those comfortable with Xresources

## Feature Comparison

### Core Features

| Feature | Alacritty | Kitty | WezTerm | st | foot | urxvt |
|---------|-----------|-------|---------|----|-