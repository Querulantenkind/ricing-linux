# Understanding Tiling Window Managers

This guide explains the core concepts of tiling window managers (WMs) and how they differ from traditional desktop environments.

## What is a Window Manager?

A window manager is software that controls the placement and appearance of windows in a graphical user interface. Unlike full desktop environments (like GNOME or KDE), window managers focus solely on window management, making them lighter and more customizable.

## Types of Window Managers

### Floating Window Managers
Traditional style where windows can overlap and be freely moved/resized.

**Examples:** Openbox, Fluxbox

**Characteristics:**
- Windows can be placed anywhere
- Windows can overlap each other
- Familiar to most users
- Requires mouse for efficient use

### Tiling Window Managers
Windows automatically arrange in non-overlapping tiles.

**Examples:** i3, Hyprland, bspwm, dwm

**Characteristics:**
- Windows never overlap
- Automatic layout management
- Maximum screen space utilization
- Keyboard-driven workflow

### Dynamic Window Managers
Can switch between tiling and floating modes.

**Examples:** dwm, awesome, xmonad

**Characteristics:**
- Flexibility between modes
- Can tile some windows, float others
- Best of both worlds
- More complex to configure

## Core Concepts of Tiling WMs

### 1. Workspaces

Workspaces (also called virtual desktops) are separate screen areas for organizing windows.

**Why Use Workspaces?**
- Group related tasks together
- Reduce visual clutter
- Quick switching between contexts
- Mental separation of work areas

**Common Workspace Schemes:**
```
1: Web browsing
2: Development/coding
3: Communication (email, chat)
4: Media (music, videos)
5: Documentation
6-9: Flexible/temporary
```

### 2. Layouts

Layouts determine how windows are arranged.

**Common Layouts:**

**Split (Default in i3/Hyprland):**
```
+------------+------------+
|            |            |
|     1      |     2      |
|            |            |
+------------+------------+
```

**Vertical Split:**
```
+-----------------------+
|          1            |
+-----------------------+
|          2            |
+-----------------------+
```

**Master-Stack (Hyprland):**
```
+-------------+---------+
|             |    2    |
|      1      +---------+
|   (Master)  |    3    |
+-------------+---------+
```

**Tabbed:**
```
+-----------------------+
| Tab1 | Tab2 | Tab3    |
+-----------------------+
|                       |
|    Active Window      |
|                       |
+-----------------------+
```

**Stacked:**
```
+-----------------------+
|      Window 1         |
+-----------------------+
|      Window 2         |
+-----------------------+
|                       |
|    Active Window 3    |
|                       |
+-----------------------+
```

### 3. Containers

Containers hold windows and determine their layout.

**Container Tree (i3 concept):**
```
Workspace
  ├─ Container (horizontal split)
  │   ├─ Window A
  │   └─ Window B
  └─ Container (vertical split)
      ├─ Window C
      └─ Window D
```

### 4. Focus

The focused window receives keyboard input.

**Focus Movement:**
- Move focus to adjacent windows
- Move focus to specific workspace
- Follow focus to moved window (optional)

**Visual Indicators:**
- Border color (focused vs unfocused)
- Border thickness
- Title bar color

### 5. Floating Mode

Even tiling WMs support floating windows when needed.

**When to Float:**
- Dialog boxes
- Preference windows
- Calculator or small tools
- Windows that work better floating

**Floating Controls:**
- Toggle between tiling and floating
- Move floating windows
- Resize floating windows
- Center floating windows

## Window Management Operations

### Opening Windows

New windows typically:
1. Open in the current workspace
2. Fill available space
3. Split existing window

**Example in i3:**
```
Start:           Split horizontal:    Split vertical:
+-----------+    +-----+-----+         +-----+-----+
|           |    |     |     |         |     |  2  |
|     1     | -> |  1  |  2  |    ->   |  1  +-----+
|           |    |     |     |         |     |  3  |
+-----------+    +-----+-----+         +-----+-----+
```

### Moving Windows

Move windows between:
- Positions within workspace
- Different workspaces
- Different monitors

### Resizing Windows

Resize by:
- Adjusting splits between windows
- Growing/shrinking windows
- Entering resize mode

### Closing Windows

Closed windows:
- Free up their space
- Remaining windows expand
- Focus moves to adjacent window

## Keyboard-Driven Workflow

Tiling WMs are designed for keyboard efficiency.

### Modal Keybindings

**Modifier Key (Mod):**
A key held while pressing other keys.
- Usually Super (Windows) key
- Sometimes Alt key
- Chosen at configuration

**Common Keybinding Patterns:**
```
Mod + Key         : Action
Mod + Shift + Key : Move/stronger action
Mod + Ctrl + Key  : Resize/alternative
Mod + Alt + Key   : Special action
```

### Essential Operations

**Navigation:**
- `Mod + h/j/k/l`: Move focus (vim-style)
- `Mod + Left/Right/Up/Down`: Move focus (arrow keys)
- `Mod + [1-9]`: Switch workspace

**Window Management:**
- `Mod + Enter`: New terminal
- `Mod + Shift + q`: Close window
- `Mod + f`: Fullscreen
- `Mod + Space`: Toggle floating

