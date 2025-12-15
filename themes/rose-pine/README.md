# 🌹 Rosé Pine

![Rosé Pine Preview](../../assets/screenshots/themes/rose-pine/overview.png)

> Low-contrast theme with muted, soothing colors for reduced eye strain

[Official Website](https://rosepinetheme.com) • [Back to Theme Gallery](../)

## About

Rosé Pine is an elegant, low-contrast color scheme designed to be easy on the eyes. With muted, pastel-like tones and excellent readability, it's perfect for those who want beauty without sacrificing comfort during long work sessions.

**Key Features:**
- 🌹 Low-contrast, muted color palette
- 🎨 Three elegant variants: Main, Moon, and Dawn
- 👁️ Designed specifically to reduce eye strain
- 🌸 Subtle beauty with pastel-like tones
- 🧘 Calming and soothing aesthetic

**Best For:**
- Users with eye strain or sensitivity
- Those who prefer subtle, low-contrast themes
- Long reading and coding sessions
- Minimalists who appreciate understated elegance
- Pastel color enthusiasts

## Color Palette

### Base Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Base** | `#191724` | ![#191724](https://via.placeholder.com/50x30/191724/191724.png) | Main background |
| **Surface** | `#26233a` | ![#26233a](https://via.placeholder.com/50x30/26233a/26233a.png) | Surface elements |
| **Overlay** | `#3e3a54` | ![#3e3a54](https://via.placeholder.com/50x30/3e3a54/3e3a54.png) | Overlays, popups |
| **Muted** | `#6e6a86` | ![#6e6a86](https://via.placeholder.com/50x30/6e6a86/6e6a86.png) | Muted foreground |
| **Subtle** | `#908caa` | ![#908caa](https://via.placeholder.com/50x30/908caa/908caa.png) | Subtle foreground |
| **Text** | `#e0def4` | ![#e0def4](https://via.placeholder.com/50x30/e0def4/e0def4.png) | Primary text |

### Accent Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Love** | `#eb6f92` | ![#eb6f92](https://via.placeholder.com/50x30/eb6f92/eb6f92.png) | Red/pink, errors |
| **Gold** | `#f6c177` | ![#f6c177](https://via.placeholder.com/50x30/f6c177/f6c177.png) | Yellow, warnings |
| **Rose** | `#ebbcba` | ![#ebbcba](https://via.placeholder.com/50x30/ebbcba/ebbcba.png) | Peach, highlights |
| **Pine** | `#31748f` | ![#31748f](https://via.placeholder.com/50x30/31748f/31748f.png) | Teal blue, info |
| **Foam** | `#9ccfd8` | ![#9ccfd8](https://via.placeholder.com/50x30/9ccfd8/9ccfd8.png) | Cyan/mint, success |
| **Iris** | `#c4a7e7` | ![#c4a7e7](https://via.placeholder.com/50x30/c4a7e7/c4a7e7.png) | Purple, primary accent |

### Highlight Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Highlight Low** | `#21202e` | ![#21202e](https://via.placeholder.com/50x30/21202e/21202e.png) | Low emphasis |
| **Highlight Med** | `#403d52` | ![#403d52](https://via.placeholder.com/50x30/403d52/403d52.png) | Medium emphasis |
| **Highlight High** | `#524f67` | ![#524f67](https://via.placeholder.com/50x30/524f67/524f67.png) | High emphasis |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#26233a` | `#6e6a86` |
| **Red** | `#eb6f92` | `#eb6f92` |
| **Green** | `#9ccfd8` | `#9ccfd8` |
| **Yellow** | `#f6c177` | `#f6c177` |
| **Blue** | `#31748f` | `#31748f` |
| **Magenta** | `#c4a7e7` | `#c4a7e7` |
| **Cyan** | `#9ccfd8` | `#ebbcba` |
| **White** | `#e0def4` | `#e0def4` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Rosé Pine snippets to their respective config locations
./apply-theme.sh rose-pine
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/rose-pine/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/rose-pine/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/rose-pine/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/rose-pine/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/rose-pine/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/rose-pine/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/rose-pine/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/rose-pine/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Rosé Pine Overview](../../assets/screenshots/themes/rose-pine/overview.png)

### Terminal
![Rosé Pine Terminal](../../assets/screenshots/themes/rose-pine/terminal.png)

### Application Launcher
![Rosé Pine Rofi](../../assets/screenshots/themes/rose-pine/rofi.png)

### Workflow
![Rosé Pine Workflow](../../assets/screenshots/themes/rose-pine/workflow.png)

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
ROUNDING="8"         # Corner rounding (soft, soothing curves)
```

### Variant Selection
Rosé Pine has three variants:
- **Main** (default): Base dark theme
- **Moon**: Slightly lighter, softer contrast
- **Dawn**: Light theme variant

To switch to Moon variant in `colors.conf`:
```bash
BG="#232136"         # Moon base
FG="#e0def4"         # Keep text
```

## Official Resources

- [Official Website](https://rosepinetheme.com)
- [Official Repository](https://github.com/rose-pine)
- [Theme Specification](https://rosepinetheme.com/palette)
- [Community Ports](https://github.com/rose-pine) - Growing collection
- [Contributing Guide](https://github.com/rose-pine/rose-pine-theme)

## Additional Notes

- **Fonts:** Works beautifully with **JetBrains Mono** or **Fira Code** for a clean, modern look
- **Wallpapers:** Matching muted, pastel wallpapers available in `wallpapers/` directory
- **GTK Theme:** Consider using muted, low-contrast GTK themes for consistency
- **Icons:** Pair with soft, muted icon packs like [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) with custom colors
- **Philosophy:** Designed with the principle that beauty shouldn't come at the cost of comfort
- **Community:** Rapidly growing theme with active community and frequent updates
- **Unique Names:** Each color has a poetic name (Love, Gold, Rose, Pine, Foam, Iris) reflecting the theme's aesthetic

---

[← Back to Theme Gallery](../)
