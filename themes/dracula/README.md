# 🧛 Dracula

![Dracula Preview](../../assets/screenshots/themes/dracula/overview.png)

> A dark theme with vibrant, saturated colors that pop

[Official Website](https://draculatheme.com) • [Back to Theme Gallery](../)

## About

Dracula is a dark theme with vibrant and highly saturated colors, designed to reduce eye strain and provide a visually striking coding experience. With ports for over 250+ applications, it's one of the most widely adopted dark themes.

**Key Features:**
- 🧛 Iconic purple and pink color palette
- 🎨 High contrast, vibrant colors
- 👁️ Reduced eye strain with carefully chosen dark backgrounds
- 🌈 Distinctive and memorable aesthetic
- ⚡ Energizing color scheme for productivity

**Best For:**
- Night owls and late-night coding sessions
- Creative work and streaming setups
- Those who prefer vibrant, saturated colors
- High-contrast enthusiasts
- Making your desktop stand out

## Color Palette

### Base Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Background** | `#282a36` | ![#282a36](https://via.placeholder.com/50x30/282a36/282a36.png) | Main background |
| **Background Alt** | `#21222c` | ![#21222c](https://via.placeholder.com/50x30/21222c/21222c.png) | Darker background |
| **Current Line** | `#44475a` | ![#44475a](https://via.placeholder.com/50x30/44475a/44475a.png) | Selection/highlights |
| **Foreground** | `#f8f8f2` | ![#f8f8f2](https://via.placeholder.com/50x30/f8f8f2/f8f8f2.png) | Main text |
| **Comment** | `#6272a4` | ![#6272a4](https://via.placeholder.com/50x30/6272a4/6272a4.png) | Comments, subtle text |

### Accent Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Cyan** | `#8be9fd` | ![#8be9fd](https://via.placeholder.com/50x30/8be9fd/8be9fd.png) | Cyan accents |
| **Green** | `#50fa7b` | ![#50fa7b](https://via.placeholder.com/50x30/50fa7b/50fa7b.png) | Success, strings |
| **Orange** | `#ffb86c` | ![#ffb86c](https://via.placeholder.com/50x30/ffb86c/ffb86c.png) | Warnings, parameters |
| **Pink** | `#ff79c6` | ![#ff79c6](https://via.placeholder.com/50x30/ff79c6/ff79c6.png) | Keywords, secondary accent |
| **Purple** | `#bd93f9` | ![#bd93f9](https://via.placeholder.com/50x30/bd93f9/bd93f9.png) | Primary accent, functions |
| **Red** | `#ff5555` | ![#ff5555](https://via.placeholder.com/50x30/ff5555/ff5555.png) | Errors, deletions |
| **Yellow** | `#f1fa8c` | ![#f1fa8c](https://via.placeholder.com/50x30/f1fa8c/f1fa8c.png) | Classes, highlights |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#21222c` | `#6272a4` |
| **Red** | `#ff5555` | `#ff6e6e` |
| **Green** | `#50fa7b` | `#69ff94` |
| **Yellow** | `#f1fa8c` | `#ffffa5` |
| **Blue** | `#bd93f9` | `#d6acff` |
| **Magenta** | `#ff79c6` | `#ff92df` |
| **Cyan** | `#8be9fd` | `#a4ffff` |
| **White** | `#f8f8f2` | `#ffffff` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Dracula snippets to their respective config locations
./apply-theme.sh dracula
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/dracula/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/dracula/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/dracula/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/dracula/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/dracula/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/dracula/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/dracula/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/dracula/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Dracula Overview](../../assets/screenshots/themes/dracula/overview.png)

### Terminal
![Dracula Terminal](../../assets/screenshots/themes/dracula/terminal.png)

### Application Launcher
![Dracula Rofi](../../assets/screenshots/themes/dracula/rofi.png)

### Workflow
![Dracula Workflow](../../assets/screenshots/themes/dracula/workflow.png)

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
ROUNDING="5"         # Corner rounding (sharper corners for modern look)
```

### Color Intensity
Dracula's vibrant colors work best at full opacity. If colors feel too intense:
```bash
# Consider using darker background alternative
BG="#21222c"         # Use darker background for less contrast
```

## Official Resources

- [Official Website](https://draculatheme.com)
- [Official Repository](https://github.com/dracula/dracula-theme)
- [Theme Specification](https://spec.draculatheme.com)
- [All Ports](https://draculatheme.com/contribute) - 250+ application themes
- [Contributing Guide](https://draculatheme.com/contribute)

## Additional Notes

- **Fonts:** Works beautifully with **JetBrains Mono** or **Fira Code** with ligatures
- **Wallpapers:** Matching dark, vibrant wallpapers available in `wallpapers/` directory
- **GTK Theme:** Use [Dracula GTK](https://github.com/dracula/gtk) for system-wide theming
- **Icons:** Pair with [Dracula Icons](https://github.com/dracula/gtk) or vibrant icon packs
- **Cursors:** Try [Dracula Cursors](https://draculatheme.com/gtk) for complete immersion
- **Community:** Dracula has one of the largest theming communities with 250+ ports
- **Variants:** Dracula is primarily a dark theme, though community light variants exist

---

[← Back to Theme Gallery](../)