# ☀️ Solarized

![Solarized Preview](../../assets/screenshots/themes/solarized/overview.png)

> Scientifically designed color scheme for reduced eye strain

[Official Website](https://ethanschoonover.com/solarized) • [Back to Theme Gallery](../)

## About

Solarized is a precision color scheme developed by Ethan Schoonover, meticulously crafted using color theory and extensive testing. It's designed to reduce eye strain while maintaining excellent readability in both bright and dim environments.

**Key Features:**
- ☀️ Scientifically designed using color theory
- 🔬 Extensively tested for optimal readability
- 🌓 Seamless dark and light mode variants
- 📚 Most widely ported color scheme ever
- 👁️ Specifically designed to reduce eye strain

**Best For:**
- Long reading and coding sessions
- Academic and professional work
- Users who prioritize eye health
- Those who frequently switch between light/dark modes
- Precision and consistency across applications

## Color Palette

### Base Colors (Dark)
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **base03** | `#002b36` | ![#002b36](https://via.placeholder.com/50x30/002b36/002b36.png) | Background (dark) |
| **base02** | `#073642` | ![#073642](https://via.placeholder.com/50x30/073642/073642.png) | Background highlights |
| **base01** | `#586e75` | ![#586e75](https://via.placeholder.com/50x30/586e75/586e75.png) | Comments |
| **base00** | `#657b83` | ![#657b83](https://via.placeholder.com/50x30/657b83/657b83.png) | Body text |
| **base0** | `#839496` | ![#839496](https://via.placeholder.com/50x30/839496/839496.png) | Primary content |
| **base1** | `#93a1a1` | ![#93a1a1](https://via.placeholder.com/50x30/93a1a1/93a1a1.png) | Emphasized content |
| **base2** | `#eee8d5` | ![#eee8d5](https://via.placeholder.com/50x30/eee8d5/eee8d5.png) | Background (light) |
| **base3** | `#fdf6e3` | ![#fdf6e3](https://via.placeholder.com/50x30/fdf6e3/fdf6e3.png) | Lightest background |

### Accent Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Yellow** | `#b58900` | ![#b58900](https://via.placeholder.com/50x30/b58900/b58900.png) | Warnings, constants |
| **Orange** | `#cb4b16` | ![#cb4b16](https://via.placeholder.com/50x30/cb4b16/cb4b16.png) | Special, numbers |
| **Red** | `#dc322f` | ![#dc322f](https://via.placeholder.com/50x30/dc322f/dc322f.png) | Errors, deletions |
| **Magenta** | `#d33682` | ![#d33682](https://via.placeholder.com/50x30/d33682/d33682.png) | Keywords, statements |
| **Violet** | `#6c71c4` | ![#6c71c4](https://via.placeholder.com/50x30/6c71c4/6c71c4.png) | Special keywords |
| **Blue** | `#268bd2` | ![#268bd2](https://via.placeholder.com/50x30/268bd2/268bd2.png) | Primary accent, functions |
| **Cyan** | `#2aa198` | ![#2aa198](https://via.placeholder.com/50x30/2aa198/2aa198.png) | Strings, regex |
| **Green** | `#859900` | ![#859900](https://via.placeholder.com/50x30/859900/859900.png) | Success, additions |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#073642` | `#002b36` |
| **Red** | `#dc322f` | `#cb4b16` |
| **Green** | `#859900` | `#586e75` |
| **Yellow** | `#b58900` | `#657b83` |
| **Blue** | `#268bd2` | `#839496` |
| **Magenta** | `#d33682` | `#6c71c4` |
| **Cyan** | `#2aa198` | `#93a1a1` |
| **White** | `#eee8d5` | `#fdf6e3` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Solarized snippets to their respective config locations
./apply-theme.sh solarized
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/solarized/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/solarized/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/solarized/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/solarized/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/solarized/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/solarized/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/solarized/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/solarized/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Solarized Overview](../../assets/screenshots/themes/solarized/overview.png)

### Terminal
![Solarized Terminal](../../assets/screenshots/themes/solarized/terminal.png)

### Application Launcher
![Solarized Rofi](../../assets/screenshots/themes/solarized/rofi.png)

### Workflow
![Solarized Workflow](../../assets/screenshots/themes/solarized/workflow.png)

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
ROUNDING="4"         # Corner rounding (minimal, scientific aesthetic)
```

### Switching to Light Mode
Solarized's unique design allows seamless light/dark switching. To use light mode:
```bash
# In colors.conf, swap background and foreground base tones
BG="#fdf6e3"         # base3 (light)
BG_ALT="#eee8d5"     # base2
FG="#657b83"         # base00
FG_ALT="#586e75"     # base01
```

The accent colors remain identical in both modes!

## Official Resources

- [Official Website](https://ethanschoonover.com/solarized)
- [Official Repository](https://github.com/altercation/solarized)
- [Design Principles](https://ethanschoonover.com/solarized/#features)
- [Scientific Background](https://ethanschoonover.com/solarized/#usage-development)
- [Comprehensive Ports](https://github.com/altercation/solarized/wiki/Ports) - Most ported theme ever

## Additional Notes

- **Fonts:** Works with any monospace font; **JetBrains Mono** or **Fira Code** recommended
- **Wallpapers:** Neutral-toned wallpapers available in `wallpapers/` directory
- **GTK Theme:** Use official [Solarized GTK](https://github.com/arshad/solarized-gtk-theme)
- **Icons:** Neutral icon themes work best; consider [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- **Scientific Design:** Colors chosen based on:
  - Selective contrast relationships
  - Uniform brightness across accent colors
  - Precisely defined color relationships
- **History:** Created in 2011, remains popular due to its timeless design
- **Versatility:** Works equally well in bright sunlight or dark rooms
- **Legacy:** Inspired countless other precision-designed color schemes

---

[← Back to Theme Gallery](../)