**Moving:**
- `Mod + Shift + h/j/k/l`: Move window
- `Mod + Shift + [1-9]`: Move to workspace

**Layouts:**
- `Mod + e`: Split horizontal
- `Mod + v`: Split vertical
- `Mod + s`: Stacking layout
- `Mod + w`: Tabbed layout

## Advantages of Tiling WMs

### 1. Maximum Screen Utilization
- No wasted space
- All windows visible
- No overlapping
- Efficient use of large monitors

### 2. Keyboard Efficiency
- Rarely need mouse
- Fast window navigation
- Consistent keybindings
- Reduced hand movement

### 3. Automatic Management
- No manual window arrangement
- Consistent layouts
- Predictable behavior
- Focus on work, not window management

### 4. Lightweight
- Minimal resource usage
- Fast startup
- No unnecessary features
- Runs on older hardware

### 5. Customization
- Highly configurable
- Text-based configuration
- Scriptable actions
- Integrate with any tools

### 6. Workflow Optimization
- Workspace-based organization
- Quick context switching
- Distraction-free environment
- Reproducible setups

## Challenges and Learning Curve

### Initial Challenges

**1. Breaking Muscle Memory**
- Reaching for mouse
- Expecting windows to overlap
- Different window management concepts

**Solution:** Give it 2 weeks of consistent use

**2. Learning Keybindings**
- Many new shortcuts
- Different from traditional desktops
- Need to build muscle memory

**Solution:** Keep a cheat sheet handy, practice daily

**3. Configuration Required**
- More setup than GNOME/KDE
- Text file configuration
- Need to choose components

**Solution:** Use this repository's configs as starting point

**4. Troubleshooting**
- More components to debug
- Less GUI tools
- Need terminal comfort

**Solution:** Use documentation, ask community

### The Learning Curve

```
Productivity
    ^
    |                   /‾‾‾‾‾‾  (Expert level)
    |                  /
    |                 /
    |                /
    |               /
    |              /
    |  ‾‾‾‾‾     /  (Traditional DE)
    | /      \   /
    |/        \ /  (Learning dip)
    +───────────────> Time
    0     1w    2w    1m    3m
```

**Week 1:** Frustrating, slower than before
**Week 2:** Starting to feel natural
**Month 1:** Comfortable, as fast as before
**Month 3:** Faster than traditional desktop

## Best Practices

### 1. Start Simple
- Use default keybindings first
- Don't customize everything immediately
- Learn one feature at a time
- Master basics before advanced features

### 2. Use Workspaces Consistently
- Assign specific purposes
- Develop muscle memory for workspace numbers
- Use workspace-specific rules

### 3. Minimize Floating Windows
- Use floating sparingly
- Prefer tiling when possible
- Set automatic float rules for appropriate windows

### 4. Customize Gradually
- Make small changes
- Test each change
- Keep notes on what you change
- Back up working configurations

### 5. Learn Keyboard Shortcuts
- Practice daily
- Start with essential shortcuts
- Add more as you learn
- Create mnemonics for remember

### 6. Organize Your Workflow
- Plan workspace usage
- Use window rules for automation
- Create scripts for common tasks
- Optimize for your specific needs

## Comparison to Desktop Environments

### Desktop Environments (GNOME, KDE, XFCE)

**Pros:**
- Complete out-of-box experience
- GUI configuration tools
- Integrated applications
- Easier for beginners
- Familiar to most users

**Cons:**
- Higher resource usage
- Less customizable
- More opinionated defaults
- Slower to use (more mouse)

### Tiling Window Managers

**Pros:**
- Lightweight and fast
- Highly customizable
- Keyboard-driven efficiency
- Minimalist approach
- Learn about your system

**Cons:**
- Steeper learning curve
- More initial configuration
- Need to choose components
- Less discoverable features

## Is a Tiling WM Right for You?

### Good Fit If You:
- Spend most time in terminal/text editors
- Value keyboard efficiency
- Like to understand your system
- Want maximum customization
- Have limited resources
- Enjoy minimalist setups
- Work with multiple applications simultaneously

### Maybe Not If You:
- Need full GUI for everything
- Use mostly mouse-driven applications
- Want zero configuration
- Need hand-holding
- Primarily use single full-screen applications
- Can't invest time in learning

## Next Steps

Now that you understand tiling WMs:

1. Choose your WM:
   - [Hyprland Basics](03-hyprland-basics.md)
   - [i3wm Basics](04-i3wm-basics.md)

2. Learn practical usage:
   - [Customizing Appearance](05-customizing-appearance.md)
   - [Keybindings Explained](06-keybindings-explained.md)

3. Read reference materials:
   - [Terminology](../wiki/terminology.md)
   - [Keybindings Cheatsheet](../references/keybindings-cheatsheet.md)

## Conclusion

Tiling window managers represent a different paradigm in desktop computing. They prioritize efficiency, keyboard control, and automatic management over traditional manual window placement. While they require an initial investment of time to learn, many users find the productivity gains and customization possibilities well worth the effort.

The key is to approach them with patience, start with the basics, and gradually build your skills and configuration. Remember: everyone who's now proficient started exactly where you are now.