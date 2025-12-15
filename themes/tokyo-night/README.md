# 🌃 Tokyo Night

![Tokyo Night Preview](../../assets/screenshots/themes/tokyo-night/overview.png)

> Modern theme inspired by Tokyo's night skyline

[Official Website](https://github.com/tokyo-night/tokyo-night-vscode-theme) • [Back to Theme Gallery](../)

## About

Tokyo Night is a clean, dark theme inspired by the lights of Tokyo at night. It features a vibrant yet comfortable color palette that has quickly become one of the most popular themes among developers.

**Key Features:**
- 🗼 Modern aesthetic inspired by Tokyo's nightlife
- 🎨 Vibrant colors with excellent readability
- 🌙 Three variants: Night, Storm, and Day
- ⚡ Popular in the developer community
- 💎 Clean, professional appearance

**Best For:**
- Modern, sleek desktop setups
- Developers who prefer trendy aesthetics
- Those who enjoy blue-purple color schemes
- Professional yet stylish environments
- Night-time coding sessions

## Color Palette

### Base Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Background** | `#1a1b26` | ![#1a1b26](https://via.placeholder.com/50x30/1a1b26/1a1b26.png) | Main background |
| **Background Alt** | `#16161e` | ![#16161e](https://via.placeholder.com/50x30/16161e/16161e.png) | Darker background |
| **Surface 0** | `#24283b` | ![#24283b](https://via.placeholder.com/50x30/24283b/24283b.png) | Surface level 0 |
| **Surface 1** | `#292e42` | ![#292e42](https://via.placeholder.com/50x30/292e42/292e42.png) | Surface level 1 |
| **Surface 2** | `#343b58` | ![#343b58](https://via.placeholder.com/50x30/343b58/343b58.png) | Surface level 2 |
| **Foreground** | `#c0caf5` | ![#c0caf5](https://via.placeholder.com/50x30/c0caf5/c0caf5.png) | Primary text |
| **Foreground Alt** | `#a9b1d6` | ![#a9b1d6](https://via.placeholder.com/50x30/a9b1d6/a9b1d6.png) | Dimmed text |

### Accent Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Blue** | `#7aa2f7` | ![#7aa2f7](https://via.placeholder.com/50x30/7aa2f7/7aa2f7.png) | Primary accent, functions |
| **Cyan** | `#7dcfff` | ![#7dcfff](https://via.placeholder.com/50x30/7dcfff/7dcfff.png) | Strings, constants |
| **Green** | `#9ece6a` | ![#9ece6a](https://via.placeholder.com/50x30/9ece6a/9ece6a.png) | Success, additions |
| **Magenta** | `#bb9af7` | ![#bb9af7](https://via.placeholder.com/50x30/bb9af7/bb9af7.png) | Keywords, purple |
| **Orange** | `#ff9e64` | ![#ff9e64](https://via.placeholder.com/50x30/ff9e64/ff9e64.png) | Numbers, constants |
| **Purple** | `#9d7cd8` | ![#9d7cd8](https://via.placeholder.com/50x30/9d7cd8/9d7cd8.png) | Darker purple |
| **Red** | `#f7768e` | ![#f7768e](https://via.placeholder.com/50x30/f7768e/f7768e.png) | Errors, deletions |
| **Teal** | `#1abc9c` | ![#1abc9c](https://via.placeholder.com/50x30/1abc9c/1abc9c.png) | Special highlights |
| **Yellow** | `#e0af68` | ![#e0af68](https://via.placeholder.com/50x30/e0af68/e0af68.png) | Warnings, classes |

### UI Element Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Overlay 0** | `#414868` | ![#414868](https://via.placeholder.com/50x30/414868/414868.png) | Borders, dividers |
| **Overlay 1** | `#565f89` | ![#565f89](https://via.placeholder.com/50x30/565f89/565f89.png) | Comments |
| **Overlay 2** | `#787c99` | ![#787c99](https://via.placeholder.com/50x30/787c99/787c99.png) | Subtle UI elements |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#15161e` | `#414868` |
| **Red** | `#f7768e` | `#f7768e` |
| **Green** | `#9ece6a` | `#9ece6a` |
| **Yellow** | `#e0af68` | `#e0af68` |
| **Blue** | `#7aa2f7` | `#7aa2f7` |
| **Magenta** | `#bb9af7` | `#bb9af7` |
| **Cyan** | `#7dcfff` | `#7dcfff` |
| **White** | `#a9b1d6` | `#c0caf5` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Tokyo Night snippets to their respective config locations
./apply-theme.sh tokyo-night
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/tokyo-night/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/tokyo-night/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/tokyo-night/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/tokyo-night/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/tokyo-night/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/tokyo-night/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/tokyo-night/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/tokyo-night/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Tokyo Night Overview](../../assets/screenshots/themes/tokyo-night/overview.png)

### Terminal
![Tokyo Night Terminal](../../assets/screenshots/themes/tokyo-night/terminal.png)

### Application Launcher
![Tokyo Night Rofi](../../assets/screenshots/themes/tokyo-night/rofi.png)

### Workflow
![Tokyo Night Workflow](../../assets/screenshots/themes/tokyo-night/workflow.png)

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
ROUNDING="8"         # Corner rounding (modern, smooth)
```

### Variant Selection
Tokyo Night has three main variants:
- **Night** (default): Deep blues, classic look
- **Storm**: Slightly lighter, less contrast
- **Day**: Light theme variant

To switch to Storm variant, adjust background colors in `colors.conf`:
```bash
BG="#24283b"         # Storm background (lighter)
```

## Official Resources

- [Official Repository](https://github.com/tokyo-night/tokyo-night-vscode-theme)
- [Community Ports](https://github.com/topics/tokyo-night)
- [Neovim Port](https://github.com/folke/tokyonight.nvim) - Most feature-complete
- [Terminal Themes](https://github.com/enkia/tokyo-night-vscode-theme)

## Additional Notes

- **Fonts:** Works beautifully with **JetBrains Mono** or **Fira Code**
- **Wallpapers:** Matching Tokyo-themed wallpapers available in `wallpapers/` directory
- **GTK Theme:** Consider [Tokyo Night GTK](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme)
- **Icons:** [Tokyo Night Icons](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme) for consistency
- **Popularity:** One of the fastest-growing themes, especially popular in the Neovim community
- **Modern:** Released in 2020, it represents modern color scheme design trends
- **Blue Focus:** Heavy use of blues and purples creates a calming yet energizing atmosphere

---

[← Back to Theme Gallery](../)