# Icon Theme Recommendations

A curated list of icon themes that work well with Linux ricing and the themes in this repository.

## Top Recommendations

### 1. Papirus

**Status:** ⭐ Highly Recommended

The most popular icon theme for Linux, with excellent coverage and regular updates.

**Features:**
- 5000+ icons
- Multiple variants (Light, Dark, Adaptive)
- Folder color customization
- Excellent GTK/Qt coverage
- Active development

**Installation:**
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
- `Papirus` - Standard colorful version
- `Papirus-Dark` - For dark themes
- `Papirus-Light` - For light themes
- `ePapirus` - elementary OS style

**Best with:** All themes, especially Catppuccin, Nord, Tokyo Night

**Links:**
- [GitHub](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [Website](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

---

### 2. Breeze

**Status:** Recommended for KDE-style aesthetics

The default icon theme for KDE Plasma, clean and professional.

**Features:**
- Clean, modern design
- Excellent for business/professional setups
- Good coverage
- Light and dark variants

**Installation:**
```bash
# Arch Linux
sudo pacman -S breeze-icons

# Ubuntu/Debian
sudo apt install breeze-icon-theme

# Fedora
sudo dnf install breeze-icon-theme
```

**Best with:** Nord, Everforest, minimalist themes

---

### 3. Numix

**Status:** Classic choice

A flat icon theme with a circle variant, very popular in the ricing community.

**Features:**
- Flat design
- Circle variant available
- Multiple color options
- Lightweight

**Installation:**
```bash
# Arch Linux (AUR)
yay -S numix-icon-theme-git numix-circle-icon-theme-git

# Ubuntu/Debian
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-icon-theme numix-icon-theme-circle

# Fedora
sudo dnf copr enable numix/numix
sudo dnf install numix-icon-theme numix-icon-theme-circle
```

**Best with:** Gruvbox, Dracula, classic themes

---

### 4. Candy Icons

**Status:** Great for colorful setups

Sweet, colorful icon theme with modern flat design.

**Features:**
- Vibrant colors
- Modern flat aesthetic
- Good application coverage

**Installation:**
```bash
git clone https://github.com/EliverLara/candy-icons.git
cd candy-icons
./install.sh
```

**Best with:** Rose Pine, colorful themes

**Links:**
- [GitHub](https://github.com/EliverLara/candy-icons)

---

### 5. Tela Icon Theme

**Status:** Modern and colorful

A flat colorful design icon theme with multiple variants.

**Features:**
- Multiple color variants
- Rounded design
- Good coverage

**Installation:**
```bash
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh -a  # Install all colors
```

**Variants:**
- Tela (standard)
- Tela-grey
- Tela-purple
- Tela-pink
- Tela-red
- Tela-orange
- Tela-yellow
- Tela-green
- Tela-blue

**Best with:** Any theme, especially Tokyo Night, Catppuccin

**Links:**
- [GitHub](https://github.com/vinceliuice/Tela-icon-theme)

---

### 6. BeautyLine

**Status:** Unique line-style design

Beautiful icon theme with a distinctive line art style.

**Features:**
- Unique line art style
- Clean and minimal
- Good for modern setups

**Installation:**
```bash
git clone https://github.com/gvolpe/BeautyLine.git
cd BeautyLine
./install.sh
```

**Best with:** Minimal themes, Nord, Everforest

**Links:**
- [GitHub](https://github.com/gvolpe/BeautyLine)

---

### 7. Zafiro

**Status:** Modern flat design

Modern flat icon theme with blur effect.

**Features:**
- Modern flat aesthetic
- Multiple variants
- Blur effects on folder icons

**Installation:**
```bash
git clone https://github.com/zayronxio/Zafiro-icons.git
cd Zafiro-icons
./install.sh
```

**Best with:** Modern themes

**Links:**
- [GitHub](https://github.com/zayronxio/Zafiro-icons)

---

## Cursor Themes

### Bibata Cursor Theme

Modern, material-design inspired cursor theme.

**Installation:**
```bash
# Arch Linux (AUR)
yay -S bibata-cursor-theme

# Manual
git clone https://github.com/ful1e5/Bibata_Cursor.git
cd Bibata_Cursor
./install.sh
```

**Variants:**
- Bibata-Modern-Amber
- Bibata-Modern-Classic
- Bibata-Modern-Ice
- Bibata-Original-Amber
- Bibata-Original-Classic
- Bibata-Original-Ice

### Breeze Cursor

KDE's default cursor theme.

```bash
sudo pacman -S breeze  # Arch
sudo apt install breeze-cursor-theme  # Debian/Ubuntu
```

### Capitaine Cursors

Material design cursor theme.

```bash
yay -S capitaine-cursors  # Arch (AUR)
```

---

## Theme-Specific Recommendations

| Color Theme | Icon Theme | Cursor Theme |
|------------|------------|--------------|
| Catppuccin | Papirus-Dark, Tela | Bibata-Modern-Ice |
| Nord | Papirus, Numix-Circle | Breeze |
| Dracula | Papirus-Dark, Candy | Bibata-Modern-Amber |
| Gruvbox | Papirus, Numix | Breeze |
| Tokyo Night | Papirus-Dark, Tela-blue | Bibata-Modern-Ice |
| Rose Pine | Candy, Papirus | Bibata-Modern-Amber |
| Everforest | Papirus, BeautyLine | Breeze |
| Solarized Light | Papirus-Light | Breeze |
| Solarized Dark | Papirus-Dark | Breeze |

---

## Configuration

### GTK Applications

Edit `~/.config/gtk-3.0/settings.ini`:

```ini
[Settings]
gtk-icon-theme-name=Papirus-Dark
gtk-cursor-theme-name=Bibata-Modern-Ice
gtk-cursor-theme-size=24
```

Edit `~/.gtkrc-2.0`:

```
gtk-icon-theme-name="Papirus-Dark"
gtk-cursor-theme-name="Bibata-Modern-Ice"
```

### X11 Cursor

Edit `~/.Xresources`:

```
Xcursor.theme: Bibata-Modern-Ice
Xcursor.size: 24
```

Then reload:
```bash
xrdb ~/.Xresources
```

### Wayland/Hyprland Cursor

Edit `~/.config/hypr/hyprland.conf`:

```
env = XCURSOR_THEME,Bibata-Modern-Ice
env = XCURSOR_SIZE,24
```

---

## Icon Fonts for Status Bars

For Polybar, Waybar, and other status bars, use icon fonts:

### Font Awesome

```bash
sudo pacman -S ttf-font-awesome  # Arch
sudo apt install fonts-font-awesome  # Ubuntu
```

### Material Design Icons

```bash
yay -S ttf-material-design-icons-git  # Arch (AUR)
```

### Nerd Fonts

See [fonts directory](../fonts/) for Nerd Fonts installation.

---

## Resources

- [Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [Breeze Icons](https://github.com/KDE/breeze-icons)
- [Numix Project](https://github.com/numixproject)
- [Candy Icons](https://github.com/EliverLara/candy-icons)
- [Tela Icons](https://github.com/vinceliuice/Tela-icon-theme)
- [BeautyLine](https://github.com/gvolpe/BeautyLine)
- [Bibata Cursors](https://github.com/ful1e5/Bibata_Cursor)
- [Icon Theme Spec](https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html)

---

## See Also

- [Icon Installation Script](install-icons.sh)
- [GTK Configuration](../../configs/gtk/)
- [Fonts](../fonts/)
- [Themes](../../themes/)
