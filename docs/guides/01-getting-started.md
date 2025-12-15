# Getting Started with Ricing

Welcome to the world of Linux ricing! This guide will help you understand the basics and get started on your customization journey.

## What You'll Learn

In this guide, you'll learn:
- What ricing is and why people do it
- The basic components of a riced system
- How to choose between Hyprland and i3wm
- Prerequisites and preparation
- Your first steps

## Understanding Ricing

### What is Ricing?

Ricing is the art of customizing your Linux desktop environment to reflect your personal taste and optimize your workflow. The term comes from the car modification community but has been embraced by Linux enthusiasts.

**Key Aspects of Ricing:**
- Visual customization (colors, fonts, themes)
- Workflow optimization (keybindings, layouts)
- Performance tuning
- Creating a cohesive aesthetic
- Learning about your system

### Why Rice Your System?

**Productivity Benefits:**
- Custom keybindings match your workflow
- Tiling window managers maximize screen space
- Minimal distractions improve focus
- Fast, keyboard-driven navigation

**Aesthetic Benefits:**
- Create a unique, personalized environment
- Coordinate colors and themes across all applications
- Achieve minimalist or elaborate designs
- Express your creativity

**Learning Benefits:**
- Deepen understanding of Linux systems
- Learn configuration file formats
- Understand how components interact
- Develop scripting skills

**Community Benefits:**
- Share your creations with others
- Learn from community members
- Contribute to open source projects
- Get inspiration from others' work

## Components of a Riced System

A typical rice consists of several interconnected components:

### 1. Window Manager
The core component that controls window placement and behavior.

**Options in this repo:**
- **Hyprland**: Modern Wayland compositor with animations
- **i3wm**: Classic X11 tiling window manager

### 2. Status Bar
Displays system information and workspace indicators.

**Options:**
- **Waybar**: Modern bar for Wayland (Hyprland)
- **Polybar**: Highly customizable bar for X11 (i3wm)
- **i3bar**: Simple default bar for i3

### 3. Application Launcher
Quick search and launch applications.

**Options:**
- **Rofi**: Versatile launcher for X11
- **Wofi**: Wayland alternative to Rofi
- **dmenu**: Minimal launcher

### 4. Notification Daemon
Displays notification popups.

**Options:**
- **Dunst**: Lightweight notification daemon
- **Mako**: Wayland-native notification daemon

### 5. Compositor (X11 only)
Adds visual effects like transparency and shadows.

**Option:**
- **Picom**: Modern compositor for X11

### 6. Terminal Emulator
Your primary interface for command-line work.

**Options:**
- **Alacritty**: Fast, GPU-accelerated terminal
- **Kitty**: Feature-rich terminal with ligatures
- **Kitty**: Wayland-native option

### 7. Shell
Command-line interpreter.

**Options:**
- **Zsh**: Feature-rich with oh-my-zsh
- **Bash**: Default, reliable
- **Fish**: User-friendly, modern

### 8. Editor
For editing configuration files and coding.

**Options:**
- **Neovim**: Modern Vim with better defaults
- **Vim**: Classic, ubiquitous
- **Visual Studio Code**: GUI editor with extensions

### 9. Theme Components
- **GTK Theme**: Styling for GTK applications
- **Icon Theme**: Custom icons
- **Cursor Theme**: Mouse pointer appearance
- **Fonts**: Typography (monospace for terminals, sans-serif for UI)
- **Wallpaper**: Background image

## Hyprland vs i3wm: Which to Choose?

This repository supports both. Here's a quick comparison to help you decide:

### Choose Hyprland If You Want:
- Modern Wayland protocol
- Smooth animations and eye candy
- Better performance on modern hardware
- Multi-monitor setups with mixed DPI
- Future-proof choice
- Active development and new features

**Trade-offs:**
- Newer, less mature ecosystem
- Some applications may have compatibility issues
- NVIDIA support improving but not perfect
- Less documentation available

### Choose i3wm If You Want:
- Proven stability and reliability
- Maximum compatibility with all applications
- Extensive documentation and community support
- Lower resource usage
- Predictable, no-surprises behavior
- Better for older hardware

**Trade-offs:**
- No built-in animations
- X11 protocol showing age
- Requires separate compositor
- Less active development (mature project)

### Can I Use Both?
Absolutely! Many users install both and switch between them. You can:
- Have both installed simultaneously
- Select at login which to use
- Test each to see which you prefer
- Use i3 for work (stability) and Hyprland for personal use (aesthetics)

## Prerequisites

### Hardware Requirements

**Minimum for i3wm:**
- 2GB RAM
- Dual-core CPU
- Any GPU with basic 2D acceleration
- Works on older hardware

**Minimum for Hyprland:**
- 4GB RAM
- Quad-core CPU
- Modern GPU (Vulkan support recommended)
- Better on newer hardware (2020+)

