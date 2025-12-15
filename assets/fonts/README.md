# Fonts

This directory contains configuration files and installation guides for the recommended fonts used in this rice.

## Overview

Fonts play a crucial role in the overall aesthetics and readability of your rice. This collection includes:

- **FiraCode**: A monospaced font with programming ligatures
- **JetBrains Mono**: A modern monospaced font designed for developers

Both fonts support ligatures, extensive Unicode coverage, and are optimized for programming and terminal use.

## Quick Installation

### Arch Linux / Manjaro

```bash
# Install both fonts
sudo pacman -S ttf-fira-code ttf-jetbrains-mono

# Or using yay for AUR versions
yay -S ttf-fira-code ttf-jetbrains-mono-nerd
```

### Ubuntu / Debian

```bash
sudo apt install fonts-firacode fonts-jetbrains-mono
```

### Fedora

```bash
sudo dnf install fira-code-fonts jetbrains-mono-fonts
```

### Manual Installation

For all distributions, you can manually install fonts:

```bash
# Create fonts directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# Copy font files (ttf or otf) to the fonts directory
cp /path/to/font-files/*.ttf ~/.local/share/fonts/

# Update font cache
fc-cache -fv
```

## Nerd Fonts

For icons and symbols in your terminal and status bars, consider installing Nerd Font versions:

```bash
# Using a helper script
cd ~/.local/share/fonts
curl -fLo "FiraCode Nerd Font Complete.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf

curl -fLo "JetBrainsMono Nerd Font Complete.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

fc-cache -fv
```

## Font Configuration

### Terminal Emulators

#### Alacritty

See [configs/alacritty/alacritty.yml](../../configs/alacritty/alacritty.yml)

```yaml
font:
  normal:
    family: "JetBrains Mono"
  size: 11.0
```

#### Kitty

See [configs/kitty/kitty.conf](../../configs/kitty/kitty.conf)

```conf
font_family      JetBrains Mono
font_size        11.0
```

### Status Bars

#### Polybar

See [configs/polybar/config.ini](../../configs/polybar/config.ini)

```ini
[bar/main]
font-0 = JetBrains Mono:size=10;2
font-1 = Font Awesome 6 Free:style=Solid:size=10;2
```

#### Waybar

See [configs/waybar/style.css](../../configs/waybar/style.css)

```css
* {
    font-family: "JetBrains Mono", "Font Awesome 6 Free";
    font-size: 11px;
}
```

### Application Launchers

#### Rofi

See [configs/rofi/config.rasi](../../configs/rofi/config.rasi)

```rasi
configuration {
    font: "JetBrains Mono 11";
}
```

## Font Features

### Ligatures

Both FiraCode and JetBrains Mono support programming ligatures. Enable them in your terminal:

**Alacritty** (enabled by default)
**Kitty**: `disable_ligatures never`

### Powerline/Nerd Fonts Icons

For status bars and prompts with icons, use Nerd Font variants:
- `FiraCode Nerd Font`
- `JetBrainsMono Nerd Font`

## Troubleshooting

### Fonts not showing up

```bash
# Refresh font cache
fc-cache -fv

# List all available fonts
fc-list | grep -i "fira\|jetbrains"
```

### Icons not displaying

Make sure you have:
1. Nerd Fonts installed (not just regular fonts)
2. Font Awesome installed: `sudo pacman -S ttf-font-awesome`
3. Correct font family name in configs

### Verify installation

```bash
# Check if fonts are installed
fc-list : family | grep -i "fira\|jetbrains"

# Expected output:
# FiraCode Nerd Font
# JetBrains Mono
```

## Additional Fonts

### Font Awesome

Required for icons in status bars:

```bash
# Arch Linux
sudo pacman -S ttf-font-awesome

# Ubuntu/Debian
sudo apt install fonts-font-awesome
```

### Material Design Icons

```bash
# Install from AUR (Arch)
yay -S ttf-material-design-icons-git
```

## Font Recommendations

| Use Case | Recommended Font | Size |
|----------|-----------------|------|
| Terminal | JetBrains Mono Nerd Font | 10-12 |
| Code Editor | JetBrains Mono / Fira Code | 11-13 |
| Status Bar | JetBrains Mono Nerd Font | 10-11 |
| Rofi/Launcher | JetBrains Mono | 11-12 |
| Notifications | JetBrains Mono | 10-11 |
| GTK Apps | System Default | - |

## Resources

- [FiraCode GitHub](https://github.com/tonsky/FiraCode)
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [Font Awesome](https://fontawesome.com/)
- [Programming Fonts](https://www.programmingfonts.org/)

## See Also

- [Terminal Emulator Comparison](../../docs/comparisons/terminal-emulators.md)
- [Customizing Appearance](../../docs/guides/05-customizing-appearance.md)