# Icons

This directory contains information and scripts for managing icon themes in your rice.

## Structure

```
icons/
├── README.md              # This file
├── install-icons.sh       # Icon theme installation script
└── icon-themes.md         # Recommended icon themes and configuration
```

## Overview

Icons are an important visual element of your desktop environment. This guide covers:

- Popular icon themes for Linux ricing
- Installation methods
- Configuration for GTK and Qt applications
- Icon theme switching

## Quick Installation

```bash
# Install recommended icon themes (Arch)
sudo pacman -S papirus-icon-theme breeze-icons

# Or use the install script
./install-icons.sh
```

## Recommended Icon Themes

### Papirus

Modern, colorful icon theme with excellent coverage.

**Install:**
```bash
# Arch Linux
sudo pacman -S papirus-icon-theme

# Ubuntu/Debian
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme

# Fedora
sudo dnf install papirus-icon-theme
```

**Variants:**
- Papirus (default colorful)
- Papirus-Dark (dark version)
- Papirus-Light (light version)
- ePapirus (for elementary OS)

### Candy Icons

Sweet, colorful icon theme with a modern flat design.

**Install:**
```bash
git clone https://github.com/EliverLara/candy-icons.git
cd candy-icons
./install.sh
```

### Tela Icon Theme

Flat, colorful design icon theme.

**Install:**
```bash
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh
```

### Numix

Classic flat icon theme, available in multiple colors.

**Install:**
```bash
# Arch Linux
sudo pacman -S numix-icon-theme-git

# Ubuntu/Debian
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-icon-theme numix-icon-theme-circle
```

### BeautyLine

Beautiful line-style icon theme.

**Install:**
```bash
git clone https://github.com/gvolpe/BeautyLine.git
cd BeautyLine
./install.sh
```

### Zafiro

Modern flat icon theme.

**Install:**
```bash
git clone https://github.com/zayronxio/Zafiro-icons.git
cd Zafiro-icons
./install.sh
```

## Configuration

### GTK Applications

Icon themes are configured through GTK settings.

#### Using lxappearance (GUI)

```bash
# Install lxappearance
sudo pacman -S lxappearance  # Arch
sudo apt install lxappearance  # Ubuntu

# Run and select icon theme
lxappearance
```

#### Manual Configuration

Edit `~/.config/gtk-3.0/settings.ini`:

```ini
[Settings]
gtk-icon-theme-name=Papirus-Dark
gtk-theme-name=Adwaita-dark
gtk-font-name=Sans 10
```

Edit `~/.gtkrc-2.0`:

```
gtk-icon-theme-name="Papirus-Dark"
gtk-theme-name="Adwaita-dark"
```

### Qt Applications

For Qt applications on GTK-based desktops:

```bash
# Install qt5ct or kvantum
sudo pacman -S qt5ct kvantum

# Set environment variable
export QT_QPA_PLATFORMTHEME=qt5ct

# Run qt5ct to configure
qt5ct
```

### Icon Theme for Rofi

Rofi can display icons if configured:

```rasi
configuration {
    show-icons: true;
    icon-theme: "Papirus-Dark";
}
```

See [configs/rofi/config.rasi](../../configs/rofi/config.rasi)

### Icon Theme for File Managers

#### Thunar

Settings → Appearance → Icons → Select theme

#### Nautilus

Uses GTK settings automatically.

#### PCManFM

Edit → Preferences → Display → Icon theme

## Icon Cache

After installing icon themes, update the icon cache:

```bash
# Update GTK icon cache
gtk-update-icon-cache -f -t ~/.local/share/icons/THEME_NAME

# Update system cache
sudo gtk-update-icon-cache -f -t /usr/share/icons/THEME_NAME

# Or use fc-cache (for font-based icons)
fc-cache -fv
```

## Nerd Fonts and Icon Fonts

For terminal and status bar icons:

```bash
# Install Nerd Fonts (includes icons)
yay -S ttf-jetbrains-mono-nerd ttf-firacode-nerd

# Install Font Awesome
sudo pacman -S ttf-font-awesome

# Install Material Design Icons
yay -S ttf-material-design-icons-git
```

See [assets/fonts/README.md](../fonts/README.md) for font installation.

## Theme-Specific Icon Recommendations

| Theme | Recommended Icon Theme |
|-------|----------------------|
| Catppuccin | Papirus-Dark, Tela |
| Nord | Papirus, Numix-Circle |
| Dracula | Papirus-Dark, BeautyLine |
| Gruvbox | Papirus, Numix |
| Tokyo Night | Papirus-Dark, Zafiro |
| Rose Pine | Papirus, Candy Icons |
| Everforest | Papirus, BeautyLine |
| Solarized | Papirus-Light/Dark |

## Cursor Themes

Don't forget cursor themes!

**Popular options:**
- Bibata Cursor
- Breeze
- Capitaine Cursors
- Volantes Cursors

**Install Bibata (example):**
```bash
yay -S bibata-cursor-theme

# Set in GTK settings
gtk-cursor-theme-name=Bibata-Modern-Ice
```

## Custom Icons

To add custom application icons:

1. Place icon file in `~/.local/share/icons/hicolor/SIZE/apps/`
   - SIZE can be: 16x16, 22x22, 24x24, 32x32, 48x48, 64x64, 128x128, 256x256, scalable
   
2. Update icon cache:
   ```bash
   gtk-update-icon-cache ~/.local/share/icons/hicolor
   ```

3. Update desktop entry:
   ```bash
   # Edit ~/.local/share/applications/app.desktop
   Icon=my-custom-icon
   ```

## Icon Directories

Icon themes are searched in these locations (in order):

1. `~/.local/share/icons/` (user icons)
2. `~/.icons/` (legacy user icons)
3. `/usr/share/icons/` (system icons)
4. `/usr/local/share/icons/` (locally installed)

## Troubleshooting

### Icons not showing

1. Check if theme is installed:
   ```bash
   ls /usr/share/icons/
   ls ~/.local/share/icons/
   ```

2. Verify GTK settings:
   ```bash
   gsettings get org.gnome.desktop.interface icon-theme
   ```

3. Update icon cache:
   ```bash
   gtk-update-icon-cache -f -t ~/.local/share/icons/THEME_NAME
   ```

### Missing application icons

Some applications use hardcoded icon names. Check:

```bash
# Find icon name used by application
grep Icon /usr/share/applications/APP.desktop

# Search for icon in theme
find /usr/share/icons/THEME -name "ICON_NAME*"
```

### Qt apps not using GTK icons

Ensure `qt5ct` is installed and configured:

```bash
export QT_QPA_PLATFORMTHEME=qt5ct
```

Add to `~/.profile` or `~/.zshrc` to make permanent.

## Scripts

See [install-icons.sh](install-icons.sh) for automated installation.

## Resources

- [Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [Numix Icons](https://github.com/numixproject/numix-icon-theme)
- [Candy Icons](https://github.com/EliverLara/candy-icons)
- [Tela Icons](https://github.com/vinceliuice/Tela-icon-theme)
- [Icon Theme Specification](https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html)
- [Nerd Fonts](https://www.nerdfonts.com/)

## See Also

- [GTK Configuration](../../configs/gtk/)
- [Fonts](../fonts/)
- [Themes](../../themes/)
- [Customizing Appearance Guide](../../docs/guides/05-customizing-appearance.md)
