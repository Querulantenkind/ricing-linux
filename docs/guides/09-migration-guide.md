# Migration Guide

Complete guide for migrating to Linux ricing from various environments.

## Table of Contents

1. [Windows to Linux Rice](#windows-to-linux-rice)
2. [macOS to Linux Rice](#macos-to-linux-rice)
3. [GNOME/KDE to Tiling WM](#gnomekde-to-tiling-wm)
4. [X11 to Wayland Migration](#x11-to-wayland-migration)
5. [Between Tiling Window Managers](#between-tiling-window-managers)

---

## Windows to Linux Rice

### Overview

Migrating from Windows to a riced Linux setup is a significant change, but this guide makes it manageable.

### Prerequisites

**Knowledge needed:**
- Basic command line usage
- File system structure (not like Windows C:\)
- Package manager basics

**Don't worry about:**
- Advanced scripting (comes with time)
- Linux internals
- Compilation from source

### Step 1: Choose Your Distribution

**Recommended for Windows users:**

#### Pop!_OS (Easiest)
- Windows-like experience initially
- NVIDIA drivers pre-installed
- Good gaming support
- Can add tiling WM later

#### Manjaro (Good middle ground)
- User-friendly Arch
- AUR access (more software)
- Rolling release

#### Ubuntu (Most familiar)
- Largest community
- Most tutorials available
- LTS stability

**Installation:**
1. Create USB with Rufus/Ventoy on Windows
2. Boot from USB
3. Follow installer (dual boot or full install)
4. Keep Windows initially for safety

### Step 2: Get Comfortable with Linux

**First week checklist:**
- [x] Update system: `sudo apt update && sudo apt upgrade`
- [x] Install essential software
- [x] Set up file manager
- [x] Test web browser, office suite
- [x] Configure WiFi, Bluetooth

**Essential apps (Windows equivalents):**

| Windows | Linux Alternative |
|---------|------------------|
| File Explorer | Thunar, Nautilus, Dolphin |
| Paint | Krita, GIMP |
| Notepad | Gedit, VSCode |
| Task Manager | htop, btop |
| PowerShell | Bash, Zsh, Fish |
| Windows Terminal | Alacritty, Kitty, WezTerm |

### Step 3: Learn Terminal Basics

**Essential commands for Windows users:**

```bash
# Navigation (like cd, dir on Windows)
cd ~/Documents        # Change directory
ls -la               # List files (like dir /a)
pwd                  # Print working directory (like cd without args)

# File operations (like copy, move, del)
cp file.txt backup.txt    # Copy (like copy)
mv file.txt ~/Downloads/  # Move (like move)
rm file.txt              # Remove (like del)
mkdir newfolder          # Make directory (like md)

# System info (like systeminfo)
neofetch             # System information
htop                 # Task manager
df -h                # Disk space (like wmic logicaldisk)
free -h              # RAM usage

# Package management (no Windows equivalent)
sudo apt install APP      # Debian/Ubuntu
sudo pacman -S APP        # Arch/Manjaro
```

### Step 4: Install Base Tools

```bash
# Arch/Manjaro
sudo pacman -S git base-devel neofetch htop

# Ubuntu/Debian
sudo apt install git build-essential neofetch htop

# Fedora
sudo dnf install git gcc make neofetch htop
```

### Step 5: Choose and Install Window Manager

**Start with i3wm (recommended):**

```bash
# Arch/Manjaro
sudo pacman -S i3-wm i3status i3lock dmenu

# Ubuntu/Debian
sudo apt install i3 i3status i3lock dmenu

# Fedora
sudo dnf install i3 i3status i3lock dmenu
```

Log out and select "i3" from login screen.

### Step 6: Apply Configs from This Repo

```bash
# Clone this repository
cd ~
git clone https://github.com/Querulantenkind/ricing-linux.git
cd ricing-linux

# Backup existing configs
./scripts/automation/backup-configs.sh

# Copy i3 config
cp -r configs/i3/* ~/.config/i3/

# Install dependencies
./scripts/installation/install-dependencies.sh
./scripts/installation/install-i3wm.sh

# Reload i3
# Press Mod+Shift+R (usually Super+Shift+R)
```

### Step 7: Install Additional Tools

```bash
# Terminal emulator
sudo pacman -S alacritty  # or kitty

# File manager (GUI)
sudo pacman -S thunar

# Application launcher
sudo pacman -S rofi

# Status bar
sudo pacman -S polybar

# Compositor (transparency, animations)
sudo pacman -S picom

# Screenshots
sudo pacman -S maim

# System monitor
sudo pacman -S btop
```

### Common Gotchas for Windows Users

**1. No C:\ drive:**
- Everything starts at `/` (root)
- Your files are in `/home/username/` (or `~`)

**2. Case sensitivity:**
- `File.txt` ≠ `file.txt`
- Commands are case-sensitive

**3. File permissions:**
- Not everything runs by default
- Make scripts executable: `chmod +x script.sh`
- `sudo` = "Run as administrator"

**4. Package managers:**
- No downloading .exe files
- Use package manager: `sudo pacman -S APP`

**5. Configuration files:**
- Usually in `~/.config/` or home directory
- Text-based (not registry)
- Version control friendly

**6. No Windows software:**
- Most have Linux alternatives
- Some work via Wine/Proton
- Use native apps when possible

### Gaming on Linux

```bash
# Steam
sudo pacman -S steam

# Lutris (for non-Steam games)
sudo pacman -S lutris

# Wine (Windows compatibility)
sudo pacman -S wine winetricks

# GameMode (performance)
sudo pacman -S gamemode
```

**Important:** Enable Proton in Steam settings for Windows games.

### Windows Dual Boot Considerations

**Recommended partition layout:**
- EFI partition (shared)
- Linux root (`/`)
- Linux home (`/home`)
- Windows C:\
- Shared data partition (NTFS, but careful with permissions)

**Time sync issues:**
```bash
# Fix Windows/Linux time difference
timedatectl set-local-rtc 1 --adjust-system-clock
```

### Resources for Windows Migrants

- [Windows to Linux Keybindings](https://www.linux.com/training-tutorials/common-windows-linux-keyboard-shortcuts/)
- [Windows vs Linux Commands](https://www.geeksforgeeks.org/linux-vs-windows-commands/)
- r/linux4noobs subreddit

---

## macOS to Linux Rice

### Overview

macOS users often have an easier transition due to Unix foundations.

### What You Already Know

**Terminal/Shell:**
- Bash/Zsh → Same on Linux!
- Most commands identical
- Package manager concept (Homebrew → pacman/apt)

**File system:**
- Similar structure (`/home` = `/Users`)
- No `.app` bundles
- Case sensitivity (usually)

### Key Differences

| macOS | Linux |
|-------|-------|
| `/Users` | `/home` |
| Finder | Thunar/Nautilus/Dolphin |
| Spotlight | Rofi/dmenu |
| Mission Control | Workspaces (built-in WM) |
| Homebrew | pacman/apt/dnf |
| .app bundles | Package managers |
| Command+C/V | Ctrl+C/V |

### Step 1: Choose Distribution

**Recommended for macOS users:**

#### Fedora Workstation
- Modern, polished
- Similar philosophy to macOS
- Good hardware support

#### elementary OS
- Most macOS-like experience
- Familiar workflow
- Curated app store

#### Arch Linux (if adventurous)
- Complete control
- Rolling release
- AUR = largest software library

### Step 2: Install Essential Tools

```bash
# Developer tools (like Xcode)
sudo pacman -S base-devel  # Arch
sudo apt install build-essential  # Ubuntu

# Window management (like Rectangle/Magnet)
# Not needed with tiling WM - that's the point!

# Terminal (iTerm2 equivalent)
sudo pacman -S alacritty kitty

# Text editor (like VS Code - actually available!)
sudo pacman -S code

# Docker
sudo pacman -S docker docker-compose
```

### Step 3: Replicate macOS Workflow

**Keybindings translation:**

```bash
# In ~/.config/i3/config or ~/.config/hypr/hyprland.conf
# Map Super key (like Command key)

# macOS Command+Q → Mod+Shift+Q (close window)
# macOS Command+Space → Mod+D (launcher)
# macOS Command+Tab → Mod+Tab (window switching - if configured)
```

**Window snapping:**
- Tiling WM does this automatically
- No need for Rectangle/Magnet

**Multiple desktops:**
- Built into WM
- Even more powerful than Mission Control

### Step 4: Application Replacements

**Native or similar:**

| macOS App | Linux Equivalent |
|-----------|-----------------|
| Safari | Firefox, Chromium |
| Mail | Thunderbird, Evolution |
| Calendar | GNOME Calendar, Kalendar |
| Notes | Joplin, Standard Notes |
| Preview | Evince, Okular |
| TextEdit | Gedit, Kate, Vim |
| Terminal/iTerm2 | Alacritty, Kitty |
| Xcode | VSCode, CLion |
| Keynote | LibreOffice Impress |
| Pages | LibreOffice Writer |
| Numbers | LibreOffice Calc |
| Photos | Shotwell, digiKam |
| Music | Rhythmbox, Clementine |
| Time Machine | Timeshift, Déjà Dup |

### Step 5: Homebrew → Package Manager

**Command translation:**

```bash
# Homebrew → pacman (Arch)
brew install APP → sudo pacman -S APP
brew search APP → pacman -Ss APP
brew update → sudo pacman -Sy
brew upgrade → sudo pacman -Syu
brew list → pacman -Q

# Homebrew → apt (Ubuntu)
brew install APP → sudo apt install APP
brew search APP → apt search APP
brew update → sudo apt update
brew upgrade → sudo apt upgrade
brew list → apt list --installed
```

### macOS Specific Considerations

**Trackpad gestures:**
```bash
# Install libinput-gestures
yay -S libinput-gestures

# Configure gestures
~/.config/libinput-gestures.conf
```

**Display scaling (Retina):**
```bash
# Wayland (Hyprland) handles this better
# In ~/.config/hypr/hyprland.conf:
monitor=,highres,auto,2  # 2x scaling for Retina
```

**Command key muscle memory:**
- Use Karabiner-like tool: `xcape` or `xmodmap`
- Or retrain to use Ctrl (easier long-term)

### For Developers

**Development environment:**

```bash
# Languages (usually already installed)
python --version  # Python
node --version    # Node.js (install via nvm)
ruby --version    # Ruby
go version        # Go

# Version managers (just like on macOS)
# nvm for Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# pyenv for Python
curl https://pyenv.run | bash

# rbenv for Ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

**Docker:**
```bash
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
```

---

## GNOME/KDE to Tiling WM

### Overview

Transitioning from a full desktop environment to a tiling window manager.

### Why Migrate?

**Benefits:**
- Faster workflow (keyboard-driven)
- Lower resource usage
- More screen real estate
- Complete customization
- Cooler looking 😎

**Tradeoffs:**
- Steeper learning curve
- Manual configuration
- Some GUI tools not needed
- Need to learn keybindings

### Preparation (While Still on GNOME/KDE)

**1. Learn terminal:**
- Practice basic commands
- Install terminal apps
- Get comfortable without GUI

**2. Install tiling WM alongside:**
```bash
# Install i3 (keeps GNOME/KDE as fallback)
sudo pacman -S i3-wm i3status i3lock
```

**3. Backup everything:**
```bash
./scripts/automation/backup-configs.sh
```

### Migration Strategy

**Option 1: Gradual (Recommended)**
1. Install tiling WM
2. Use both for 1-2 weeks
3. Switch to tiling WM as default
4. Keep DE for emergencies
5. Remove DE after comfortable

**Option 2: Cold Turkey**
1. Backup configs
2. Install tiling WM
3. Remove DE immediately
4. Force yourself to learn

### Step-by-Step: GNOME → i3wm

**1. Install i3:**
```bash
sudo pacman -S i3-wm i3status i3lock i3blocks
```

**2. Copy configs from this repo:**
```bash
git clone https://github.com/Querulantenkind/ricing-linux.git
cd ricing-linux
cp -r configs/i3/* ~/.config/i3/
```

**3. Install replacements for GNOME components:**

| GNOME Component | i3 Replacement |
|----------------|----------------|
| GNOME Files | Thunar, Ranger |
| GNOME Terminal | Alacritty, Kitty |
| GNOME Screenshot | maim, flameshot |
| GNOME Settings | lxappearance, manual configs |
| GNOME Shell | i3wm + Polybar |
| Notifications | dunst |
| App Launcher | rofi, dmenu |
| Network Manager | nm-applet |
| Power Manager | xfce4-power-manager |

**4. Install essential tools:**
```bash
sudo pacman -S \
  polybar \           # Status bar
  rofi \             # App launcher
  dunst \            # Notifications
  picom \            # Compositor
  thunar \           # File manager
  lxappearance \     # Theme manager
  nitrogen \         # Wallpaper
  nm-applet \        # Network
  blueman \          # Bluetooth
  pavucontrol        # Audio
```

**5. Test i3:**
- Log out
- Select "i3" from login screen
- Follow first-time setup wizard

**6. Keep GNOME for backup:**
- Don't uninstall yet
- Switch back if needed
- Gradually uninstall after 1 month

### Step-by-Step: KDE → Hyprland

**1. Install Hyprland:**
```bash
sudo pacman -S hyprland waybar hyprpaper
```

**2. Keep KDE components that work on Wayland:**
- Dolphin (file manager)
- Konsole (terminal) - or switch to Kitty
- Kate (text editor)
- Gwenview (image viewer)

**3. Replace KDE-specific components:**

| KDE Component | Hyprland Replacement |
|--------------|---------------------|
| Plasma Desktop | Hyprland + Waybar |
| KRunner | Rofi (Wayland fork) |
| KDE Connect | GSConnect |
| Spectacle | grim + slurp |
| System Settings | Manual config files |

**4. Copy Hyprland configs:**
```bash
cp -r configs/hyprland/* ~/.config/hypr/
cp -r configs/waybar/* ~/.config/waybar/
```

### Common Questions

**Q: Can I keep GNOME apps?**
A: Yes! Most work fine with tiling WMs.

**Q: What about system settings?**
A: Use `lxappearance` for themes, manual files for most settings.

**Q: Will my data be affected?**
A: No, only the desktop environment changes. Files remain untouched.

**Q: Can I go back?**
A: Yes, just select GNOME/KDE from login screen.

### First Week Survival Guide

**Essential keybindings to memorize:**
- `Mod+Return` - Open terminal
- `Mod+D` - App launcher
- `Mod+Shift+Q` - Close window
- `Mod+1-9` - Switch workspace
- `Mod+Shift+R` - Reload config

**When frustrated:**
- Open terminal
- Type `xfce4-terminal` or `gnome-terminal`
- Continue learning

**Pro tips:**
- Print [keybinding cheatsheet](references/keybindings-cheatsheet.md)
- Keep browser open with documentation
- Join community for help

---

## X11 to Wayland Migration

### Overview

Moving from X11-based setup (i3wm) to Wayland (Hyprland).

### Should You Migrate?

**Stay on X11 if:**
- Using NVIDIA (older cards)
- Need screen sharing frequently
- Rely on X11-only apps
- Prefer stability over features

**Migrate to Wayland if:**
- Want better security
- Need multi-monitor with different scaling
- Want modern features (HDR, etc.)
- Have AMD/Intel GPU

### Compatibility Check

**Apps that work:**
- Most GTK3+ apps
- Most Qt5+ apps
- Firefox, Chromium
- VSCode
- Modern terminals

**Apps with issues:**
- Some screen recorders
- Older X11-only apps
- Some Java apps
- X11 clipboard managers

### Migration Steps

**1. Install Hyprland:**
```bash
sudo pacman -S hyprland xdg-desktop-portal-hyprland
```

**2. Install Wayland equivalents:**

| X11 Tool | Wayland Equivalent |
|----------|-------------------|
| i3 | Hyprland, Sway |
| Polybar | Waybar |
| rofi | rofi (lbonn fork) |
| dunst | mako, dunst |
| picom | N/A (built-in) |
| feh | swww, hyprpaper |
| scrot, maim | grim, slurp |
| xclip | wl-copy, wl-paste |
| xdotool | ydotool |
| i3lock | swaylock, hyprlock |

**3. Update clipboard commands:**
```bash
# X11 (old)
echo "text" | xclip -selection clipboard

# Wayland (new)
echo "text" | wl-copy
```

**4. Update screenshot bindings:**
```bash
# In ~/.config/hypr/hyprland.conf
bind = , Print, exec, grim
bind = SHIFT, Print, exec, grim -g "$(slurp)"
```

**5. Configure environment variables:**
```bash
# ~/.config/hypr/hyprland.conf
env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORM,wayland
env = SDL_VIDEODRIVER,wayland
env = GDK_BACKEND,wayland,x11
```

**6. Test before full switch:**
- Log in to Hyprland session
- Test critical apps
- Verify screen sharing works
- Check performance

### Screen Sharing on Wayland

**For Discord/Zoom/Teams:**
```bash
# Install pipewire and xdg-desktop-portal
sudo pacman -S pipewire wireplumber xdg-desktop-portal-hyprland

# Start pipewire
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
```

**Browser setup:**
- Firefox: Works out of box
- Chrome: Launch with `--enable-features=UseOzonePlatform --ozone-platform=wayland`

### NVIDIA Users

**Current status (2025):**
- Newer drivers (545+) have better Wayland support
- Still some issues with explicit sync
- May experience screen tearing

**Configuration:**
```bash
# ~/.config/hypr/hyprland.conf
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = WLR_NO_HARDWARE_CURSORS,1
```

### Troubleshooting

**Apps not starting:**
```bash
# Force X11 compatibility mode
GDK_BACKEND=x11 app-name
```

**Cursor invisible:**
```bash
env = WLR_NO_HARDWARE_CURSORS,1
```

**Screen tearing:**
- Usually solved on Wayland
- Check compositor settings if present

---

## Between Tiling Window Managers

### i3wm → Hyprland

**Config conversion:**

```bash
# i3 config syntax
bindsym $mod+Return exec alacritty

# Hyprland syntax
bind = SUPER, Return, exec, alacritty
```

See [Hyprland migration guide](https://wiki.hyprland.org/Configuring/Migrating-from-i3/)

### Keybinding Philosophy

**i3-style:**
- Modal: Modes for different contexts
- Vim-like: hjkl navigation
- Minimalist: Few default bindings

**Hyprland-style:**
- Direct: All actions available always
- Mouse integration: More mouse-friendly
- Feature-rich: Many default bindings

Choose based on preference. Both configs available in this repo!

---

## Final Tips for All Migrations

**1. Take your time:**
- Don't rush
- Learn gradually
- Keep fallback options

**2. Document your journey:**
- Take notes
- Save working configs
- Git commit often

**3. Join communities:**
- Ask questions
- Share progress
- Help others

**4. Have fun!**
- Ricing is a hobby
- Enjoy the process
- There's no "finished" rice

---

## Need Help?

- [FAQ](FAQ.md)
- [Troubleshooting](wiki/troubleshooting.md)
- [Community Resources](references/useful-resources.md)
- Open an issue on GitHub

**Welcome to the ricing community! 🎨**