**Recommended for Both:**
- 8GB+ RAM
- Modern multi-core CPU
- Dedicated GPU (AMD or Intel for Hyprland)
- SSD for fast loading

### Software Prerequisites

**Base System:**
- Arch Linux (or Arch-based distribution)
- Working internet connection
- Basic terminal knowledge
- Text editor (nano, vim, or other)

**Basic Skills:**
- Using the terminal
- Editing text files
- Basic Linux commands (cd, ls, mkdir, cp, mv)
- Installing packages with pacman/yay

**Optional but Helpful:**
- Understanding of shell scripting
- Experience with git
- Familiarity with systemd
- Basic programming concepts

## Preparation Steps

### 1. Backup Your System

Before making changes, create backups:

```bash
# Backup existing configs
mkdir -p ~/backups/configs-$(date +%Y%m%d)
cp -r ~/.config ~/backups/configs-$(date +%Y%m%d)/

# Create a system snapshot (if using Btrfs/LVM)
# Or use timeshift for automatic backups
```

### 2. Update Your System

Ensure everything is up to date:

```bash
sudo pacman -Syu
```

### 3. Install Essential Tools

```bash
# Basic tools
sudo pacman -S git base-devel

# AUR helper (yay)
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### 4. Choose Your Path

Decide whether to start with Hyprland or i3wm:

```bash
# Clone this repository
cd ~/Documents
git clone https://github.com/Querulantenkind/ricing-linux.git
cd ricing-linux

# For i3wm installation
./scripts/installation/install-i3wm.sh

# For Hyprland installation
./scripts/installation/install-hyprland.sh
```

## First Steps After Installation

### 1. Learn the Basics

**Essential Keybindings:**

For i3wm (default Mod = Super/Windows key):
- `Mod + Enter`: Open terminal
- `Mod + d`: Application launcher
- `Mod + Shift + q`: Close window
- `Mod + 1-9`: Switch workspace
- `Mod + Shift + c`: Reload config
- `Mod + Shift + r`: Restart i3

For Hyprland:
- `Super + Q`: Open terminal
- `Super + R`: Application launcher
- `Super + C`: Close window
- `Super + 1-9`: Switch workspace
- `Super + M`: Exit Hyprland

### 2. Customize Your Config

Start with small changes:

```bash
# Open config file
# For i3:
nano ~/.config/i3/config

# For Hyprland:
nano ~/.config/hypr/hyprland.conf

# Make a simple change (e.g., wallpaper or colors)
# Save and reload
```

### 3. Explore Themes

Try different color schemes:

```bash
cd ~/Documents/ricing-linux/themes
./apply-theme.sh catppuccin
```

### 4. Set Up Your Workflow

Configure applications you use daily:
- Set browser as default
- Configure terminal colors
- Set up your text editor
- Install productivity apps

### 5. Join the Community

- Browse r/unixporn for inspiration
- Share your progress
- Ask questions on forums
- Contribute improvements back

## Learning Resources

### Official Documentation
- **i3 User Guide**: https://i3wm.org/docs/userguide.html
- **Hyprland Wiki**: https://wiki.hyprland.org
- **Arch Wiki**: Comprehensive Linux documentation

### This Repository
- Check `docs/guides/` for detailed tutorials
- See `docs/wiki/` for in-depth explanations
- Browse `themes/` for examples
- Study `configs/` to understand configuration

### Community Resources
- r/unixporn - Show and tell
- r/archlinux - Distribution help
- GitHub Discussions - This repo's community
- YouTube - Video tutorials
- Discord servers - Real-time chat

## Common Beginner Questions

### Q: Will I break my system?
**A:** Unlikely. Window managers don't modify system files. You can always switch back to your display manager and use a different desktop environment.

### Q: How long does it take to set up?
**A:** Basic setup: 1-2 hours. Personalized rice: Ongoing process. Many users continually refine their setup.

### Q: Do I need to know programming?
**A:** No, but basic scripting helps. You can start with copying and modifying existing configs.

### Q: Can I use my regular applications?
**A:** Yes! All your applications work the same. The window manager just controls how windows are arranged.

### Q: What if I don't like it?
**A:** You can always switch back. Multiple window managers can coexist. Choose at login.

## Next Steps

Once comfortable with the basics:

1. Read [Understanding Tiling WMs](02-understanding-tiling-wms.md)
2. Follow the specific guide:
   - [Hyprland Basics](03-hyprland-basics.md)
   - [i3wm Basics](04-i3wm-basics.md)
3. Learn about [Customizing Appearance](05-customizing-appearance.md)
4. Master [Keybindings](06-keybindings-explained.md)
5. Explore [Scripting & Automation](07-scripting-automation.md)

## Conclusion

Ricing is a journey, not a destination. Start simple, make incremental changes, and enjoy the process of creating a system that's truly yours. Don't be intimidated by complex setups you see online - everyone started as a beginner.

The most important rule: Have fun and make your system work for you!

Welcome to the ricing community!