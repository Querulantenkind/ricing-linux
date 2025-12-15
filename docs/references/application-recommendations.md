# Application Recommendations

Curated list of applications commonly used in Linux ricing setups, organized by category.

## Table of Contents

1. [File Managers](#file-managers)
2. [Text Editors](#text-editors)
3. [Terminal Emulators](#terminal-emulators)
4. [Media Players](#media-players)
5. [PDF & Document Readers](#pdf--document-readers)
6. [Image Viewers & Editors](#image-viewers--editors)
7. [Web Browsers](#web-browsers)
8. [System Utilities](#system-utilities)
9. [Communication](#communication)
10. [Development Tools](#development-tools)

---

## File Managers

### GUI File Managers

#### Thunar ⭐ Recommended for X11

Lightweight file manager from XFCE, perfect for tiling WMs.

```bash
# Install
sudo pacman -S thunar thunar-archive-plugin thunar-volman tumbler

# Features
# - Fast and lightweight
# - Custom actions
# - Bulk rename
# - Archive integration
```

**Pros:** Fast, minimal dependencies, good for ricing
**Cons:** Limited features compared to Nautilus

#### Nautilus (GNOME Files)

Feature-rich file manager from GNOME.

```bash
# Install
sudo pacman -S nautilus

# Features
# - Preview files
# - Search integration
# - Cloud service support
```

**Pros:** Modern UI, many features
**Cons:** Heavy GNOME dependencies

#### Dolphin

KDE's powerful file manager.

```bash
# Install
sudo pacman -S dolphin

# Features
# - Split view
# - Terminal panel
# - Extensive customization
```

**Pros:** Very powerful, split panes
**Cons:** Heavy KDE dependencies

#### PCManFM

Ultra-lightweight file manager from LXDE.

```bash
# Install
sudo pacman -S pcmanfm

# Features
# - Tabbed browsing
# - Desktop management
# - Minimal resources
```

**Pros:** Extremely light
**Cons:** Basic features

### Terminal File Managers

#### Ranger ⭐ Recommended

Vim-inspired file manager with preview.

```bash
# Install
sudo pacman -S ranger

# Optional: Image preview
sudo pacman -S ueberzug  # X11
# or kitty/wezterm with built-in support

# Features
# - Vim keybindings
# - Image preview
# - Customizable
```

**Configuration (`~/.config/ranger/rc.conf`):**
```bash
set preview_images true
set preview_images_method ueberzug  # or kitty
set show_hidden true
set draw_borders both
```

**Pros:** Powerful, vim-like
**Cons:** Learning curve

#### lf (List Files)

Go-written ranger alternative.

```bash
# Install
sudo pacman -S lf

# Features
# - Fast (Go)
# - Server/client model
# - Cross-platform
```

**Pros:** Very fast, simpler than ranger
**Cons:** Less features

#### nnn

Blazing fast terminal file manager.

```bash
# Install
sudo pacman -S nnn

# Features
# - Extremely fast
# - Plugins
# - Disk usage analyzer
```

**Pros:** Fastest, very light
**Cons:** Minimal UI

#### Yazi

Modern terminal file manager in Rust.

```bash
# Install
sudo pacman -S yazi

# Features
# - Async I/O
# - Image preview
# - Built-in pager
```

**Pros:** Modern, fast, good preview
**Cons:** Newer, less mature

### Comparison

| App | Weight | Preview | Tabs | Best For |
|-----|--------|---------|------|----------|
| Thunar | Light | ✗ | ✗ | X11 WMs |
| Nautilus | Heavy | ✓ | ✗ | GNOME users |
| Dolphin | Heavy | ✓ | ✓ | Power users |
| Ranger | Light | ✓ | ✓ | Terminal lovers |
| lf | Very Light | ✓ | ✓ | Speed |
| nnn | Minimal | ✓ | ✗ | Minimalists |
| Yazi | Light | ✓ | ✓ | Modern terminal |

---

## Text Editors

### Terminal Editors

#### Neovim ⭐ Recommended

Modern Vim with Lua configuration.

```bash
# Install
sudo pacman -S neovim

# Plugin managers
# - lazy.nvim (recommended)
# - packer.nvim
# - vim-plug
```

**Popular distributions:**
- **LazyVim** - Full IDE experience
- **NvChad** - Beautiful and fast
- **AstroNvim** - Extensible config
- **LunarVim** - Opinionated setup

**Pros:** Extremely powerful, endless customization
**Cons:** Steep learning curve

#### Vim

Classic modal editor.

```bash
# Install
sudo pacman -S vim

# Or gVim (GUI)
sudo pacman -S gvim
```

**Pros:** Everywhere, stable
**Cons:** Less modern than Neovim

#### Helix

Post-modern modal editor.

```bash
# Install
sudo pacman -S helix

# Features
# - Multiple cursors
# - Tree-sitter
# - LSP built-in
```

**Pros:** Batteries included, modern
**Cons:** Less customizable

#### Micro

Easy terminal editor.

```bash
# Install
sudo pacman -S micro

# Features
# - Normal keybindings (Ctrl+S, etc.)
# - Mouse support
# - Plugins
```

**Pros:** Easy to use
**Cons:** Less powerful

#### Nano

Simple editor for quick edits.

```bash
# Install (usually pre-installed)
sudo pacman -S nano
```

**Pros:** Simple
**Cons:** Limited features

### GUI Editors

#### VSCode / VSCodium

Popular code editor.

```bash
# VSCode (Microsoft)
sudo pacman -S code

# VSCodium (no telemetry)
yay -S vscodium
```

**Pros:** Rich extensions, easy
**Cons:** Electron, heavier

#### Kate

KDE's advanced editor.

```bash
# Install
sudo pacman -S kate

# Features
# - LSP support
# - Project management
# - Terminal integration
```

**Pros:** Powerful, native
**Cons:** KDE dependencies

#### Gedit

Simple GNOME editor.

```bash
# Install
sudo pacman -S gedit
```

**Pros:** Simple, clean
**Cons:** Basic features

#### Sublime Text

Fast proprietary editor.

```bash
# Install
yay -S sublime-text-4
```

**Pros:** Very fast, great UX
**Cons:** Paid, closed source

### Comparison

| Editor | Type | Learning Curve | Customization | Best For |
|--------|------|----------------|---------------|----------|
| Neovim | Terminal | High | Extreme | Power users |
| Vim | Terminal | High | High | Traditionalists |
| Helix | Terminal | Medium | Low | Modern terminal |
| Micro | Terminal | Low | Medium | Quick edits |
| VSCode | GUI | Low | High | General dev |
| Kate | GUI | Low | Medium | KDE users |

---

## Terminal Emulators

See also: [Terminal Emulators Comparison](../comparisons/terminal-emulators.md)

### Alacritty ⭐ Recommended

GPU-accelerated terminal.

```bash
# Install
sudo pacman -S alacritty

# Config: ~/.config/alacritty/alacritty.yml
```

**Pros:** Fast, minimal, cross-platform
**Cons:** No tabs/splits (use tmux)

### Kitty ⭐ Recommended

Feature-rich GPU terminal.

```bash
# Install
sudo pacman -S kitty

# Config: ~/.config/kitty/kitty.conf
```

**Pros:** Fast, image support, splits
**Cons:** Larger than Alacritty

### WezTerm

Rust-based terminal with Lua config.

```bash
# Install
sudo pacman -S wezterm

# Config: ~/.config/wezterm/wezterm.lua
```

**Pros:** Tabs, multiplexer, Lua config
**Cons:** Larger

### Foot (Wayland)

Lightweight Wayland terminal.

```bash
# Install
sudo pacman -S foot

# Config: ~/.config/foot/foot.ini
```

**Pros:** Fast, Wayland-native
**Cons:** Wayland only

### URxvt (rxvt-unicode)

Classic X11 terminal.

```bash
# Install
sudo pacman -S rxvt-unicode

# Config: ~/.Xresources
```

**Pros:** Very light, Xresources themes
**Cons:** X11 only, complex config

### Comparison

| Terminal | GPU | Tabs | Images | Config Format |
|----------|-----|------|--------|---------------|
| Alacritty | ✓ | ✗ | ✗ | YAML/TOML |
| Kitty | ✓ | ✓ | ✓ | Custom |
| WezTerm | ✓ | ✓ | ✓ | Lua |
| Foot | ✓ | ✗ | ✓ | INI |
| URxvt | ✗ | ✗ | ✗ | Xresources |

---

## Media Players

### Video Players

#### mpv ⭐ Recommended

Powerful, minimal video player.

```bash
# Install
sudo pacman -S mpv

# Config: ~/.config/mpv/mpv.conf
hwdec=auto
vo=gpu
profile=gpu-hq
```

**Pros:** Powerful, scriptable, minimal UI
**Cons:** Terminal-focused

#### VLC

Universal media player.

```bash
# Install
sudo pacman -S vlc
```

**Pros:** Plays everything
**Cons:** Heavy UI

#### Celluloid

GTK frontend for mpv.

```bash
# Install
sudo pacman -S celluloid
```

**Pros:** Simple GUI for mpv
**Cons:** Less configurable

### Music Players

#### ncmpcpp + MPD ⭐ Recommended for Ricing

Terminal music player with MPD backend.

```bash
# Install
sudo pacman -S mpd ncmpcpp mpc

# MPD config: ~/.config/mpd/mpd.conf
# ncmpcpp config: ~/.config/ncmpcpp/config
```

**Pros:** Perfect for ricing, powerful
**Cons:** Setup required

#### cmus

Simple terminal music player.

```bash
# Install
sudo pacman -S cmus
```

**Pros:** Simple, no daemon
**Cons:** Less features

#### Spotify (Flatpak)

Streaming service.

```bash
# Install
flatpak install flathub com.spotify.Client

# Or native
yay -S spotify
```

**Theme:** Use spicetify for theming

```bash
yay -S spicetify-cli
spicetify backup apply
```

#### Strawberry

Local music player.

```bash
# Install
sudo pacman -S strawberry
```

**Pros:** Feature-rich, good UI
**Cons:** Heavier

### Comparison

| Player | Type | UI | Best For |
|--------|------|-----|----------|
| mpv | Video | Minimal | Power users |
| VLC | Video | Full | Casual use |
| ncmpcpp | Music/Terminal | TUI | Ricing |
| cmus | Music/Terminal | TUI | Simplicity |
| Strawberry | Music/GUI | Full | Local library |

---

## PDF & Document Readers

### Zathura ⭐ Recommended

Vim-like PDF reader.

```bash
# Install
sudo pacman -S zathura zathura-pdf-mupdf

# Config: ~/.config/zathura/zathurarc
set selection-clipboard clipboard
set recolor true
set recolor-lightcolor "#1e1e2e"
set recolor-darkcolor "#cdd6f4"
```

**Pros:** Vim keybindings, themeable
**Cons:** Basic features

### Evince

GNOME document viewer.

```bash
# Install
sudo pacman -S evince
```

**Pros:** Full-featured
**Cons:** GNOME dependencies

### Okular

KDE document viewer.

```bash
# Install
sudo pacman -S okular
```

**Pros:** Very powerful, annotations
**Cons:** KDE dependencies

### Sioyek

PDF reader for research.

```bash
# Install
yay -S sioyek

# Features
# - Vim keybindings
# - Reference linking
# - Synctex support
```

**Pros:** Academic-focused
**Cons:** Specialized

### Comparison

| Reader | Keybindings | Annotations | Theming |
|--------|-------------|-------------|---------|
| Zathura | Vim | Basic | ✓ |
| Evince | Normal | ✓ | ✗ |
| Okular | Normal | ✓✓ | ✗ |
| Sioyek | Vim | ✓ | ✓ |

---

## Image Viewers & Editors

### Image Viewers

#### nsxiv (Recommended)

Simple X11 image viewer (sxiv successor).

```bash
# Install
sudo pacman -S nsxiv

# Features
# - Vim-like
# - Thumbnails
# - Lightweight
```

#### feh

Lightweight X11 viewer, also for wallpapers.

```bash
# Install
sudo pacman -S feh

# Set wallpaper
feh --bg-fill wallpaper.jpg
```

#### imv

Image viewer for Wayland.

```bash
# Install
sudo pacman -S imv
```

#### swayimg

Wayland image viewer.

```bash
# Install
sudo pacman -S swayimg
```

### Image Editors

#### GIMP

Full image editor.

```bash
# Install
sudo pacman -S gimp
```

#### Krita

Digital painting.

```bash
# Install
sudo pacman -S krita
```

#### ImageMagick

Command-line image processing.

```bash
# Install
sudo pacman -S imagemagick

# Convert
convert input.png -resize 50% output.png

# Screenshot editing
convert screenshot.png -crop 1920x1080+0+0 cropped.png
```

### Comparison

| App | Type | X11 | Wayland | Best For |
|-----|------|-----|---------|----------|
| nsxiv | Viewer | ✓ | ✗ | Quick viewing |
| feh | Viewer | ✓ | ✗ | Wallpapers |
| imv | Viewer | ✗ | ✓ | Wayland |
| GIMP | Editor | ✓ | ✓ | Full editing |
| Krita | Editor | ✓ | ✓ | Drawing |

---

## Web Browsers

### Firefox ⭐ Recommended

Open source, customizable.

```bash
# Install
sudo pacman -S firefox

# Theming: userChrome.css
# ~/.mozilla/firefox/PROFILE/chrome/userChrome.css
```

**Extensions for ricing:**
- Tree Style Tabs
- Custom CSS themes

### Chromium

Open source Chrome.

```bash
# Install
sudo pacman -S chromium
```

### Brave

Privacy-focused.

```bash
# Install
yay -S brave-bin
```

### qutebrowser

Vim-like browser.

```bash
# Install
sudo pacman -S qutebrowser

# Config: ~/.config/qutebrowser/config.py
```

**Pros:** Keyboard-driven, themeable
**Cons:** Some sites don't work well

### Min

Minimal browser.

```bash
# Install
yay -S min
```

---

## System Utilities

### System Monitors

#### btop ⭐ Recommended

Beautiful resource monitor.

```bash
# Install
sudo pacman -S btop

# Config: ~/.config/btop/btop.conf
```

#### htop

Classic process viewer.

```bash
# Install
sudo pacman -S htop
```

#### gotop

Go-based monitor.

```bash
# Install
yay -S gotop
```

### Disk Usage

#### ncdu

Terminal disk analyzer.

```bash
# Install
sudo pacman -S ncdu

# Usage
ncdu /
```

#### Filelight

Visual disk usage.

```bash
# Install
sudo pacman -S filelight
```

### Network

#### nmtui

Network manager TUI.

```bash
# Usually included with NetworkManager
nmtui
```

### Clipboard Managers

#### copyq (X11)

```bash
sudo pacman -S copyq
```

#### cliphist (Wayland)

```bash
sudo pacman -S cliphist wl-clipboard
```

### Screenshots

See: [Utility Scripts](../../scripts/utilities/)

---

## Communication

### Discord

```bash
# Install
sudo pacman -S discord

# Or flatpak
flatpak install flathub com.discordapp.Discord

# Theming: BetterDiscord
yay -S betterdiscord-installer
```

### Telegram

```bash
# Install
sudo pacman -S telegram-desktop
```

### Element (Matrix)

```bash
# Install
sudo pacman -S element-desktop
```

### Thunderbird

Email client.

```bash
# Install
sudo pacman -S thunderbird
```

---

## Development Tools

### Version Control

#### lazygit ⭐ Recommended

Terminal UI for git.

```bash
# Install
sudo pacman -S lazygit
```

#### GitKraken

GUI git client.

```bash
# Install
yay -S gitkraken
```

### Containers

#### Docker

```bash
# Install
sudo pacman -S docker docker-compose

# Start
sudo systemctl enable docker
sudo usermod -aG docker $USER
```

#### Podman

Rootless containers.

```bash
# Install
sudo pacman -S podman podman-compose
```

### Terminal Multiplexers

#### tmux ⭐ Recommended

```bash
# Install
sudo pacman -S tmux

# Config: ~/.tmux.conf
```

#### Zellij

Modern multiplexer.

```bash
# Install
sudo pacman -S zellij
```

### API Testing

#### Insomnia

```bash
# Install
yay -S insomnia
```

#### httpie

Terminal HTTP client.

```bash
# Install
sudo pacman -S httpie
```

---

## Quick Install Script

Install recommended apps:

```bash
#!/bin/bash
# Recommended applications for ricing

sudo pacman -S --needed \
  thunar \
  ranger \
  neovim \
  alacritty \
  kitty \
  mpv \
  ncmpcpp mpd \
  zathura zathura-pdf-mupdf \
  nsxiv \
  feh \
  firefox \
  btop \
  lazygit \
  tmux
```

---

## See Also

- [Terminal Emulators Comparison](../comparisons/terminal-emulators.md)
- [Launchers Comparison](../comparisons/launchers.md)
- [Useful Resources](useful-resources.md)
