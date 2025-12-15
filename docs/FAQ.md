# Frequently Asked Questions (FAQ)

Common questions about Linux ricing, window managers, and this repository.

## Table of Contents

- [Getting Started](#getting-started)
- [Window Managers](#window-managers)
- [Themes & Appearance](#themes--appearance)
- [Configuration](#configuration)
- [Performance](#performance)
- [Troubleshooting](#troubleshooting)
- [Community & Contribution](#community--contribution)

---

## Getting Started

### What is "ricing"?

"Ricing" refers to customizing your Linux desktop environment to make it look unique and aesthetically pleasing. The term originated from car enthusiasts who would customize Japanese import cars ("rice burners"). In the Linux community, it means customizing your desktop with themes, window managers, status bars, and other visual elements.

### Do I need to be a programmer to rice my Linux system?

No! While basic command-line knowledge helps, you don't need to be a programmer. This repository provides ready-to-use configurations that you can apply directly. Learning happens gradually as you customize.

### Which Linux distribution should I use for ricing?

**Best for beginners:**
- **Arch Linux** (or Manjaro/EndeavourOS): Most ricing resources target Arch
- **Ubuntu/Pop!_OS**: Large community, lots of documentation
- **Fedora**: Stable with modern packages

**Advanced:**
- **NixOS**: Reproducible configurations
- **Gentoo**: Ultimate customization
- **Void Linux**: Minimalist approach

Most ricing guides (including this repo) work on any distribution with some adjustments.

### Should I start with Hyprland or i3wm?

**Start with i3wm if:**
- You're new to tiling window managers
- You prefer stability and maturity
- You want X11 compatibility
- You have older hardware

**Choose Hyprland if:**
- You want modern Wayland features
- You like animations and eye candy
- You have newer hardware (good GPU)
- You're comfortable with bleeding-edge software

Both are excellent choices. This repository supports both!

### How long does it take to set up a rice?

**Quick setup:** 1-2 hours (using configs from this repo)
**Custom rice:** Days to weeks (learning and tweaking)
**Perfect rice:** Never finished! Ricing is an ongoing journey.

### Can I rice on a laptop?

Absolutely! Tiling window managers are actually great for laptops due to efficient keyboard navigation. Pay attention to:
- Battery life (some compositors use more power)
- Brightness control scripts
- Power management
- WiFi/Bluetooth system tray applets

### Will ricing break my system?

No, ricing is generally safe. However:
- ✅ Always backup your configs first
- ✅ Test configs in a VM before applying
- ✅ Read scripts before running them
- ✅ Keep a working window manager as fallback

You can always switch back to GNOME/KDE/XFCE.

---

## Window Managers

### What's the difference between a window manager and desktop environment?

**Desktop Environment (DE):**
- Complete package (WM + apps + settings)
- Examples: GNOME, KDE Plasma, XFCE
- Heavy, but user-friendly

**Window Manager (WM):**
- Only manages windows
- Examples: i3, Hyprland, bspwm, AwesomeWM
- Lightweight, requires manual setup
- More customizable

When ricing, most people use standalone window managers.

### Tiling vs Floating vs Dynamic WMs?

**Tiling WM (i3, Hyprland):**
- Windows automatically tile
- Keyboard-driven
- No overlapping windows

**Floating WM (Openbox, Fluxbox):**
- Traditional drag-and-drop windows
- Mouse-driven

**Dynamic WM (dwm, AwesomeWM):**
- Switch between tiling and floating
- Most flexible but steeper learning curve

### Can I use multiple window managers?

Yes! You can have i3, Hyprland, GNOME, and KDE installed simultaneously. Choose which to start at login via your display manager (GDM, SDDM, LightDM).

### Do I need to learn a new window manager from scratch?

Not entirely. Concepts transfer between WMs:
- Workspaces/desktops
- Keybindings
- Configuration files
- Status bars

Learning your second WM is much easier than the first.

### Wayland or X11?

**X11:**
- ✅ Mature, stable
- ✅ More compatible (older apps, screen sharing)
- ✅ Easier to configure
- ❌ Security issues
- ❌ No modern features (HDR, per-monitor scaling)

**Wayland:**
- ✅ Modern, secure
- ✅ Better performance on modern hardware
- ✅ Proper multi-monitor support
- ❌ Some compatibility issues
- ❌ Screen sharing needs setup

**Recommendation:** Start with X11 (i3wm), move to Wayland (Hyprland) later.

---

## Themes & Appearance

### Which theme should I use?

Popular choices in this repo:
- **Catppuccin** - Modern, pastel, excellent contrast
- **Nord** - Cool, bluish, professional
- **Gruvbox** - Warm, retro, easy on eyes
- **Tokyo Night** - Dark, vibrant, cyberpunk-ish
- **Dracula** - Dark, purple accent, high contrast

Choose based on:
- Your preferred color temperature (warm vs cool)
- Time of day you work
- Personal aesthetic preference

Try the `rice-switcher.sh` script to test themes quickly!

### Can I use different themes for different applications?

Yes! You can mix:
- Terminal: Tokyo Night
- Editor: Catppuccin
- WM: Nord

However, consistency usually looks better. This repo provides coordinated themes.

### How do I make my terminal transparent?

**Alacritty** (`~/.config/alacritty/alacritty.yml`):
```yaml
window:
  opacity: 0.9
```

**Kitty** (`~/.config/kitty/kitty.conf`):
```conf
background_opacity 0.9
```

Requires a compositor (Picom for X11, built-in for Hyprland).

### My colors look different in screenshots. Why?

Common causes:
- Different compositor settings
- Screenshot color space conversion
- Monitor calibration
- Terminal emulator differences
- Font rendering

For accurate colors, share your actual config files.

### Do I need Nerd Fonts?

**For basic functionality:** No
**For icons in terminal/status bars:** Yes

Nerd Fonts patch popular fonts with thousands of icons. Essential for:
- Polybar/Waybar icons
- Powerline prompts
- File manager icons in terminal

Install: `sudo pacman -S ttf-jetbrains-mono-nerd`

---

## Configuration

### Where should I store my dotfiles?

**Recommended structure:**
```
~/dotfiles/
├── .config/
│   ├── alacritty/
│   ├── i3/
│   ├── hypr/
│   └── ...
├── install.sh
└── README.md
```

Use a Git repository and symlinks. See [Best Practices](guides/07-scripting-automation.md).

### How do I backup my configs?

Use the included script:
```bash
./scripts/automation/backup-configs.sh -c
```

Or manually:
```bash
tar -czf ~/rice-backup-$(date +%F).tar.gz ~/.config
```

**Pro tip:** Use Git for version control!

### Can I use configs from this repo directly?

Yes, but:
1. Review configs first (security)
2. Backup your existing configs
3. Adjust paths/usernames if needed
4. Test in a VM first

Configs are meant as starting points, not final solutions.

### How do I apply a theme from this repo?

**Method 1: Manual**
- Copy theme snippets from `themes/THEME/snippets/`
- Paste into your config files

**Method 2: Script**
```bash
./scripts/automation/rice-switcher.sh catppuccin
```

**Method 3: Fresh install**
- Copy entire config directory
- Reload window manager

### Why doesn't my config work after copying?

Common issues:
- **Paths:** Adjust `$HOME`, user-specific paths
- **Dependencies:** Install required packages
- **Permissions:** Make scripts executable (`chmod +x`)
- **Syntax:** Check for typos, especially in shell scripts
- **Application versions:** Some configs need specific versions

Check logs: `~/.xsession-errors` or `journalctl --user`

---

## Performance

### Will a tiling WM make my system faster?

**RAM usage comparison:**
- GNOME: ~800-1200 MB idle
- KDE Plasma: ~600-900 MB idle
- i3wm: ~150-300 MB idle
- Hyprland: ~200-400 MB idle

**But:** Modern systems have plenty of RAM. Choose based on:
- Workflow efficiency (keyboard vs mouse)
- Customization needs
- Visual preferences

Tiling WMs are faster to use, not necessarily to run.

### Does Hyprland use more resources than i3?

Yes, slightly:
- Hyprland: Modern compositor, animations, Wayland
- i3: Minimal, X11, no animations

**Typical difference:** 50-150 MB RAM, 1-5% CPU with animations

On modern hardware (2015+), both run smoothly.

### How do I optimize battery life on a laptop?

1. **Reduce compositor effects:**
   - Disable animations
   - Lower refresh rate
   - Reduce blur/shadows

2. **Use power management:**
   ```bash
   sudo pacman -S tlp powertop
   sudo systemctl enable tlp
   ```

3. **Adjust screen settings:**
   - Lower brightness
   - Shorter screen timeout

4. **Close unnecessary services:**
   ```bash
   systemctl --user disable unwanted.service
   ```

See [Performance Guide](wiki/performance.md)

---

## Troubleshooting

### My window manager won't start!

**Debug steps:**
1. Check logs:
   ```bash
   cat ~/.xsession-errors  # X11
   journalctl --user -xe   # Wayland
   ```

2. Test config syntax:
   ```bash
   i3 -C  # i3wm config check
   hyprctl reload  # Hyprland
   ```

3. Start with default config:
   ```bash
   mv ~/.config/i3/config ~/.config/i3/config.backup
   i3-config-wizard
   ```

4. Check for missing dependencies

### Fonts/icons not displaying correctly

**Missing Nerd Fonts:**
```bash
sudo pacman -S ttf-jetbrains-mono-nerd ttf-font-awesome
fc-cache -fv
```

**Wrong font in config:**
- Check font family name: `fc-list | grep -i jetbrains`
- Use exact name in config

**Terminal encoding:**
```bash
# Add to ~/.zshrc or ~/.bashrc
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
```

### Keybindings not working

1. **Check for conflicts:**
   - System shortcuts
   - Desktop environment overrides
   - Application-specific bindings

2. **Verify Mod key:**
   - Usually Super/Windows key
   - Test: `xmodmap` (X11) or `wev` (Wayland)

3. **Reload config:**
   - i3: `Mod+Shift+R`
   - Hyprland: `hyprctl reload`

### Screen tearing / Artifacts

**X11 (use Picom):**
```bash
# Install
sudo pacman -S picom

# Start
picom --config ~/.config/picom/picom.conf &
```

**Wayland:** Built-in, usually no tearing

### Audio/Brightness keys not working

Use the utility scripts:
```bash
# In your WM config:
bindsym XF86AudioRaiseVolume exec ~/scripts/utilities/audio-control.sh up 5
bindsym XF86MonBrightnessUp exec ~/scripts/utilities/brightness.sh up 5
```

See [Utility Scripts](../scripts/utilities/)

### Application X doesn't follow my theme

**GTK apps:**
```bash
lxappearance  # GUI tool
# or manually edit ~/.config/gtk-3.0/settings.ini
```

**Qt apps:**
```bash
sudo pacman -S qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct
qt5ct  # GUI config
```

**Flatpak apps:**
```bash
sudo flatpak override --filesystem=~/.themes
sudo flatpak override --filesystem=~/.icons
```

---

## Community & Contribution

### Where can I get inspiration?

**Subreddits:**
- r/unixporn (showcase)
- r/i3wm
- r/hyprland

**Websites:**
- dotshare.it
- github.com/topics/dotfiles

**Communities:**
- Discord servers (Hyprland, r/unixporn)
- Matrix channels

### How can I share my rice?

1. **Take good screenshots:**
   - Use `scrot`, `flameshot`, or the included `screenshot.sh`
   - Show terminal with neofetch
   - Include workflow demonstration

2. **Share configs:**
   - Push to GitHub
   - Include README with dependencies
   - Add screenshots

3. **Post to r/unixporn:**
   - Follow posting rules
   - Include details comment
   - Link to dotfiles

### Can I contribute to this repository?

Yes! See [CONTRIBUTING.md](../CONTRIBUTING.md)

**Ways to contribute:**
- Submit theme configurations
- Improve documentation
- Add new guides
- Report bugs
- Share your rice setup

### I found a bug. What should I do?

1. Check if it's already reported (Issues tab)
2. Create new issue with:
   - Distribution & version
   - Steps to reproduce
   - Expected vs actual behavior
   - Relevant logs
   - Screenshots if applicable

### How do I stay updated with new configs?

```bash
cd ~/ricing-linux
git pull origin main
```

**Watch this repo on GitHub for notifications!**

### Is this repository maintained?

Check the last commit date. If you find this useful, consider:
- ⭐ Star the repository
- 🍴 Fork and customize
- 📝 Contribute improvements
- 💬 Share feedback

---

## Still have questions?

- Check the [guides](guides/) directory
- Read the [wiki](wiki/) articles
- See [troubleshooting guide](wiki/troubleshooting.md)
- Open an issue on GitHub
- Join the community on Reddit/Discord

**Happy ricing! 🍚**
