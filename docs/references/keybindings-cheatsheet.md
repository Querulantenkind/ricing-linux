# Keybindings Cheatsheet

Quick reference for default keybindings in i3wm and Hyprland. Print this page or keep it handy while learning!

## Legend

- `Mod` = Super/Windows key (default for both)
- `Shift` = Shift key
- `Ctrl` = Control key
- `Alt` = Alt key
- `Return` = Enter key

## i3wm Default Keybindings

### Basic Window Management

| Keybinding | Action |
|------------|--------|
| `Mod + Return` | Open terminal |
| `Mod + d` | Open application launcher (rofi/dmenu) |
| `Mod + Shift + q` | Close focused window |
| `Mod + Shift + e` | Exit i3 |
| `Mod + Shift + r` | Restart i3 (reload config) |
| `Mod + Shift + c` | Reload config without restart |

### Navigation

| Keybinding | Action |
|------------|--------|
| `Mod + h` or `Left` | Focus left |
| `Mod + j` or `Down` | Focus down |
| `Mod + k` or `Up` | Focus up |
| `Mod + l` or `Right` | Focus right |
| `Mod + a` | Focus parent container |

### Moving Windows

| Keybinding | Action |
|------------|--------|
| `Mod + Shift + h` or `Left` | Move window left |
| `Mod + Shift + j` or `Down` | Move window down |
| `Mod + Shift + k` or `Up` | Move window up |
| `Mod + Shift + l` or `Right` | Move window right |

### Workspaces

| Keybinding | Action |
|------------|--------|
| `Mod + 1-9` | Switch to workspace 1-9 |
| `Mod + 0` | Switch to workspace 10 |
| `Mod + Shift + 1-9` | Move window to workspace 1-9 |
| `Mod + Shift + 0` | Move window to workspace 10 |

### Layouts

| Keybinding | Action |
|------------|--------|
| `Mod + e` | Toggle split horizontal/vertical |
| `Mod + v` | Next container vertical split |
| `Mod + h` | Next container horizontal split |
| `Mod + s` | Stacking layout |
| `Mod + w` | Tabbed layout |
| `Mod + e` | Default layout (toggle split) |

### Window States

| Keybinding | Action |
|------------|--------|
| `Mod + f` | Toggle fullscreen |
| `Mod + Shift + Space` | Toggle floating |
| `Mod + Space` | Toggle focus tiling/floating |

### Resizing

| Keybinding | Action |
|------------|--------|
| `Mod + r` | Enter resize mode |

**In resize mode:**
| Keybinding | Action |
|------------|--------|
| `h` or `Left` | Shrink width |
| `j` or `Down` | Grow height |
| `k` or `Up` | Shrink height |
| `l` or `Right` | Grow width |
| `Return` or `Escape` | Exit resize mode |

### Scratchpad

| Keybinding | Action |
|------------|--------|
| `Mod + Shift + minus` | Move window to scratchpad |
| `Mod + minus` | Show/hide scratchpad window |

## Hyprland Default Keybindings

### Basic Window Management

| Keybinding | Action |
|------------|--------|
| `Super + Q` | Open terminal |
| `Super + R` | Open application launcher |
| `Super + C` | Close active window |
| `Super + M` | Exit Hyprland |
| `Super + V` | Toggle floating |
| `Super + F` | Toggle fullscreen |
| `Super + P` | Toggle pseudo-tiling |

### Navigation

| Keybinding | Action |
|------------|--------|
| `Super + Left` | Move focus left |
| `Super + Right` | Move focus right |
| `Super + Up` | Move focus up |
| `Super + Down` | Move focus down |
| `Super + h` | Move focus left (vim-style) |
| `Super + l` | Move focus right (vim-style) |
| `Super + k` | Move focus up (vim-style) |
| `Super + j` | Move focus down (vim-style) |

### Moving Windows

| Keybinding | Action |
|------------|--------|
| `Super + Shift + Left` | Move window left |
| `Super + Shift + Right` | Move window right |
| `Super + Shift + Up` | Move window up |
| `Super + Shift + Down` | Move window down |
| `Super + Shift + h` | Move window left (vim) |
| `Super + Shift + l` | Move window right (vim) |
| `Super + Shift + k` | Move window up (vim) |
| `Super + Shift + j` | Move window down (vim) |

### Workspaces

| Keybinding | Action |
|------------|--------|
| `Super + 1-9` | Switch to workspace 1-9 |
| `Super + 0` | Switch to workspace 10 |
| `Super + Shift + 1-9` | Move window to workspace 1-9 |
| `Super + Shift + 0` | Move window to workspace 10 |
| `Super + mouse_down` | Next workspace |
| `Super + mouse_up` | Previous workspace |

### Layouts

| Keybinding | Action |
|------------|--------|
| `Super + J` | Toggle split (dwindle) |

### Special Workspaces

| Keybinding | Action |
|------------|--------|
| `Super + S` | Toggle special workspace |
| `Super + Shift + S` | Move to special workspace |

### Resizing

