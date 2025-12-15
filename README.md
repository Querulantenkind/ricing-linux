# Hyprland & i3wm Rice Collection

> A comprehensive guide, configuration repository, and knowledge base for ricing Hyprland and i3wm on Arch Linux

[![Arch Linux](https://img.shields.io/badge/Arch-Linux-1793D1?style=flat&logo=arch-linux)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-58E1FF?style=flat)](https://hyprland.org/)
[![i3wm](https://img.shields.io/badge/i3wm-X11-E94560?style=flat)](https://i3wm.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## Table of Contents

- [What is Ricing?](#what-is-ricing)
- [Repository Overview](#repository-overview)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Quick Start](#quick-start)
- [Supported Components](#supported-components)
- [Before & After](#before--after)
- [Documentation](#documentation)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Credits & Inspiration](#credits--inspiration)
- [License](#license)

---

## What is Ricing?

**Ricing** refers to the process of customizing and beautifying your Linux desktop environment to match your personal aesthetic and workflow preferences. The term comes from the car modding community and has been adopted by the Linux community to describe the art of making your system uniquely yours.

### Why Rice Your System?

- **Productivity**: Optimize your workflow with custom keybindings and scripts
- **Aesthetics**: Create a visually pleasing environment that inspires you
- **Learning**: Deepen your understanding of Linux systems and configuration
- **Community**: Share your creations and learn from others
- **Minimalism**: Strip away unnecessary bloat and keep only what you need

This repository focuses on two popular tiling window managers:
- **Hyprland**: A modern, dynamic Wayland compositor with eye-candy animations
- **i3wm**: A tried-and-true X11 window manager known for stability and simplicity

---

## Repository Overview

This repository serves multiple purposes:

1. **Configuration Archive**: Fully working dotfiles for Hyprland and i3wm setups
2. **Educational Resource**: Detailed guides explaining each component and configuration choice
3. **Theme Collection**: Multiple complete themes ready to use
4. **Knowledge Base**: Comprehensive wiki covering common issues, tips, and advanced topics
5. **Script Library**: Automation and utility scripts for installation and maintenance

Whether you're a complete beginner looking to try tiling window managers for the first time, or an experienced user seeking inspiration and modular configurations, this repository aims to provide value at every level.

---

## Features

### General
- 🎨 **8 Complete Theme Presets** with ready-to-use config snippets (Catppuccin, Nord, Dracula, Gruvbox, Tokyo Night, Rosé Pine, Everforest, Solarized) - See [Theme Gallery](themes/README.md)
- 📦 Modular configuration structure - use only what you need
- 📝 Copy-paste snippets for manual theme application (recommended for learning)
- 📸 Extensive before/after screenshots and comparisons
- 📚 Detailed documentation for every component
- 🚀 Quick installation scripts with dependency management
- 🔧 Troubleshooting guides and common fixes
- 💡 Performance optimization tips

### Hyprland-Specific
- 🌊 Smooth animations and transitions
- 🎯 Optimized for Wayland protocols
- 🖥️ Multi-monitor configurations
- ⚡ GPU acceleration settings
- 🎮 Gaming-friendly configurations

### i3wm-Specific
- 🪟 Classic X11 stability
- 🔌 Extensive compatibility with older systems
- ⚙️ Lightweight and resource-efficient
- 🎯 Predictable behavior and debugging

### Shared Features
- 🎹 Optimized keybindings with mnemonic logic
- 🔔 Beautiful notification system
- 🚀 Application launcher with custom themes
- 📊 System monitoring and status bars
- 🖼️ Curated wallpaper collection
- 🔊 Audio and brightness controls
- 🌐 Network management integration
- 🔋 Battery and power management
- 📋 Clipboard management

---

## Repository Structure

```
.
├── configs/                    # All configuration files
│   ├── hyprland/              # Hyprland-specific configs
│   │   ├── hyprland.conf      # Main Hyprland configuration
│   │   ├── hypridle.conf      # Idle management
│   │   ├── hyprlock.conf      # Lock screen configuration
│   │   └── hyprpaper.conf     # Wallpaper management
│   ├── i3wm/                  # i3wm-specific configs
│   │   ├── config             # Main i3 configuration
│   │   ├── i3status.conf      # Status bar configuration
│   │   └── i3lock-config      # Lock screen settings
│   ├── waybar/                # Status bar for Wayland (Hyprland)
│   │   ├── config.jsonc       # Waybar configuration
│   │   └── style.css          # Waybar styling
│   ├── polybar/               # Status bar for X11 (i3wm)
│   │   ├── config.ini         # Polybar configuration
│   │   └── launch.sh          # Polybar launch script
│   ├── rofi/                  # Application launcher
│   │   ├── config.rasi        # Rofi configuration
│   │   └── themes/            # Custom Rofi themes
│   ├── kitty/                 # Terminal emulator
│   │   ├── kitty.conf         # Kitty configuration
│   │   └── themes/            # Color schemes
│   ├── alacritty/             # Alternative terminal
│   │   └── alacritty.yml      # Alacritty configuration
│   ├── dunst/                 # Notification daemon
│   │   └── dunstrc            # Dunst configuration
│   ├── picom/                 # Compositor for X11
│   │   └── picom.conf         # Picom configuration
│   ├── gtk/                   # GTK theme settings
│   │   ├── gtk-3.0/
│   │   └── gtk-4.0/
│   ├── fish/                  # Fish shell configuration
│   │   └── config.fish
│   ├── zsh/                   # Zsh shell configuration
│   │   └── .zshrc
│   ├── nvim/                  # Neovim configuration
│   │   └── init.lua
│   └── README.md              # Overview of all configs
│
├── themes/                    # Theme gallery & inspiration (8 themes)
│   ├── README.md              # Theme gallery overview
│   ├── example-theme-automation.sh  # Optional automation example
│   ├── catppuccin/            # Modern pastel theme
│   │   ├── README.md          # Full theme documentation
│   │   ├── colors.conf        # Color definitions
│   │   ├── snippets/          # Ready-to-use config snippets
│   │   │   ├── alacritty.yml
│   │   │   ├── kitty.conf
│   │   │   ├── rofi.rasi
│   │   │   ├── waybar-style.css
│   │   │   ├── polybar-colors.ini
│   │   │   ├── i3-colors.conf
│   │   │   ├── hyprland-colors.conf
│   │   │   └── dunst-colors.conf
│   │   └── wallpapers/        # Theme wallpapers
│   ├── nord/                  # Arctic professional theme
│   ├── dracula/               # Vibrant high-contrast theme
│   ├── gruvbox/               # Retro warm earthy theme
│   ├── tokyo-night/           # Modern Tokyo-inspired theme
│   ├── rose-pine/             # Low-contrast muted theme
│   ├── everforest/            # Nature-inspired green theme
│   └── solarized/             # Scientifically designed theme
│   ├── catppuccin/            # Catppuccin theme
│   ├── gruvbox/               # Gruvbox theme
│   ├── tokyo-night/           # Tokyo Night theme
│   └── apply-theme.sh         # Theme application script
│
├── scripts/                   # Utility and automation scripts
│   ├── installation/          # Installation scripts
│   │   ├── install-hyprland.sh
│   │   ├── install-i3wm.sh
│   │   ├── install-dependencies.sh
│   │   └── README.md
│   ├── utilities/             # Helper scripts
│   │   ├── screenshot.sh      # Screenshot tool
│   │   ├── screen-record.sh   # Screen recording
│   │   ├── audio-control.sh   # Audio management
│   │   ├── brightness.sh      # Brightness control
│   │   └── power-menu.sh      # Power options
│   ├── automation/            # Workflow automation
│   │   ├── backup-configs.sh  # Configuration backup
│   │   ├── update-system.sh   # System update helper
│   │   └── rice-switcher.sh   # Quick setup switcher
│   └── README.md              # Scripts documentation
│
├── assets/                    # Media and resources
│   ├── wallpapers/            # Wallpaper collection
│   │   ├── abstract/
│   │   ├── minimal/
│   │   ├── nature/
│   │   └── cyberpunk/
│   ├── fonts/                 # Font collection
│   │   ├── JetBrainsMono/
│   │   ├── FiraCode/
│   │   └── README.md          # Font installation guide
│   ├── screenshots/           # Before/after screenshots
│   │   ├── hyprland/
│   │   ├── i3wm/
│   │   └── comparisons/
│   └── icons/                 # Icon themes
│
├── docs/                      # Documentation
│   ├── guides/                # Step-by-step guides
│   │   ├── 01-getting-started.md
│   │   ├── 02-understanding-tiling-wms.md
│   │   ├── 03-hyprland-basics.md
│   │   ├── 04-i3wm-basics.md
│   │   ├── 05-customizing-appearance.md
│   │   ├── 06-keybindings-explained.md
│   │   ├── 07-scripting-automation.md
│   │   └── 08-advanced-configurations.md
│   ├── wiki/                  # Comprehensive wiki
│   │   ├── terminology.md     # Common terms explained
│   │   ├── architecture.md    # How components work together
│   │   ├── wayland-vs-x11.md  # Protocol comparison
│   │   ├── performance.md     # Optimization techniques
│   │   └── troubleshooting.md # Common issues and fixes
│   ├── comparisons/           # Feature and config comparisons
│   │   ├── hyprland-vs-i3wm.md
│   │   ├── terminal-emulators.md
│   │   ├── status-bars.md
│   │   └── launchers.md
│   └── references/            # Technical references
│       ├── keybindings-cheatsheet.md
│       ├── color-schemes.md
│       └── useful-resources.md
│
├── .github/                   # GitHub specific files
│   ├── workflows/             # CI/CD workflows
│   └── ISSUE_TEMPLATE/        # Issue templates
│
├── README.md                  # This file
├── LICENSE                    # Repository license
├── CONTRIBUTING.md            # Contribution guidelines
└── CHANGELOG.md               # Version history

```

---

## Quick Start

### For Complete Beginners

If you're new to tiling window managers, start here:

1. **Read the Documentation**
   ```bash
   # Check out the getting started guide
   docs/guides/01-getting-started.md
   ```

2. **Choose Your Window Manager**
   - **Hyprland**: Modern, eye-candy, Wayland-based (recommended for newer hardware)
   - **i3wm**: Stable, lightweight, X11-based (recommended for older hardware or compatibility)

3. **Install Dependencies**
   ```bash
   # Run the dependency installation script
   ./scripts/installation/install-dependencies.sh
   ```

4. **Install Your Chosen WM**
   ```bash
   # For Hyprland
   ./scripts/installation/install-hyprland.sh
   
   # OR for i3wm
   ./scripts/installation/install-i3wm.sh
   ```

5. **Apply a Theme**
   ```bash
   # Apply the Nord theme (or any other theme)
   cd themes
   ./apply-theme.sh nord
   ```

6. **Log Out and Select Your WM**
   - Log out from your current session
   - Select Hyprland or i3 from your display manager
   - Log in and enjoy your new setup

### For Experienced Users

```bash
# Clone the repository
git clone https://github.com/yourusername/hyprland-i3wm-rice.git
cd hyprland-i3wm-rice

# Backup your current configs
./scripts/automation/backup-configs.sh

# Symlink desired configs
ln -sf $(pwd)/configs/hyprland ~/.config/hypr
ln -sf $(pwd)/configs/waybar ~/.config/waybar
# ... repeat for other components

# Install fonts
cp -r assets/fonts/* ~/.local/share/fonts/
fc-cache -fv

# Apply theme
./themes/apply-theme.sh <theme-name>
```

---

## Supported Components

### Window Managers
- **Hyprland** (Wayland compositor)
- **i3wm** (X11 window manager)

### Status Bars
- **Waybar** (for Hyprland)
- **Polybar** (for i3wm)
- i3status (basic alternative)

### Application Launchers
- **Rofi** (primary launcher)
- wofi (Wayland alternative)
- dmenu (minimal alternative)

### Terminal Emulators
- **Kitty** (GPU-accelerated, primary)
- **Alacritty** (GPU-accelerated, alternative)
- foot (Wayland-native option)

### Notification Daemons
- **Dunst** (for X11)
- **Mako** (for Wayland)

### Compositors (X11 only)
- **Picom** (smooth effects and transparency)

### Lock Screens
- **Hyprlock** (for Hyprland)
- **i3lock** (for i3wm)
- swaylock (alternative for Wayland)

### File Managers
- **Thunar** (GUI)
- **ranger** (CLI)
- nnn (minimal CLI)

### System Monitors
- **btop** (resource monitor)
- **nvtop** (GPU monitor)

### Shells
- **Fish** (friendly interactive shell)
- **Zsh** (powerful with oh-my-zsh)
- Bash (default fallback)

### Text Editors
- **Neovim** (modal editor)
- VS Code (GUI option)

---

## Before & After

### Hyprland Transformation

**Before (Default Hyprland)**
```
├─ Basic window borders
├─ No custom colors or themes
├─ Default terminal appearance
├─ No status bar customization
└─ Standard animations
```

**After (Custom Rice)**
```
├─ Beautiful custom borders with gradients
├─ Cohesive color scheme across all applications
├─ Styled terminal with custom prompt and colors
├─ Feature-rich Waybar with system information
├─ Smooth, optimized animations
├─ Custom gaps and padding
├─ Themed notifications
└─ Wallpaper integration
```

### i3wm Transformation

**Before (Default i3wm)**
```
├─ Plain window borders
├─ Basic status bar
├─ No compositor effects
├─ Default terminal
└─ Minimal aesthetics
```

**After (Custom Rice)**
```
├─ Custom colored borders
├─ Beautiful Polybar with modules
├─ Picom for transparency and shadows
├─ Themed terminal with custom colors
├─ Coordinated color scheme
├─ Custom rofi launcher
├─ Dunst notifications with styling
└─ Integrated wallpaper
```

See `/assets/screenshots/` for visual comparisons.

---

## Documentation

The repository includes extensive documentation for all skill levels:

### Guides (Step-by-Step)
1. **Getting Started**: Installation and first steps
2. **Understanding Tiling WMs**: Core concepts and philosophy
3. **Hyprland Basics**: Essential Hyprland configuration
4. **i3wm Basics**: Essential i3 configuration
5. **Customizing Appearance**: Colors, fonts, and themes
6. **Keybindings Explained**: Understanding and customizing shortcuts
7. **Scripting & Automation**: Enhancing your workflow
8. **Advanced Configurations**: Power user features

### Wiki (Knowledge Base)
- **Terminology**: Explanation of common terms (compositor, WM, DE, etc.)
- **Architecture**: How different components interact
- **Wayland vs X11**: Technical comparison and choosing between them
- **Performance**: Optimization techniques and benchmarks
- **Troubleshooting**: Common issues and their solutions

### Comparisons
- Hyprland vs i3wm feature comparison
- Terminal emulator comparisons
- Status bar options
- Launcher alternatives

### References
- Complete keybindings cheatsheet
- Color scheme gallery with 8 complete themes
- Theme gallery with ready-to-use snippets - [themes/README.md](themes/README.md)
- Useful external resources and links

---

## Prerequisites

### System Requirements

**Minimum for i3wm:**
- Arch Linux (or Arch-based distribution)
- 2GB RAM
- Any GPU with basic X11 support

**Minimum for Hyprland:**
- Arch Linux (or Arch-based distribution)
- 4GB RAM
- GPU with Vulkan support
- Modern CPU (2015 or newer recommended)

### Required Knowledge

**Beginner Level:**
- Basic terminal usage (cd, ls, cp, mv)
- Text editor basics (nano, vim, or any editor)
- How to install packages with pacman

**Intermediate Level:**
- Understanding of Linux file system structure
- Basic shell scripting
- Comfortable editing configuration files

**Advanced Level:**
- Custom scripting and automation
- Building from source (optional)
- System debugging

---

## Installation

### 1. Install Base System

Ensure you have a working Arch Linux installation with a display manager (SDDM, LightDM, or GDM recommended).

### 2. Clone This Repository

```bash
cd ~
git clone https://github.com/yourusername/hyprland-i3wm-rice.git
cd hyprland-i3wm-rice
```

### 3. Install Dependencies

The installation script will install all necessary packages:

```bash
chmod +x scripts/installation/install-dependencies.sh
./scripts/installation/install-dependencies.sh
```

This installs:
- Window manager of choice
- Terminal emulators
- Status bars
- Launchers
- Notification daemons
- Utilities and tools

### 4. Backup Existing Configurations

**Important**: Always backup before installing:

```bash
./scripts/automation/backup-configs.sh
```

Your backups will be stored in `~/config-backups/` with timestamps.

### 5. Install Window Manager

**For Hyprland:**
```bash
./scripts/installation/install-hyprland.sh
```

**For i3wm:**
```bash
./scripts/installation/install-i3wm.sh
```

### 6. Install Configurations

The installation scripts will guide you through:
- Symlinking configuration files
- Installing fonts
- Setting up themes
- Configuring startup applications

### 7. Log In

- Log out from your current session
- Select your installed window manager from the display manager
- Log in with your credentials
- Enjoy your new rice

---

## Customization

### Changing Themes

```bash
cd themes
./apply-theme.sh <theme-name>

# Available themes:
# - nord
# - dracula
# - catppuccin
# - gruvbox
# - tokyo-night
```

The theme switcher will:
- Update all application color schemes
- Change wallpapers
- Reload configurations
- Update terminal themes
- Modify status bar colors

### Modifying Keybindings

Edit the respective configuration file:
- **Hyprland**: `configs/hyprland/hyprland.conf`
- **i3wm**: `configs/i3wm/config`

Refer to `docs/guides/06-keybindings-explained.md` for detailed documentation.

### Adding Custom Scripts

1. Place your script in `scripts/utilities/`
2. Make it executable: `chmod +x script-name.sh`
3. Bind it to a keybinding in your WM config
4. Document it in the scripts README

### Switching Between WMs

You can have both Hyprland and i3wm installed simultaneously:

```bash
# Switch to Hyprland configs
./scripts/automation/rice-switcher.sh hyprland

# Switch to i3wm configs
./scripts/automation/rice-switcher.sh i3wm
```

Then select the desired WM from your display manager.

---

## Troubleshooting

### Common Issues

**Hyprland won't start:**
- Check GPU drivers: `lspci -v | grep -A1 VGA`
- Verify Vulkan support: `vulkaninfo`
- Check logs: `~/.local/share/hyprland/hyprland.log`

**i3wm has no status bar:**
- Ensure i3status or Polybar is installed
- Check bar configuration in i3 config
- Restart i3: `$mod+Shift+r`

**Fonts not displaying correctly:**
```bash
# Reinstall fonts
fc-cache -fv
# Check installed fonts
fc-list
```

**Theme not applying:**
- Copy theme snippets manually from `themes/<theme>/snippets/`
- Check each theme's README for specific instructions
- Ensure config file paths are correct
- Reload your WM configuration
- Check file permissions

**Keybindings not working:**
- Verify your keyboard layout in the config
- Check for conflicting keybindings
- Review the keybindings documentation

For more detailed troubleshooting, see `docs/wiki/troubleshooting.md`.

---

## Contributing

Contributions are welcome! Whether you're fixing bugs, adding features, or improving documentation:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

See `CONTRIBUTING.md` for detailed guidelines.

### Areas for Contribution

- Additional themes
- New utility scripts
- Documentation improvements
- Translations
- Bug fixes
- Feature requests

---

## Credits & Inspiration

This rice collection was inspired by and builds upon the work of many talented community members:

- [r/unixporn](https://reddit.com/r/unixporn) - The ricing community
- [Hyprland](https://hyprland.org/) - The amazing Wayland compositor
- [i3wm](https://i3wm.org/) - The classic tiling window manager
- [Arch Wiki](https://wiki.archlinux.org/) - Comprehensive Linux documentation
- Various dotfiles repositories on GitHub

### Special Thanks
- All contributors to this repository
- The Arch Linux community
- The developers of all included tools and applications

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Component Licenses

Please note that individual components and applications have their own licenses:
- Hyprland: BSD 3-Clause License
- i3wm: BSD License
- Other components retain their respective licenses

This repository's configurations and scripts are provided under MIT License.

---

## Support

- **Issues**: Use GitHub Issues for bug reports and feature requests
- **Discussions**: Use GitHub Discussions for questions and community chat
- **Wiki**: Check the docs folder for comprehensive documentation
- **Community**: Join the ricing community on Reddit and Discord

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history and updates.

---

## Roadmap

- [ ] Additional theme presets
- [ ] Video tutorials for installation
- [ ] Automated testing scripts
- [ ] GNOME/KDE integration guides
- [ ] Multi-monitor configuration templates
- [ ] Gaming-optimized configurations
- [ ] Development environment setups

---

**Happy Ricing!** 🎨

Remember: Ricing is a journey, not a destination. Take your time, experiment, and make your system truly yours.

*"The best rice is the one that makes you happy to use your computer."*
