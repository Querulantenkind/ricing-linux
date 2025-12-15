# Glossary

A comprehensive glossary of terms used in Linux ricing and desktop customization.

---

## A

### Alacritty
A fast, GPU-accelerated terminal emulator written in Rust. Popular in the ricing community for its speed and minimal design.

### AUR (Arch User Repository)
Community-driven repository for Arch Linux containing PKGBUILDs that allow users to compile and install packages not in the official repositories.

### Autostart
Applications or scripts that run automatically when the window manager or desktop environment starts. Configured in WM config files or `~/.config/autostart/`.

---

## B

### Bar / Status Bar
A panel displaying system information (time, battery, volume, workspaces). Examples: Polybar, Waybar, i3bar, Lemonbar.

### Bezier Curve
Mathematical curve used in animations to control acceleration and deceleration. Common in Hyprland animation configurations.

### Blur
Visual effect that makes areas behind transparent windows appear blurred. Achieved through compositors (Picom, Hyprland).

### Border
The outline around windows. Can be customized in color, width, and style.

---

## C

### Color Scheme / Theme
A coordinated set of colors used throughout the desktop. Popular schemes: Catppuccin, Nord, Dracula, Gruvbox, Tokyo Night.

### Compositor
Software that combines visual elements from different windows into a final image. Enables effects like transparency, blur, shadows, and animations.
- **X11:** Picom, Compton (deprecated), Compiz
- **Wayland:** Built into the compositor (Hyprland, Sway)

### Config / Configuration File
Text files that control application behavior and appearance. Usually located in `~/.config/` or the home directory.

---

## D

### Daemon
A background process that runs continuously. Examples: notification daemon (dunst), music daemon (mpd).

### DE (Desktop Environment)
A complete graphical interface including window manager, file manager, settings, and applications. Examples: GNOME, KDE Plasma, XFCE.

### Display Manager
A graphical login screen that handles user authentication. Examples: SDDM, GDM, LightDM.

### Display Server
The underlying system that manages display and input. X11 (Xorg) or Wayland.

### Dmenu
A dynamic menu for X11 that displays items from stdin. Often used as an application launcher.

### Dotfiles
Configuration files that typically begin with a dot (.), making them hidden by default. The term now refers to any user configuration files.

### Drop Shadow
A shadow effect beneath windows that creates depth. Configured in compositors.

### Dunst
A lightweight notification daemon. Highly customizable and popular in ricing setups.

---

## E

### Environment Variable
A variable that affects how processes run. Set in shell config files. Example: `$PATH`, `$EDITOR`.

### EWW (ElKowars Wacky Widgets)
A widget system for creating custom bars and widgets using a custom configuration language.

---

## F

### Fade / Fading
Animation effect where windows gradually appear or disappear. Configured in compositors.

### Fetch
A program that displays system information in a visually appealing way. Examples: neofetch, fastfetch, pfetch.

### Float / Floating
A window mode where windows can be freely moved and resized (like traditional desktop). Opposite of tiling.

### Font
Typography used in the interface. Common fonts for ricing: JetBrains Mono, Fira Code, Iosevka, Nerd Fonts.

### Fuzzy Finder
A search tool that finds matches even with typos or partial input. Examples: fzf, rofi.

---

## G

### Gap
The space between windows and/or screen edges. A key aesthetic element in tiling WMs.
- **Inner gaps:** Space between windows
- **Outer gaps:** Space between windows and screen edges

### GLX
OpenGL Extension to the X Window System. A rendering backend for compositors.

### GTK (GIMP Toolkit)
A toolkit for creating graphical user interfaces. Used by GNOME applications. Theme files: `~/.config/gtk-3.0/`, `~/.config/gtk-4.0/`.

### GRUB
A popular bootloader. Can be themed for aesthetic boot screens.

---

## H

### Hex Color
Color representation using hexadecimal values. Format: `#RRGGBB` or `#RRGGBBAA` (with alpha).

### Hotkey / Keybind
A keyboard shortcut that triggers an action. Central to tiling WM workflows.

### Hyprland
A dynamic tiling Wayland compositor known for smooth animations and extensive customization.

### Hypridle
Hyprland's idle daemon for managing screen timeout and lock.

### Hyprlock
A screen locker for Hyprland.

### Hyprpaper
A wallpaper utility for Hyprland.

---

## I

### i3 / i3wm
A popular tiling window manager for X11. Known for its simplicity and efficiency.

### i3bar
The default status bar for i3wm.

### i3lock
A simple screen locker for i3wm. Often themed or replaced with i3lock-color.

### i3status
A status line generator for i3bar.

### IPC (Inter-Process Communication)
Communication between programs. Used by bars to get WM information.

---

## K

### Keybind / Keybinding
See Hotkey.

### Kernel
The core of the operating system. Linux is a kernel.

### Kitty
A GPU-accelerated terminal emulator with many features including image display and splits.

---

## L

### Launcher
An application to quickly launch programs. Examples: Rofi, dmenu, Wofi, tofi.

### Ligature
A typographic feature where multiple characters are combined into one glyph. Common in programming fonts.

### Lock Screen
A screen that requires authentication to access the desktop. Examples: i3lock, Hyprlock, swaylock.

---

## M

### Master-Stack
A tiling layout where one window is larger (master) and others are stacked beside it.

