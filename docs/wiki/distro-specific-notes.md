# Distribution-Specific Notes

Important differences, tips, and quirks for ricing on various Linux distributions.

## Table of Contents

1. [Arch Linux](#arch-linux)
2. [Ubuntu / Debian](#ubuntu--debian)
3. [Fedora](#fedora)
4. [NixOS](#nixos)
5. [Void Linux](#void-linux)
6. [Gentoo](#gentoo)
7. [openSUSE](#opensuse)
8. [Package Availability Comparison](#package-availability-comparison)

---

## Arch Linux

The most popular distribution for ricing due to its flexibility and package availability.

### Strengths
- ✅ Latest packages (rolling release)
- ✅ AUR has almost everything
- ✅ Minimal base installation
- ✅ Excellent documentation (Arch Wiki)
- ✅ Most ricing guides target Arch

### Package Management

```bash
# Official packages
sudo pacman -S package-name

# Update system
sudo pacman -Syu

# Search packages
pacman -Ss search-term

# AUR helpers
yay -S aur-package
paru -S aur-package
```

### Key Packages

```bash
# Hyprland setup
sudo pacman -S hyprland waybar wofi dunst

# i3 setup
sudo pacman -S i3-wm polybar rofi picom

# From AUR
yay -S picom-ftlabs-git  # Animated picom
yay -S hyprpicker        # Color picker
```

### Arch-Specific Tips

**Enable multilib for 32-bit packages:**
```bash
# /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
```

**ParallelDownloads:**
```bash
# /etc/pacman.conf
ParallelDownloads = 5
```

**Clean package cache:**
```bash
sudo paccache -r      # Keep last 3 versions
sudo paccache -rk 1   # Keep only latest
```

### Common Issues

**Hyprland on NVIDIA:**
```bash
# Install NVIDIA packages
sudo pacman -S nvidia nvidia-utils

# Environment variables
# ~/.config/hypr/hyprland.conf
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = WLR_NO_HARDWARE_CURSORS,1
```

---

## Ubuntu / Debian

Stable distributions requiring PPAs or manual installation for newer packages.

### Strengths
- ✅ Stable and reliable
- ✅ Large community
- ✅ Good hardware support
- ❌ Older packages
- ❌ Some tools require manual installation

### Package Management

```bash
# Install packages
sudo apt install package-name

# Update system
sudo apt update && sudo apt upgrade

# Search packages
apt search search-term

# Add PPA
sudo add-apt-repository ppa:name/ppa
sudo apt update
```

### Hyprland on Ubuntu

Hyprland isn't in official repos. Options:

**Option 1: Build from source**
```bash
# Install dependencies
sudo apt install meson ninja-build cmake-extras \
  libwayland-dev libxkbcommon-dev libinput-dev \
  libpixman-1-dev libudev-dev libseat-dev seatd \
  libxcb-dri3-dev libvulkan-dev libvulkan-volk-dev \
  libvkfft-dev libgles2-mesa-dev libgbm-dev \
  libdrm-dev

# Clone and build
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all
sudo make install
```

**Option 2: Use Ubuntu 24.04+ (when available in repos)**

### i3 on Ubuntu

```bash
# i3 from repos (may be older)
sudo apt install i3 i3status i3lock

# Or use regolith (i3-based desktop)
sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop
```

### Polybar on Ubuntu

```bash
# Build from source (recommended for features)
sudo apt install build-essential git cmake cmake-data \
  pkg-config python3-sphinx python3-packaging libuv1-dev \
  libcairo2-dev libxcb1-dev libxcb-util0-dev \
  libxcb-randr0-dev libxcb-composite0-dev \
  python3-xcbgen xcb-proto libxcb-image0-dev \
  libxcb-ewmh-dev libxcb-icccm4-dev

git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
```

### Picom on Ubuntu

```bash
# From repos (older version)
sudo apt install picom

# Build for latest features
sudo apt install meson libxext-dev libxcb1-dev \
  libxcb-damage0-dev libxcb-xfixes0-dev \
  libxcb-shape0-dev libxcb-render-util0-dev \
  libxcb-render0-dev libxcb-randr0-dev \
  libxcb-composite0-dev libxcb-image0-dev \
  libxcb-present-dev libxcb-xinerama0-dev \
  libpixman-1-dev libdbus-1-dev libconfig-dev \
  libgl1-mesa-dev libpcre2-dev libevdev-dev \
  uthash-dev libev-dev libx11-xcb-dev

git clone https://github.com/yshui/picom
cd picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install
```

### Ubuntu-Specific Tips

**Enable universe repository:**
```bash
sudo add-apt-repository universe
```

**Fonts location:**
```bash
# System fonts
/usr/share/fonts/

# User fonts
~/.local/share/fonts/
```

---

## Fedora

Modern distribution with recent packages and SELinux.

### Strengths
- ✅ Recent packages
- ✅ Good Wayland support
- ✅ GNOME with Wayland by default
- ✅ Fedora Workstation is polished
- ❌ SELinux can cause issues
- ❌ Smaller AUR-equivalent

### Package Management

```bash
# Install packages
sudo dnf install package-name

# Update system
sudo dnf upgrade

# Search packages
dnf search search-term

# Enable RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### COPR (Community Repos)

Fedora's equivalent to AUR:

```bash
# Enable COPR repo
sudo dnf copr enable user/repo

# Example: Hyprland
sudo dnf copr enable solopasha/hyprland
sudo dnf install hyprland
```

### Hyprland on Fedora

```bash
# Enable COPR
sudo dnf copr enable solopasha/hyprland

# Install
sudo dnf install hyprland waybar wofi dunst
```

### i3 on Fedora

```bash
# From official repos
sudo dnf install i3 i3status i3lock polybar rofi picom
```

### SELinux Considerations

SELinux may block certain operations:

```bash
# Check SELinux status
sestatus

# Temporarily set to permissive
sudo setenforce 0

# Check for denials
sudo ausearch -m avc -ts recent

# Generate policy for allowed operation
sudo audit2allow -a
```

### Fedora-Specific Tips

**NVIDIA drivers:**
```bash
# Enable RPM Fusion first
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda
```

**Flatpak is pre-installed:**
```bash
flatpak install flathub com.spotify.Client
```

---

## NixOS

Declarative configuration with reproducible builds.

### Strengths
- ✅ Reproducible system
- ✅ Easy rollbacks
- ✅ Configuration as code
- ✅ Huge package repository
- ❌ Steep learning curve
- ❌ Different from traditional Linux

### Configuration Approach

NixOS uses `/etc/nixos/configuration.nix` for system config.

**Example Hyprland setup:**

```nix
# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Install packages
  environment.systemPackages = with pkgs; [
    waybar
    wofi
    dunst
    alacritty
    kitty
    neovim
    firefox
    
    # Themes
    catppuccin-gtk
    papirus-icon-theme
  ];

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    fira-code
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
  ];

  # Enable services
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
```

### Home Manager

For user-level configuration:

```nix
# ~/.config/home-manager/home.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    lazygit
    ranger
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 12;
      };
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "clock" "battery" ];
      };
    };
  };
}
```

### NixOS-Specific Tips

**Rebuild system:**
```bash
sudo nixos-rebuild switch
```

**Rollback:**
```bash
sudo nixos-rebuild switch --rollback
```

**Search packages:**
```bash
nix search nixpkgs package-name
```

**Temporary shell with package:**
```bash
nix-shell -p package-name
```

### Flakes (Modern Approach)

```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, hyprland, ... }: {
    nixosConfigurations.hostname = nixpkgs.lib.nixosSystem {
      modules = [
        hyprland.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
```

---

## Void Linux

Independent distribution with runit init system.

### Strengths
- ✅ Very lightweight
- ✅ Fast boot (runit)
- ✅ Rolling release
- ✅ musl libc option
- ❌ Smaller community
- ❌ Fewer packages

### Package Management

```bash
# Install packages
sudo xbps-install -S package-name

# Update system
sudo xbps-install -Su

# Search packages
xbps-query -Rs search-term
```

### Key Packages

```bash
# i3 setup
sudo xbps-install i3 i3status i3lock polybar rofi picom

# Wayland (Sway - Hyprland may need building)
sudo xbps-install sway swaylock swayidle waybar wofi
```

### Runit Services

```bash
# Enable service
sudo ln -s /etc/sv/service-name /var/service/

# Disable service
sudo rm /var/service/service-name

# Check status
sudo sv status service-name
```

### Void-Specific Tips

**Choose glibc or musl:**
- glibc: Better compatibility
- musl: Lighter, some apps may not work

**No systemd:**
- Use runit for services
- Some apps expecting systemd need workarounds

---

## Gentoo

Source-based distribution with USE flags for customization.

### Strengths
- ✅ Ultimate customization
- ✅ Optimized for your hardware
- ✅ USE flags control features
- ❌ Long compile times
- ❌ Complex setup

### Package Management

```bash
# Install package
sudo emerge package-name

# Update system
sudo emerge --sync
sudo emerge -avuDN @world

# Search packages
emerge --search search-term
```

### USE Flags

Control which features are compiled:

```bash
# /etc/portage/make.conf
USE="wayland X pulseaudio -gnome -kde"
```

**Example for Hyprland:**
```bash
# /etc/portage/package.use/hyprland
gui-wm/hyprland X wayland
```

### Gentoo-Specific Tips

**Accept keywords for testing packages:**
```bash
# /etc/portage/package.accept_keywords
gui-wm/hyprland ~amd64
```

**Binary packages (faster):**
```bash
# Enable binpkg
emerge --getbinpkg package-name
```

---

## openSUSE

Enterprise-grade distribution with YaST configuration tool.

### Strengths
- ✅ Stable (Leap) or Rolling (Tumbleweed)
- ✅ YaST for easy configuration
- ✅ Btrfs with snapshots by default
- ✅ Good KDE support
- ❌ Smaller ricing community

### Package Management

```bash
# Install packages
sudo zypper install package-name

# Update system
sudo zypper refresh
sudo zypper update

# Search packages
zypper search search-term
```

### OBS (Open Build Service)

openSUSE's community repos:

```bash
# Add repo
sudo zypper addrepo https://... repo-name

# Example for additional packages
# Visit: https://software.opensuse.org
```

### Key Packages

```bash
# i3 setup
sudo zypper install i3 i3status i3lock polybar rofi picom

# Sway (Tumbleweed)
sudo zypper install sway swaylock waybar wofi
```

### Snapper (Btrfs Snapshots)

```bash
# List snapshots
sudo snapper list

# Create snapshot
sudo snapper create -d "Before ricing"

# Rollback
sudo snapper rollback NUMBER
```

---

## Package Availability Comparison

| Package | Arch | Ubuntu | Fedora | NixOS | Void |
|---------|------|--------|--------|-------|------|
| Hyprland | ✅ | ⚠️ Build | ✅ COPR | ✅ | ⚠️ Build |
| Sway | ✅ | ✅ | ✅ | ✅ | ✅ |
| i3wm | ✅ | ✅ | ✅ | ✅ | ✅ |
| Polybar | ✅ | ⚠️ Build | ✅ | ✅ | ✅ |
| Waybar | ✅ | ✅ | ✅ | ✅ | ✅ |
| Picom | ✅ | ✅ | ✅ | ✅ | ✅ |
| Picom (forks) | ✅ AUR | ⚠️ Build | ⚠️ Build | ⚠️ | ⚠️ Build |
| Rofi | ✅ | ✅ | ✅ | ✅ | ✅ |
| Wofi | ✅ | ✅ | ✅ | ✅ | ✅ |
| Dunst | ✅ | ✅ | ✅ | ✅ | ✅ |
| Alacritty | ✅ | ✅ | ✅ | ✅ | ✅ |
| Kitty | ✅ | ✅ | ✅ | ✅ | ✅ |

**Legend:**
- ✅ Official repos
- ⚠️ Requires extra steps
- ❌ Not available

---

## Recommendations

| Use Case | Recommended Distro |
|----------|-------------------|
| First-time ricer | Arch Linux, Fedora |
| Bleeding edge | Arch Linux, Fedora |
| Stability | Ubuntu LTS, Debian |
| Reproducibility | NixOS |
| Lightweight | Void Linux, Arch |
| Enterprise | openSUSE, Fedora |
| Learning | Arch Linux, Gentoo |

---

## See Also

- [Installation Scripts](../../scripts/installation/)
- [Getting Started Guide](../guides/01-getting-started.md)
- [Troubleshooting](troubleshooting.md)
