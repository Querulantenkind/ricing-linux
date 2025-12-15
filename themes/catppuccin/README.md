# 🎨 Catppuccin

![Catppuccin Preview](../../assets/screenshots/themes/catppuccin/overview.png)

> A modern pastel-based theme with excellent contrast and soothing aesthetics

[Official Website](https://github.com/catppuccin/catppuccin) • [Back to Theme Gallery](../)

## About

Catppuccin is a community-driven pastel theme that aims to be the middle ground between low and high contrast themes. It consists of 4 soothing warm flavors with 26 eye-candy colors each, perfect for coding, designing, and exploring!

**Key Features:**
- 🎨 Four beautiful flavors: Latte (light), Frappé, Macchiato, and Mocha (dark)
- 💜 26 carefully crafted pastel colors
- 👁️ Excellent contrast ratios for accessibility
- 🌈 Vibrant yet comfortable color palette
- 🎯 Optimized for both work and creativity

**Best For:**
- Long coding sessions without eye strain
- Creative work and design
- Modern, aesthetic desktop setups
- Those who prefer warm, pastel colors

## Color Palette

### Base Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Base** | `#1e1e2e` | ![#1e1e2e](https://via.placeholder.com/50x30/1e1e2e/1e1e2e.png) | Main background |
| **Mantle** | `#181825` | ![#181825](https://via.placeholder.com/50x30/181825/181825.png) | Darker background |
| **Surface 0** | `#313244` | ![#313244](https://via.placeholder.com/50x30/313244/313244.png) | Surface level 0 |
| **Surface 1** | `#45475a` | ![#45475a](https://via.placeholder.com/50x30/45475a/45475a.png) | Surface level 1 |
| **Text** | `#cdd6f4` | ![#cdd6f4](https://via.placeholder.com/50x30/cdd6f4/cdd6f4.png) | Primary text |
| **Subtext** | `#bac2de` | ![#bac2de](https://via.placeholder.com/50x30/bac2de/bac2de.png) | Dimmed text |

### Accent Colors
| Color | Hex | Preview | Usage |
|-------|-----|---------|-------|
| **Rosewater** | `#f5e0dc` | ![#f5e0dc](https://via.placeholder.com/50x30/f5e0dc/f5e0dc.png) | Soft pink accents |
| **Flamingo** | `#f2cdcd` | ![#f2cdcd](https://via.placeholder.com/50x30/f2cdcd/f2cdcd.png) | Light pink |
| **Pink** | `#f5c2e7` | ![#f5c2e7](https://via.placeholder.com/50x30/f5c2e7/f5c2e7.png) | Pink highlights |
| **Mauve** | `#cba6f7` | ![#cba6f7](https://via.placeholder.com/50x30/cba6f7/cba6f7.png) | Purple accents |
| **Red** | `#f38ba8` | ![#f38ba8](https://via.placeholder.com/50x30/f38ba8/f38ba8.png) | Errors, urgent |
| **Maroon** | `#eba0ac` | ![#eba0ac](https://via.placeholder.com/50x30/eba0ac/eba0ac.png) | Dark red |
| **Peach** | `#fab387` | ![#fab387](https://via.placeholder.com/50x30/fab387/fab387.png) | Orange accents |
| **Yellow** | `#f9e2af` | ![#f9e2af](https://via.placeholder.com/50x30/f9e2af/f9e2af.png) | Warnings |
| **Green** | `#a6e3a1` | ![#a6e3a1](https://via.placeholder.com/50x30/a6e3a1/a6e3a1.png) | Success |
| **Teal** | `#94e2d5` | ![#94e2d5](https://via.placeholder.com/50x30/94e2d5/94e2d5.png) | Teal highlights |
| **Sky** | `#89dceb` | ![#89dceb](https://via.placeholder.com/50x30/89dceb/89dceb.png) | Light blue |
| **Sapphire** | `#74c7ec` | ![#74c7ec](https://via.placeholder.com/50x30/74c7ec/74c7ec.png) | Bright blue |
| **Blue** | `#89b4fa` | ![#89b4fa](https://via.placeholder.com/50x30/89b4fa/89b4fa.png) | Primary accent |
| **Lavender** | `#b4befe` | ![#b4befe](https://via.placeholder.com/50x30/b4befe/b4befe.png) | Light purple |

### Terminal ANSI Colors
| Color | Normal | Bright |
|-------|--------|--------|
| **Black** | `#45475a` | `#585b70` |
| **Red** | `#f38ba8` | `#f38ba8` |
| **Green** | `#a6e3a1` | `#a6e3a1` |
| **Yellow** | `#f9e2af` | `#f9e2af` |
| **Blue** | `#89b4fa` | `#89b4fa` |
| **Magenta** | `#f5c2e7` | `#f5c2e7` |
| **Cyan** | `#94e2d5` | `#94e2d5` |
| **White** | `#bac2de` | `#a6adc8` |

## Installation

### Quick Apply All Configs
```bash
# Copy all Catppuccin snippets to their respective config locations
./apply-theme.sh catppuccin
```

### Apply to Individual Applications

**Alacritty:**
```bash
cp themes/catppuccin/snippets/alacritty.yml ~/.config/alacritty/
```

**Kitty:**
```bash
cp themes/catppuccin/snippets/kitty.conf ~/.config/kitty/
kitty @ set-colors -a ~/.config/kitty/kitty.conf
```

**Rofi:**
```bash
cp themes/catppuccin/snippets/rofi-theme.rasi ~/.config/rofi/
```

**i3wm:**
```bash
cat themes/catppuccin/snippets/i3-colors.conf >> ~/.config/i3/config
i3-msg reload
```

**Hyprland:**
```bash
cp themes/catppuccin/snippets/hyprland-colors.conf ~/.config/hyprland/
# Add 'source = ~/.config/hyprland/hyprland-colors.conf' to hyprland.conf
```

**Waybar:**
```bash
cp themes/catppuccin/snippets/waybar-colors.css ~/.config/waybar/
# Add '@import "waybar-colors.css";' to style.css
```

**Polybar:**
```bash
cat themes/catppuccin/snippets/polybar-colors.ini >> ~/.config/polybar/config.ini
polybar-msg cmd restart
```

**Dunst:**
```bash
cp themes/catppuccin/snippets/dunst-colors.conf ~/.config/dunst/dunstrc
killall dunst && dunst &
```

> **Note:** Manual adjustments may be needed depending on your configuration structure. Always backup your configs before applying!

## Screenshots

### Overview
![Catppuccin Overview](../../assets/screenshots/themes/catppuccin/overview.png)

### Terminal
![Catppuccin Terminal](../../assets/screenshots/themes/catppuccin/terminal.png)

### Application Launcher
![Catppuccin Rofi](../../assets/screenshots/themes/catppuccin/rofi.png)

### Workflow
![Catppuccin Workflow](../../assets/screenshots/themes/catppuccin/workflow.png)

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
ROUNDING="10"        # Corner rounding (10px for modern look)
```

### Switching Flavors
Catppuccin has 4 flavors. To use a different flavor:
1. Visit the [official ports repository](https://github.com/catppuccin/catppuccin)
2. Find your application's Catppuccin port
3. Choose your preferred flavor (Latte, Frappé, Macchiato, or Mocha)
4. Replace the color values in `colors.conf`

## Official Resources

- [Official Repository](https://github.com/catppuccin/catppuccin)
- [Catppuccin Ports](https://github.com/catppuccin) - 200+ application themes
- [Style Guide](https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md)
- [Color Palette](https://github.com/catppuccin/catppuccin#-palette)
- [Community Discord](https://discord.com/invite/r6Mdz5dpFc)

## Additional Notes

- **Fonts:** Works best with **JetBrains Mono** or **Fira Code** with ligatures
- **Wallpapers:** Matching wallpapers available in `wallpapers/` directory
- **GTK Theme:** Consider using [Catppuccin GTK](https://github.com/catppuccin/gtk) for system-wide consistency
- **Icons:** Pair with [Papirus Icon Theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) with Catppuccin colors
- **Cursors:** Use [Catppuccin Cursors](https://github.com/catppuccin/cursors) for a complete setup

---

[← Back to Theme Gallery](../)