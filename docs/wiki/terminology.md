# Linux Ricing Terminology

This guide explains common terms used in the Linux ricing community, particularly for tiling window managers like Hyprland and i3wm.

## General Terms

### Ricing
The process of customizing your Linux desktop environment's appearance and behavior. The term originated from car modification culture ("rice burner") and has been adopted by the Linux community.

### Dotfiles
Configuration files in Unix-like systems that begin with a dot (.), making them hidden by default. Examples: `.bashrc`, `.vimrc`, `.config/`

### Compositor
A program responsible for drawing windows and visual effects. In Wayland, compositors are also window managers. In X11, compositors like Picom add effects on top of window managers.

### Window Manager (WM)
Software that controls the placement and appearance of windows. Can be tiling, floating, or dynamic.

### Desktop Environment (DE)
A complete graphical user interface with integrated applications (like GNOME, KDE). Window managers are lighter alternatives.

## Window Manager Types

### Tiling Window Manager
Automatically arranges windows in non-overlapping tiles, maximizing screen space usage. Examples: i3, Hyprland, bspwm, dwm.

### Floating Window Manager
Windows can overlap and be freely positioned, like traditional desktop environments. Examples: Openbox, Fluxbox.

### Dynamic Window Manager
Can switch between tiling and floating modes. Examples: dwm, awesome.

## Display Server Protocols

### X11 (X Window System)
The traditional display server protocol used in Linux for decades. Mature but showing its age.

### Wayland
Modern display server protocol designed to replace X11. More secure, better performance, but newer with less software support.

### XWayland
Compatibility layer allowing X11 applications to run on Wayland compositors.

## Configuration Concepts

### Modeline
A configuration line describing video display timings and resolutions.

### Keybinding
A keyboard shortcut assigned to execute a command or action.

### Workspace / Virtual Desktop
Separate screen areas for organizing windows. You can switch between them to reduce clutter.

### Tag
In some window managers (like dwm), tags are like workspaces but more flexible - windows can belong to multiple tags.

### Scratchpad
A hidden workspace for quickly accessing specific applications. Useful for dropdown terminals or note-taking apps.

## Visual Elements

### Status Bar
A bar displaying system information like time, battery, network, etc. Examples: Polybar, Waybar, i3status.

### Panel
Similar to a status bar but can include application launchers and other interactive elements.

### Notification Daemon
Background service that displays notification popups. Examples: dunst, mako.

### Application Launcher
A program for quickly searching and launching applications. Examples: rofi, wofi, dmenu.

### Wallpaper
Background image on your desktop. Also called "background" or "desktop wallpaper."

## Theme Components

### Color Scheme
A set of coordinated colors used throughout your system (terminal, editor, applications).

### GTK Theme
Visual styling for GTK applications (many Linux GUI apps).

### Icon Theme
Set of icons used in file managers, applications, and system menus.

### Cursor Theme
Custom mouse pointer appearance.

### Font
Typeface used in terminals, applications, and UI elements. Popular monospace fonts for coding: JetBrains Mono, Fira Code.

## Window Management Terms

### Focus
The currently active window that receives keyboard input.

### Split
Dividing a workspace area to create space for multiple windows. Can be horizontal or vertical.

### Container
In i3, a container holds one or more windows and determines their layout.

### Layout
The arrangement pattern of windows. Common layouts: tiling, tabbed, stacked.

### Gaps
Spacing between windows and screen edges. "Inner gaps" are between windows, "outer gaps" are at screen borders.

### Border
Visual outline around windows. Can be used to indicate focus.

### Fullscreen
A window taking up the entire screen, hiding bars and other windows.

### Floating Mode
Making a window behave like in traditional desktop environments (freely movable and resizable).

## System Integration

### Init System
The first process started by the kernel, managing other services. Most common: systemd.

### Display Manager
Login screen that starts your window manager or desktop environment. Examples: LightDM, SDDM, GDM.

### Session
Your active login period from login to logout.

### Autostart
Programs automatically launched when your window manager starts.

## Scripting & Automation

### Shell
Command-line interpreter. Popular shells: bash, zsh, fish.

### Shell Script
A file containing shell commands for automation.

### Hook
A trigger that executes code when certain events occur.

### IPC (Inter-Process Communication)
Method for programs to communicate. Many window managers provide IPC for scripting control.

## Performance Terms

### Vsync (Vertical Synchronization)
Synchronizing frame rendering with monitor refresh rate to prevent screen tearing.

### Screen Tearing
Visual artifact where parts of different frames are displayed simultaneously.

### Compositor Pipeline
The rendering process from application to display output.

### Hardware Acceleration
Using GPU instead of CPU for rendering tasks.

## Community Terms

### Daily Driver
Your main setup used for everyday work (as opposed to test configurations).

### Minimal Setup
Configuration with only essential components, no unnecessary features.

### Eye Candy
Visual effects and animations that look nice but aren't strictly necessary.

### Workflow
Your personal way of using your system efficiently.

### Keybind Muscle Memory
The ability to use keyboard shortcuts without thinking, through practice.

## File Paths

### `~/.config/`
Standard directory for user configuration files (XDG Base Directory specification).

### `~/.local/share/`
Directory for user-specific data files.

### `/usr/share/`
System-wide shared data and resources.

### `$HOME`
Environment variable pointing to your home directory (usually `/home/username`).

## Hyprland-Specific

### Submap
In Hyprland, a mode with different keybindings (like resize mode or system mode).

### Animation
Smooth transitions between window states. Hyprland is known for its animations.

### Master Layout
A layout with one large "master" window and smaller "stack" windows.

## i3-Specific

### i3bar
The default status bar included with i3wm.

### i3status
Default status bar content generator for i3bar.

### Mark
A name assigned to a window for easy reference in commands.

### Mode
A state with different keybindings (like resize mode). Similar to Hyprland's submap.

## Common Abbreviations

- **WM**: Window Manager
- **DE**: Desktop Environment
- **DM**: Display Manager
- **GPU**: Graphics Processing Unit
- **TTY**: TeleTYpewriter (text-based virtual console)
- **CLI**: Command Line Interface
- **GUI**: Graphical User Interface
- **FOSS**: Free and Open Source Software
- **AUR**: Arch User Repository
- **PKG**: Package