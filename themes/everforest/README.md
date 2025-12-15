# 🌲 Everforest

![Everforest Preview](../../assets/screenshots/themes/everforest/overview.png)

> Green forest inspired theme with comfortable, natural colors

[Official Website](https://github.com/sainnhe/everforest) • [Back to Theme Gallery](../)

## About

Everforest is a green-based color scheme designed to be easy on the eyes, bringing the comfort and tranquility of a forest to your desktop. With soft, natural colors inspired by evergreen forests, it provides a calming coding environment.

**Key Features:**
- 🌲 Nature-inspired green color palette
- 🍃 Soft, comfortable colors for extended use
- 👁️ Optimized for reducing eye strain
- 🔄 Three contrast variants: Hard, Medium, Soft
- 🌓 Both dark and light mode support

**Best For:**
- Nature lovers and those who prefer green tones
- Reducing eye fatigue during long sessions
- Calming, tranquil workspace aesthetic
- Those seeking an alternative to blue-based themes
- Users who value comfort over vibrancy

## Color Palette

### Base Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Background** | `#2b3339` | ![#2b3339](https://via.placeholder.com/50x30/2b3339/2b3339.png) | Main background (medium) |
| **Background Alt** | `#232a2e` | ![#232a2e](https://via.placeholder.com/50x30/232a2e/232a2e.png) | Hard/darker background |
| **bg1** | `#323d43` | ![#323d43](https://via.placeholder.com/50x30/323d43/323d43.png) | Surface level 1 |
| **bg2** | `#3a454a` | ![#3a454a](https://via.placeholder.com/50x30/3a454a/3a454a.png) | Surface level 2 |
| **bg3** | `#424c50` | ![#424c50](https://via.placeholder.com/50x30/424c50/424c50.png) | Surface level 3 |
| **bg4** | `#4a555b` | ![#4a555b](https://via.placeholder.com/50x30/4a555b/4a555b.png) | Surface level 4 |
| **Foreground** | `#d3c6aa` | ![#d3c6aa](https://via.placeholder.com/50x30/d3c6aa/d3c6aa.png) | Primary text |

### Accent Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Red** | `#e67e80` | ![#e67e80](https://via.placeholder.com/50x30/e67e80/e67e80.png) | Errors, deletions |
| **Orange** | `#e69875` | ![#e69875](https://via.placeholder.com/50x30/e69875/e69875.png) | Warnings, numbers |
| **Yellow** | `#dbbc7f` | ![#dbbc7f](https://via.placeholder.com/50x30/dbbc7f/dbbc7f.png) | Cautions, strings |
| **Green** | `#a7c080` | ![#a7c080](https://via.placeholder.com/50x30/a7c080/a7c080.png) | Success, additions |
| **Aqua** | `#7fbbb3` | ![#7fbbb3](https://via.placeholder.com/50x30/7fbbb3/7fbbb3.png) | Primary accent, info |
| **Blue** | `#7fbbb3` | ![#7fbbb3](https://via.placeholder.com/50x30/7fbbb3/7fbbb3.png) | Functions, keywords |
| **Purple** | `#d699b6` | ![#d699b6](https://via.placeholder.com/50x30/d699b6/d699b6.png) | Special, constants |

### Additional Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Gray 0** | `#7a8478` | ![#7a8478](https://via.placeholder.com/50x30/7a8478/7a8478.png) | Comments |
| **Gray 1** | `#859289` | ![#859289](https://via.placeholder.com/50x30/859289/859289.png) | Subtle elements |
| **Gray 2** | `#9da9a0` | ![#9da9a0](https://via.placeholder.com/50x30/9da9a0/9da9a0.png) | Inactive elements |
| **Green/Cyan** | `#83c092` | ![#83c092](https://via.placeholder.com/50x30/83c092/83c092.png) | Secondary green |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#374247` | `#859289` |
| **Red** | `#e67e80` | `#e67e80` |
| **Green** | `#a7c080` | `#a7c080` |
| **Yellow** | `#dbbc7f` | `#dbbc7f` |
| **Blue** | `#7fbbb3` | `#7fbbb3` |
| **Magenta** | `#d699b6` | `#d699b6` |
| **Cyan** | `#83c092` | `#83c092` |
| **White** | `#d3c6aa` | `#d3c6aa` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Everforest snippets to their respective config locations
./apply-theme.sh everforest
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/everforest/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/everforest/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/everforest/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/everforest/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/everforest/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/everforest/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/everforest/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/everforest/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Everforest Overview](../../assets/screenshots/themes/everforest/overview.png)

### Terminal
![Everforest Terminal](../../assets/screenshots/themes/everforest/terminal.png)

### Application Launcher
![Everforest Rofi](../../assets/screenshots/themes/everforest/rofi.png)

### Workflow
![Everforest Workflow](../../assets/screenshots/themes/everforest/workflow.png)

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
ROUNDING="6"         # Corner rounding (natural, subtle curves)
```

### Contrast Variants
Everforest offers three contrast levels. To adjust:
```bash
# Hard contrast
BG="#232a2e"         # Use bg_alt

# Medium contrast (default)
BG="#2b3339"         # Current setting

# Soft contrast
BG="#323c41"         # Use softer background
```

## Official Resources

- [Official Repository](https://github.com/sainnhe/everforest)
- [Design Philosophy](https://github.com/sainnhe/everforest/blob/master/DESIGN.md)
- [Community Ports](https://github.com/topics/everforest)
- [Color Palette Reference](https://github.com/sainnhe/everforest/blob/master/palette.md)

## Additional Notes

- **Fonts:** Works beautifully with **JetBrains Mono** or **Fira Code**
- **Wallpapers:** Nature-themed wallpapers available in `wallpapers/` directory
- **GTK Theme:** Consider using [Everforest GTK](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme)
- **Icons:** Pair with [Everforest folder colors](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme) or nature-themed icons
- **Philosophy:** Designed to bring the comfort of nature to your coding environment
- **Light Mode:** Everforest light is equally comfortable for daytime use
- **Related:** Created by the same designer as [Gruvbox Material](https://github.com/sainnhe/gruvbox-material)
- **Green Focus:** Unique among popular themes for its nature-inspired green palette

---

[← Back to Theme Gallery](../)
