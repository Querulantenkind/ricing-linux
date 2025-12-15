# 🍂 Gruvbox

![Gruvbox Preview](../../assets/screenshots/themes/gruvbox/overview.png)

> Retro groove with warm, earthy tones for comfortable extended use

[Official Website](https://github.com/morhetz/gruvbox) • [Back to Theme Gallery](../)

## About

Gruvbox is a retro groove color scheme with warm, earthy tones designed for comfortable, long coding sessions. Based on earthy colors with desaturated tones, it provides excellent readability without eye strain.

**Key Features:**
- 🍂 Warm, earthy color palette
- 🎨 Retro aesthetic with modern functionality
- 👁️ Excellent for reducing eye strain
- 🔄 Both hard, medium, and soft contrast variants
- 🌓 Comprehensive dark and light mode support

**Best For:**
- Extended coding sessions
- Those who prefer warm, earthy tones
- Retro and vintage aesthetic lovers
- Reducing eye fatigue
- Users who value readability over vibrance

## Color Palette

### Base Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **bg0** | `#282828` | ![#282828](https://via.placeholder.com/50x30/282828/282828.png) | Main background |
| **bg0_h** | `#1d2021` | ![#1d2021](https://via.placeholder.com/50x30/1d2021/1d2021.png) | Hard background |
| **bg1** | `#3c3836` | ![#3c3836](https://via.placeholder.com/50x30/3c3836/3c3836.png) | Surface level 1 |
| **bg2** | `#504945` | ![#504945](https://via.placeholder.com/50x30/504945/504945.png) | Surface level 2 |
| **bg3** | `#665c54` | ![#665c54](https://via.placeholder.com/50x30/665c54/665c54.png) | Surface level 3 |
| **bg4** | `#7c6f64` | ![#7c6f64](https://via.placeholder.com/50x30/7c6f64/7c6f64.png) | Surface level 4 |
| **fg0** | `#ebdbb2` | ![#ebdbb2](https://via.placeholder.com/50x30/ebdbb2/ebdbb2.png) | Primary text |
| **fg1** | `#d5c4a1` | ![#d5c4a1](https://via.placeholder.com/50x30/d5c4a1/d5c4a1.png) | Dimmed text |
| **fg4** | `#a89984` | ![#a89984](https://via.placeholder.com/50x30/a89984/a89984.png) | Subtle text |
| **Gray** | `#928374` | ![#928374](https://via.placeholder.com/50x30/928374/928374.png) | Comments |

### Accent Colors (Dark)
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Red** | `#cc241d` | ![#cc241d](https://via.placeholder.com/50x30/cc241d/cc241d.png) | Errors |
| **Green** | `#98971a` | ![#98971a](https://via.placeholder.com/50x30/98971a/98971a.png) | Success |
| **Yellow** | `#d79921` | ![#d79921](https://via.placeholder.com/50x30/d79921/d79921.png) | Warnings |
| **Blue** | `#458588` | ![#458588](https://via.placeholder.com/50x30/458588/458588.png) | Info |
| **Purple** | `#b16286` | ![#b16286](https://via.placeholder.com/50x30/b16286/b16286.png) | Keywords |
| **Aqua** | `#689d6a` | ![#689d6a](https://via.placeholder.com/50x30/689d6a/689d6a.png) | Strings |
| **Orange** | `#d65d0e` | ![#d65d0e](https://via.placeholder.com/50x30/d65d0e/d65d0e.png) | Constants |

### Accent Colors (Bright)
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Bright Red** | `#fb4934` | ![#fb4934](https://via.placeholder.com/50x30/fb4934/fb4934.png) | Urgent errors |
| **Bright Green** | `#b8bb26` | ![#b8bb26](https://via.placeholder.com/50x30/b8bb26/b8bb26.png) | Highlights |
| **Bright Yellow** | `#fabd2f` | ![#fabd2f](https://via.placeholder.com/50x30/fabd2f/fabd2f.png) | Attention |
| **Bright Blue** | `#83a598` | ![#83a598](https://via.placeholder.com/50x30/83a598/83a598.png) | Primary accent |
| **Bright Purple** | `#d3869b` | ![#d3869b](https://via.placeholder.com/50x30/d3869b/d3869b.png) | Special |
| **Bright Aqua** | `#8ec07c` | ![#8ec07c](https://via.placeholder.com/50x30/8ec07c/8ec07c.png) | Secondary |
| **Bright Orange** | `#fe8019` | ![#fe8019](https://via.placeholder.com/50x30/fe8019/fe8019.png) | Functions |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#282828` | `#928374` |
| **Red** | `#cc241d` | `#fb4934` |
| **Green** | `#98971a` | `#b8bb26` |
| **Yellow** | `#d79921` | `#fabd2f` |
| **Blue** | `#458588` | `#83a598` |
| **Magenta** | `#b16286` | `#d3869b` |
| **Cyan** | `#689d6a` | `#8ec07c` |
| **White** | `#a89984` | `#ebdbb2` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Gruvbox snippets to their respective config locations
./apply-theme.sh gruvbox
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/gruvbox/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/gruvbox/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/gruvbox/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/gruvbox/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/gruvbox/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/gruvbox/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/gruvbox/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/gruvbox/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Gruvbox Overview](../../assets/screenshots/themes/gruvbox/overview.png)

### Terminal
![Gruvbox Terminal](../../assets/screenshots/themes/gruvbox/terminal.png)

### Application Launcher
![Gruvbox Rofi](../../assets/screenshots/themes/gruvbox/rofi.png)

### Workflow
![Gruvbox Workflow](../../assets/screenshots/themes/gruvbox/workflow.png)

## Customization Tips

### Adjusting Opacity
Edit the alpha values in `colors.conf`:
```bash
ALPHA_HIGH="230"     # Less transparent
ALPHA_MEDIUM="200"   # Moderate transparency
ALPHA_LOW="170"      # More transparent
```

### Border and Gaps
Modify spacing values:
```bash
GAP_SIZE="10"        # Window gaps
BORDER_SIZE="2"      # Border width
ROUNDING="5"         # Corner rounding (minimal for retro feel)
```

### Contrast Variants
Gruvbox comes in three contrast levels. To switch:
```bash
# Hard contrast (highest)
BG="#1d2021"         # Use bg0_h

# Medium contrast (default)
BG="#282828"         # Use bg0

# Soft contrast (lowest)
BG="#32302f"         # Use bg0_s
```

## Official Resources

- [Official Repository](https://github.com/morhetz/gruvbox)
- [Gruvbox Contributions](https://github.com/morhetz/gruvbox-contrib) - Port collection
- [Wiki](https://github.com/morhetz/gruvbox/wiki)
- [Palette Reference](https://github.com/morhetz/gruvbox/wiki/Terminal-specific)
- [Community Ports](https://github.com/topics/gruvbox-theme)

## Additional Notes

- **Fonts:** Pairs excellently with **JetBrains Mono** or **Fira Code** for a retro-modern feel
- **Wallpapers:** Matching earthy-toned wallpapers available in `wallpapers/` directory
- **GTK Theme:** Use [Gruvbox GTK](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme) for consistency
- **Icons:** [Gruvbox Plus Icons](https://github.com/SylEleuth/gruvbox-plus-icon-pack) match perfectly
- **Light Mode:** Gruvbox light is equally well-designed if you need a light variant
- **Philosophy:** Designed with the principle that colors should be comfortable, not vibrant
- **Popularity:** One of the most beloved themes in the vim/neovim community

---

[← Back to Theme Gallery](../)