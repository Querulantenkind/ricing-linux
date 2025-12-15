# Keybindings Explained

This guide explains how to create, understand, and master keybindings in i3wm and Hyprland.

## Why Keybindings Matter

Keybindings are the foundation of efficient tiling window manager usage:
- Faster than mouse operations
- Reduce hand movement
- Enable flow state
- Customizable to your workflow
- Consistent across applications

## Keybinding Philosophy

### Design Principles

**1. Mnemonic**
Use letters that make sense:
- `Q` for Quit
- `R` for Run/Resize
- `F` for Fullscreen
- `T` for Terminal

**2. Consistency**
Similar actions use similar keys:
- `Mod + Key` for actions
- `Mod + Shift + Key` for move/stronger
- `Mod + Ctrl + Key` for resize/alternative

**3. Grouping**
Related functions near each other:
- Numbers (1-9) for workspaces
- Arrows/hjkl for navigation
- Function keys for media

**4. Avoid Conflicts**
Don't override:
- Terminal shortcuts (Ctrl+C, Ctrl+Z)
- Browser shortcuts (Ctrl+T, Ctrl+W)
- Common shortcuts (Ctrl+C for copy)

## Keybinding Anatomy

### i3wm Syntax

```bash
bindsym [--release] [--locked] [Modifiers+]Key command

# Examples:
bindsym $mod+Return exec alacritty
bindsym $mod+Shift+q kill
bindsym --release $mod+x exec screenshot.sh
```

**Components:**
- `bindsym`: Define key binding
- `--release`: Execute on key release (not press)
- `--locked`: Work even when screen locked
- `$mod`: Modifier variable (Super/Alt)
- `+`: Combine modifiers
- `exec`: Execute command

### Hyprland Syntax

```bash
bind = [Modifiers, ]Key, dispatcher, params

# Examples:
bind = $mainMod, Q, exec, alacritty
bind = $mainMod SHIFT, Q, killactive
bind = , Print, exec, screenshot.sh
```

**Components:**
- `bind`: Define binding
- `Modifiers`: SUPER, SHIFT, CTRL, ALT
- `Key`: Key name
- `dispatcher`: Hyprland action
- `params`: Additional parameters

## Modifier Keys

### Available Modifiers

**Linux Key Names:**
- `Mod1`: Alt
- `Mod4`: Super (Windows key)
- `Control`: Ctrl
- `Shift`: Shift

**Hyprland Names:**
- `SUPER`: Super/Windows key
- `ALT`: Alt key
- `CTRL`: Control key
- `SHIFT`: Shift key

### Choosing Your Modifier

**Super (Recommended):**
- Least conflicts with applications
- Modern standard
- Comfortable to reach

**Alt (Alternative):**
- Conflicts with terminal (Alt+key)
- Some IDEs use Alt
- Closer to home row

**Recommendation:**
```bash
# i3
set $mod Mod4

# Hyprland
$mainMod = SUPER
```

## Essential Keybindings

For a complete reference, see [Keybindings Cheatsheet](../references/keybindings-cheatsheet.md).

## Modes and Submaps

### i3 Modes

Modes create separate keybinding contexts:

```bash
# Resize mode
mode \"resize\" {
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt
    
    bindsym Return mode \"default\"
    bindsym Escape mode \"default\"
}
bindsym $mod+r mode \"resize\"

# Power mode
mode \"power\" {
    bindsym l exec i3lock -c 000000, mode \"default\"
    bindsym e exec i3-msg exit, mode \"default\"
    bindsym s exec systemctl suspend, mode \"default\"
    bindsym r exec systemctl reboot, mode \"default\"
    bindsym p exec systemctl poweroff, mode \"default\"
    
    bindsym Return mode \"default\"
    bindsym Escape mode \"default\"
}
bindsym $mod+Shift+p mode \"power\"
```

### Hyprland Submaps

Similar to i3 modes:

```bash
# Resize submap
bind = $mainMod, R, submap, resize
submap = resize
    binde = , h, resizeactive, -10 0
    binde = , l, resizeactive, 10 0
    binde = , k, resizeactive, 0 -10
    binde = , j, resizeactive, 0 10
    
    bind = , escape, submap, reset
submap = reset

# Power submap
bind = $mainMod SHIFT, P, submap, power
submap = power
    bind = , l, exec, hyprlock
    bind = , l, submap, reset
    bind = , e, exit
    bind = , s, exec, systemctl suspend
    bind = , s, submap, reset
    bind = , r, exec, systemctl reboot
    bind = , p, exec, systemctl poweroff
    
    bind = , escape, submap, reset
submap = reset
```

## Mouse Bindings

### i3wm

```bash
# Use Mouse+$mod to drag floating windows
floating_modifier $mod

# Middle click on title bar to close
bindsym --whole-window --border button2 kill

# Right click on title bar for floating
bindsym --whole-window --border button3 floating toggle
```

### Hyprland

```bash
# Mouse buttons
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Workspace scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1
```

## Special Keys

### Multimedia Keys

```bash
# Volume
XF86AudioRaiseVolume
XF86AudioLowerVolume
XF86AudioMute

# Brightness
XF86MonBrightnessUp
XF86MonBrightnessDown

# Media
XF86AudioPlay
XF86AudioNext
XF86AudioPrev
```

### Finding Key Names

```bash
# For X11 (i3)
xev

# For Wayland (Hyprland)
wev
```

## Debugging Keybindings

### Test if Keys Are Received

```bash
# i3 - monitor bindings
i3-msg -t subscribe -m '[ \"binding\" ]'

# Hyprland - check events
hyprctl events
```

### Check for Conflicts

```bash
# i3 - list all bindings
grep \"^bindsym\" ~/.config/i3/config | sort

# Hyprland - list bindings
grep \"^bind\" ~/.config/hypr/hyprland.conf | sort
```

## Keybinding Best Practices

### 1. Start with Defaults

Don't change everything at once. Learn default bindings first, then customize gradually.

### 2. Document Your Bindings

Keep a cheat sheet visible while learning.

### 3. Group Related Functions

Organize bindings logically by function and frequency.

### 4. Use Mnemonic Letters

Make bindings memorable with logical letter choices.

### 5. Layer Modifiers

```bash
$mod+Key           # Basic action
$mod+Shift+Key     # Move/stronger action
$mod+Ctrl+Key      # Alternative action
```

## Next Steps

With mastered keybindings:
1. Automate workflows: [Scripting & Automation](07-scripting-automation.md)
2. Advanced features: [Advanced Configurations](08-advanced-configurations.md)

## Conclusion

Effective keybindings are the difference between a window manager and a workflow. Invest time in designing bindings that match your usage patterns."