| Keybinding | Action |
|------------|--------|
| `Super + mouse:272` | Move window (left mouse) |
| `Super + mouse:273` | Resize window (right mouse) |

**Submap resize mode (if configured):**
| Keybinding | Action |
|------------|--------|
| `Super + Alt + h` | Resize left |
| `Super + Alt + l` | Resize right |
| `Super + Alt + k` | Resize up |
| `Super + Alt + j` | Resize down |

### Media Keys

| Keybinding | Action |
|------------|--------|
| `XF86AudioRaiseVolume` | Increase volume |
| `XF86AudioLowerVolume` | Decrease volume |
| `XF86AudioMute` | Toggle mute |
| `XF86MonBrightnessUp` | Increase brightness |
| `XF86MonBrightnessDown` | Decrease brightness |

## Common Custom Keybindings

These are commonly added to configs and included in this repository:

### Both i3wm and Hyprland

| Keybinding | Action |
|------------|--------|
| `Mod + Shift + s` | Screenshot (full screen) |
| `Mod + Shift + a` | Screenshot (selection) |
| `Mod + Shift + x` | Lock screen |
| `Mod + Shift + p` | Power menu |
| `Mod + b` | Toggle status bar |

### Application Launchers

| Keybinding | Action |
|------------|--------|
| `Mod + w` | Open web browser |
| `Mod + e` | Open file manager |
| `Mod + n` | Open note-taking app |

## Tips for Learning Keybindings

### Mnemonics

Many keybindings use logical letters:
- `Q` = Quit/close
- `R` = Run/launcher or Resize
- `F` = Fullscreen
- `S` = Stack or Special or Screenshot
- `W` = Window or Web
- `E` = Explorer/file manager or layout
- `M` = Menu or exit (iM out)

### Practice Routine

Day 1-2: Focus on:
- Opening terminal
- Closing windows
- Switching workspaces

Day 3-5: Add:
- Moving windows
- Basic navigation
- Opening launcher

Day 6-14: Master:
- All layouts
- Resizing
- Floating windows
- Advanced navigation

### Cheat Sheet Display

Keep this cheatsheet open in a workspace:
```bash
# i3
Mod + 9  # Switch to workspace 9
# Open this file in browser or editor

# Or create a rofi/wofi menu with keybindings
```

## Customization Tips

### Make Keybindings Consistent

If using both i3 and Hyprland, try to keep similar bindings:
```bash
# i3
bindsym $mod+Return exec alacritty

# Hyprland
bind = $mainMod, Return, exec, alacritty
```

### Use Submaps/Modes

Group related actions:
```bash
# Hyprland submap example
bind = $mainMod, X, submap, power
submap = power
  bind = , L, exec, lock
  bind = , S, exec, systemctl suspend
  bind = , R, exec, systemctl reboot
  bind = , P, exec, systemctl poweroff
  bind = , escape, submap, reset
submap = reset

# i3 mode example
mode "power" {
    bindsym l exec i3lock, mode "default"
    bindsym s exec systemctl suspend, mode "default"
    bindsym r exec systemctl reboot
    bindsym p exec systemctl poweroff
    bindsym Escape mode "default"
}
bindsym $mod+x mode "power"
```

### Avoid Conflicts

Check for conflicts with:
- System keybindings
- Application keybindings
- Terminal keybindings

Common conflicts:
- `Ctrl+Q`: Often closes applications
- `Ctrl+W`: Closes tabs in browsers
- `Ctrl+T`: New tab in many apps

## Exporting Your Keybindings

Create a personal cheatsheet:
```bash
# For i3
grep "^bindsym" ~/.config/i3/config > my-keybindings.txt

# For Hyprland
grep "^bind" ~/.config/hypr/hyprland.conf > my-keybindings.txt
```

## Print-Friendly Version

To print this cheatsheet:
1. Open in browser
2. Print to PDF
3. Or use `pandoc` to convert to PDF:
   ```bash
   pandoc keybindings-cheatsheet.md -o cheatsheet.pdf
   ```

## Quick Reference Cards

### i3wm Essential Keys
```
Mod+Return   Terminal        Mod+d         Launcher
Mod+Shift+q  Close window    Mod+f         Fullscreen
Mod+h/j/k/l  Navigate        Mod+Shift+h/j/k/l  Move
Mod+1-9      Workspaces      Mod+Shift+1-9      Move to WS
Mod+r        Resize mode     Mod+e/s/w          Layouts
```

### Hyprland Essential Keys
```
Super+Q      Terminal        Super+R        Launcher
Super+C      Close window    Super+F        Fullscreen
Super+h/j/k/l Navigate       Super+Shift+h/j/k/l  Move
Super+1-9    Workspaces      Super+Shift+1-9    Move to WS
Super+V      Float toggle    Super+J        Split toggle
```

## Next Steps

Once comfortable with basic keybindings:
1. Read [Keybindings Explained](../guides/06-keybindings-explained.md)
2. Customize for your workflow
3. Create your own submaps/modes
4. Share your config with the community

Remember: Muscle memory takes 2-3 weeks to develop. Be patient and practice daily!