# ❄️ Nord

![Nord Preview](../../assets/screenshots/themes/nord/overview.png)

> Arctic, north-bluish color palette for a clean and professional look

[Official Website](https://www.nordtheme.com) • [Back to Theme Gallery](../)

## About

Nord is an arctic, north-bluish color palette created for the clean- and minimal flat design pattern to achieve a optimal focus and readability for code syntax highlighting and UI components.

**Key Features:**
- ❄️ Arctic-inspired color scheme
- 🎯 Optimized for readability and focus
- 🌊 Soothing blue tones with warm accents
- 📊 Professional and minimal aesthetic
- 🔍 Excellent for long reading sessions

**Best For:**
- Professional work environments
- Minimalist desktop setups
- Reduced eye strain during coding
- Those who prefer cool, blue tones
- Clean, distraction-free workflows

## Color Palette

### Base Colors - Polar Night
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **nord0** | `#2e3440` | ![#2e3440](https://via.placeholder.com/50x30/2e3440/2e3440.png) | Main background |
| **nord1** | `#3b4252` | ![#3b4252](https://via.placeholder.com/50x30/3b4252/3b4252.png) | Lighter background |
| **nord2** | `#434c5e` | ![#434c5e](https://via.placeholder.com/50x30/434c5e/434c5e.png) | Selection background |
| **nord3** | `#4c566a` | ![#4c566a](https://via.placeholder.com/50x30/4c566a/4c566a.png) | Comments, borders |

### Text Colors - Snow Storm
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **nord4** | `#d8dee9` | ![#d8dee9](https://via.placeholder.com/50x30/d8dee9/d8dee9.png) | Primary text |
| **nord5** | `#e5e9f0` | ![#e5e9f0](https://via.placeholder.com/50x30/e5e9f0/e5e9f0.png) | Bright text |
| **nord6** | `#eceff4` | ![#eceff4](https://via.placeholder.com/50x30/eceff4/eceff4.png) | Brightest text |

### Accent Colors - Frost
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **nord7** | `#8fbcbb` | ![#8fbcbb](https://via.placeholder.com/50x30/8fbcbb/8fbcbb.png) | Light cyan |
| **nord8** | `#88c0d0` | ![#88c0d0](https://via.placeholder.com/50x30/88c0d0/88c0d0.png) | Primary cyan |
| **nord9** | `#5e81ac` | ![#5e81ac](https://via.placeholder.com/50x30/5e81ac/5e81ac.png) | Deep blue |
| **nord10** | `#81a1c1` | ![#81a1c1](https://via.placeholder.com/50x30/81a1c1/81a1c1.png) | Sky blue |

### Accent Colors - Aurora
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **nord11** | `#bf616a` | ![#bf616a](https://via.placeholder.com/50x30/bf616a/bf616a.png) | Red, errors |
| **nord12** | `#d08770` | ![#d08770](https://via.placeholder.com/50x30/d08770/d08770.png) | Orange |
| **nord13** | `#ebcb8b` | ![#ebcb8b](https://via.placeholder.com/50x30/ebcb8b/ebcb8b.png) | Yellow, warnings |
| **nord14** | `#a3be8c` | ![#a3be8c](https://via.placeholder.com/50x30/a3be8c/a3be8c.png) | Green, success |
| **nord15** | `#b48ead` | ![#b48ead](https://via.placeholder.com/50x30/b48ead/b48ead.png) | Purple |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#3b4252` | `#4c566a` |
| **Red** | `#bf616a` | `#bf616a` |
| **Green** | `#a3be8c` | `#a3be8c` |
| **Yellow** | `#ebcb8b` | `#ebcb8b` |
| **Blue** | `#81a1c1` | `#81a1c1` |
| **Magenta** | `#b48ead` | `#b48ead` |
| **Cyan** | `#88c0d0` | `#8fbcbb` |
| **White** | `#e5e9f0` | `#eceff4` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Nord snippets to their respective config locations
./apply-theme.sh nord
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/nord/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/nord/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/nord/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/nord/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/nord/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/nord/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/nord/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/nord/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Nord Overview](../../assets/screenshots/themes/nord/overview.png)

### Terminal
![Nord Terminal](../../assets/screenshots/themes/nord/terminal.png)

### Application Launcher
![Nord Rofi](../../assets/screenshots/themes/nord/rofi.png)

### Workflow
![Nord Workflow](../../assets/screenshots/themes/nord/workflow.png)

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
ROUNDING="8"         # Corner rounding (slightly less rounded for minimal look)
```

### Accent Color Preference
To change the primary accent from cyan to another Frost color:
```bash
# In colors.conf, modify:
ACCENT="#5e81ac"     # Use deep blue (nord9) instead
# or
ACCENT="#81a1c1"     # Use sky blue (nord10) instead
```

## Official Resources

- [Official Website](https://www.nordtheme.com)
- [Official Repository](https://github.com/nordtheme)
- [Port Development](https://github.com/nordtheme/nord) - 100+ application ports
- [Style Guidelines](https://www.nordtheme.com/docs)
- [Color Palette Documentation](https://www.nordtheme.com/docs/colors-and-palettes)

## Additional Notes

- **Fonts:** Works best with **JetBrains Mono** or **Fira Code** for clean readability
- **Wallpapers:** Matching arctic-themed wallpapers available in `wallpapers/` directory
- **GTK Theme:** Consider using [Nordic GTK](https://github.com/EliverLara/Nordic) for system-wide consistency
- **Icons:** Pair with [Nordzy Icons](https://github.com/alvatip/Nordzy-icon) or [Nord folders](https://github.com/yeyushengfan258/Reversal-icon-theme)
- **Consistency:** Nord is one of the most widely ported themes - maintains consistency across 100+ applications
- **Light Variant:** Nord primarily focuses on dark themes, but [Nord Light](https://github.com/nordtheme/nord-visual-studio-code) variants exist

---

[← Back to Theme Gallery](../)