### Mod Key
The primary modifier key for WM keybindings. Usually Super (Windows key) or Alt.

### Monitor
A display device. Multi-monitor setups require specific configuration in WM configs.

### MPD (Music Player Daemon)
A server-side application for playing music. Paired with clients like ncmpcpp.

---

## N

### Neofetch
A command-line system information tool that displays info alongside an ASCII logo.

### Nerd Fonts
Fonts patched with additional glyphs including icons. Essential for many ricing setups.

### Notification
A popup message displaying information. Managed by notification daemons like dunst or mako.

### NixOS
A Linux distribution using the Nix package manager with declarative system configuration.

---

## O

### Opacity / Transparency
How see-through a window is. 1.0/100% = fully opaque, 0.0/0% = invisible.

---

## P

### Picom
A compositor for X11 providing transparency, blur, shadows, and animations (with forks).

### Polybar
A highly customizable status bar for X11. Popular in i3wm setups.

### Pywal / wal
A tool that generates color schemes from wallpaper images and applies them system-wide.

---

## Q

### Qt
A toolkit for creating graphical user interfaces. Used by KDE applications. Themed separately from GTK.

---

## R

### Rice / Ricing
The art of customizing a Linux desktop for aesthetics and workflow optimization. Origin: "Race Inspired Cosmetic Enhancements" from car culture.

### Rofi
A window switcher, application launcher, and dmenu replacement. Highly themeable.

### Rounded Corners
Curved corners on windows instead of sharp 90° angles. Enabled via compositor.

### Runit
An init system alternative to systemd. Used by Void Linux.

---

## S

### Scratchpad
A special workspace for temporarily hiding windows. Quick access via keybind.

### Screenshot
A captured image of the screen. Tools: grim (Wayland), maim/scrot (X11).

### Shell
A command-line interpreter. Examples: bash, zsh, fish.

### Sway
A tiling Wayland compositor. Drop-in replacement for i3.

### Swaylock
Screen locker for Sway/Wayland.

### Sxhkd
Simple X hotkey daemon. Manages keybindings independently from WM.

### Symlink
A file that points to another file/directory. Used in dotfiles management.

### Systemd
An init system and service manager for Linux. Manages system services and user services.

---

## T

### Terminal Emulator
An application that provides a text interface to the shell. Examples: Alacritty, Kitty, WezTerm.

### Theme
A coordinated visual style including colors, icons, fonts, and widgets.

### Tiling
A window management approach where windows automatically arrange without overlapping.

### Tmux
A terminal multiplexer allowing multiple terminal sessions in one window.

### Transparency
See Opacity.

### TTY
Teletypewriter. Refers to the virtual consoles (Ctrl+Alt+F1-F6) before graphical login.

---

## U

### Unixporn
r/unixporn - A Reddit community dedicated to sharing Linux/Unix desktop customizations.

---

## V

### VSync (Vertical Sync)
Synchronization with monitor refresh rate to prevent screen tearing.

---

## W

### Wallpaper
The background image of the desktop. Tools: feh, nitrogen (X11), hyprpaper, swaybg (Wayland).

### Waybar
A highly customizable status bar for Wayland compositors.

### Wayland
A modern display server protocol. Replacement for X11 with better security and performance.

### Widget
A small visual element displaying information. Created with EWW, Conky, etc.

### Window
A rectangular area containing an application's interface.

### Window Manager (WM)
Software that controls window placement and appearance. Can be tiling, stacking, or dynamic.
- **Tiling:** i3, Hyprland, Sway, bspwm
- **Stacking:** Openbox, Fluxbox
- **Dynamic:** awesome, dwm

### Wofi
A launcher/menu for Wayland. Rofi alternative.

### Workspace / Desktop / Tag
A virtual screen containing windows. Switch between workspaces for organization.

---

## X

### X11 / Xorg / X
The traditional display server for Linux. Being replaced by Wayland.

### Xresources
A file (`~/.Xresources`) for configuring X11 applications. Used for terminal colors, DPI, etc.

### XDG (X Desktop Group)
Standards for desktop environments. Defines directories like `~/.config/`, `~/.local/share/`.

---

## Y

### YAML
A human-readable data format used in configuration files. Example: Alacritty config.

---

## Z

### Zathura
A vim-like document viewer. Highly customizable.

### Zsh
Z shell - An extended Bourne shell with many improvements. Popular for customization (Oh My Zsh).

---

## Color Scheme Names

| Name | Description |
|------|-------------|
| **Catppuccin** | Pastel theme with 4 flavors: Latte, Frappé, Macchiato, Mocha |
| **Dracula** | Dark theme with purple/pink accents |
| **Gruvbox** | Retro groove theme with warm colors |
| **Nord** | Arctic, bluish color palette |
| **Rose Pine** | Soft, muted theme with 3 variants |
| **Solarized** | Precision colors with light/dark variants |
| **Tokyo Night** | Clean, dark theme inspired by Tokyo city lights |
| **Everforest** | Comfortable green-based theme |
| **One Dark** | Atom editor's dark theme |
| **Monokai** | Classic Sublime Text theme |

---

## See Also

- [Terminology Wiki](../wiki/terminology.md)
- [Getting Started Guide](../guides/01-getting-started.md)
- [Useful Resources](useful-resources.md)
