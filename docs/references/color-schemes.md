# Color Schemes Reference

This guide covers popular color schemes used in the Linux ricing community, their characteristics, and how to apply them.

## Popular Color Schemes

### Catppuccin

**Variants:** Latte, Frappe, Macchiato, Mocha

**Description:** Modern, pastel-based color scheme with excellent contrast and readability. One of the most popular schemes in the ricing community.

**Mocha (Dark) Palette:**
```
Base Colors:
Background:  #1e1e2e
Foreground:  #cdd6f4
Cursor:      #f5e0dc

Normal Colors:
Black:       #45475a
Red:         #f38ba8
Green:       #a6e3a1
Yellow:      #f9e2af
Blue:        #89b4fa
Magenta:     #f5c2e7
Cyan:        #94e2d5
White:       #bac2de

Bright Colors:
Bright Black:   #585b70
Bright Red:     #f38ba8
Bright Green:   #a6e3a1
Bright Yellow:  #f9e2af
Bright Blue:    #89b4fa
Bright Magenta: #f5c2e7
Bright Cyan:    #94e2d5
Bright White:   #a6adc8

Accent Colors:
Rosewater:   #f5e0dc
Flamingo:    #f2cdcd
Pink:        #f5c2e7
Mauve:       #cba6f7
Red:         #f38ba8
Maroon:      #eba0ac
Peach:       #fab387
Yellow:      #f9e2af
Green:       #a6e3a1
Teal:        #94e2d5
Sky:         #89dceb
Sapphire:    #74c7ec
Blue:        #89b4fa
Lavender:    #b4befe
```

**Best For:** Modern, cohesive aesthetic. Works well for all applications. Great for long coding sessions.

**Available in this repo:** `themes/catppuccin/`

### Nord

**Description:** Arctic, bluish color scheme. Clean and professional appearance.

**Palette:**
```
Polar Night (Dark):
nord0:  #2e3440  (Background)
nord1:  #3b4252  (Lighter bg)
nord2:  #434c5e  (Selection bg)
nord3:  #4c566a  (Comments)

Snow Storm (Light):
nord4:  #d8dee9  (Foreground light)
nord5:  #e5e9f0  (Foreground)
nord6:  #eceff4  (Foreground bright)

Frost (Blue tones):
nord7:  #8fbcbb  (Cyan)
nord8:  #88c0d0  (Bright cyan)
nord9:  #81a1c1  (Blue)
nord10: #5e81ac  (Bright blue)

Aurora (Accent colors):
nord11: #bf616a  (Red)
nord12: #d08770  (Orange)
nord13: #ebcb8b  (Yellow)
nord14: #a3be8c  (Green)
nord15: #b48ead  (Purple)
```

**Best For:** Professional environments, minimalist setups, blue color lovers.

**Available in this repo:** `themes/nord/`

### Dracula

**Description:** Dark theme with vibrant, saturated colors. High contrast and distinctive purple background.

**Palette:**
```
Base Colors:
Background:     #282a36
Current Line:   #44475a
Foreground:     #f8f8f2
Comment:        #6272a4
Cyan:           #8be9fd
Green:          #50fa7b
Orange:         #ffb86c
Pink:           #ff79c6
Purple:         #bd93f9
Red:            #ff5555
Yellow:         #f1fa8c

ANSI Colors:
Black:          #21222c
Bright Black:   #6272a4
White:          #f8f8f2
Bright White:   #ffffff
```

**Best For:** Vibrant, eye-catching setups. Good for creative work. Popular in streaming/content creation.

**Available in this repo:** `themes/dracula/`

### Gruvbox

**Variants:** Dark (hard, medium, soft), Light

**Description:** Retro groove color scheme with warm, earthy tones. Excellent for reduced eye strain.

**Dark Medium Palette:**
```
Background:  #282828
Foreground:  #ebdbb2

Normal:
Black:       #282828
Red:         #cc241d
Green:       #98971a
Yellow:      #d79921
Blue:        #458588
Magenta:     #b16286
Cyan:        #689d6a
White:       #a89984

Bright:
Black:       #928374
Red:         #fb4934
Green:       #b8bb26
Yellow:      #fabd2f
Blue:        #83a598
Magenta:     #d3869b
Cyan:        #8ec07c
White:       #ebdbb2

Grays:
gray0:       #282828
gray1:       #3c3836
gray2:       #504945
gray3:       #665c54
gray4:       #7c6f64
```

**Best For:** Warm, comfortable aesthetic. Great for extended use. Retro computing enthusiasts.

**Available in this repo:** `themes/gruvbox/`

### Tokyo Night

**Variants:** Night, Storm, Day

**Description:** Modern dark theme inspired by Tokyo's night skyline. Clean and contemporary.

**Night Palette:**
```
Background:     #1a1b26
Foreground:     #c0caf5

Terminal Colors:
Black:          #15161e
Red:            #f7768e
Green:          #9ece6a
Yellow:         #e0af68
Blue:           #7aa2f7
Magenta:        #bb9af7
Cyan:           #7dcfff
White:          #a9b1d6

Bright:
Bright Black:   #414868
Bright Red:     #f7768e
Bright Green:   #9ece6a
Bright Yellow:  #e0af68
Bright Blue:    #7aa2f7
Bright Magenta: #bb9af7
Bright Cyan:    #7dcfff
Bright White:   #c0caf5

Accents:
Orange:         #ff9e64
Green:          #73daca
Blue:           #2ac3de
```

**Best For:** Modern, sleek setups. Good contrast. Popular with developers.

**Available in this repo:** `themes/tokyo-night/`

## Other Notable Schemes

### Solarized
**Description:** Scientific color scheme designed for reduced eye strain
**Variants:** Dark, Light
**Best For:** Long reading/coding sessions, academic work

### One Dark
**Description:** Atom's iconic dark theme
**Best For:** Familiar to many developers, balanced colors

### Everforest
**Description:** Green forest inspired theme
**Best For:** Nature lovers, calming aesthetic

### Rose Pine
**Description:** Low-contrast theme with muted colors
**Best For:** Reduced eye strain, subtle beauty

### Monokai
**Description:** Vibrant, high-contrast theme
**Best For:** Syntax highlighting, code editing

## Choosing a Color Scheme

### Factors to Consider

**1. Personal Preference**
- What colors appeal to you?
- Warm or cool tones?
- Vibrant or muted?

**2. Use Case**
- Coding: Need good syntax highlighting
- Writing: Need comfortable reading colors
- Design: Need accurate color representation

**3. Environment**
- Ambient lighting conditions
- Time of day (may want dark/light variants)
- Screen type and calibration

**4. Eye Strain**
- High contrast can cause fatigue
- Very low contrast reduces readability
- Warm tones generally easier on eyes

**5. Consistency**
- Does it have wide application support?
- Can you theme all your tools with it?

## Applying Color Schemes

### Using This Repository

```bash
cd ~/Documents/ricing-linux/themes
./apply-theme.sh catppuccin
```

This applies the theme to:
- Window manager
- Status bar
- Terminal
- Application launcher
- Notification daemon
- GTK applications

### Manual Application

**Terminal (Alacritty):**
```yaml
# ~/.config/alacritty/alacritty.yml
colors:
  primary:
    background: '#1e1e2e'
    foreground: '#cdd6f4'
  normal:
    black:   '#45475a'
    red:     '#f38ba8'
    # ... rest of colors
```

**i3wm:**
```bash
# ~/.config/i3/config
set $bg     #1e1e2e
set $fg     #cdd6f4
set $accent #89b4fa

client.focused          $accent $accent $bg $accent $accent
client.focused_inactive $bg     $bg     $fg $bg     $bg
# ... more rules
```

**Hyprland:**
```bash
# ~/.config/hypr/hyprland.conf
general {
    col.active_border = rgb(89b4fa)
    col.inactive_border = rgb(45475a)
}
```

## Creating Custom Color Schemes

### Color Theory Basics

**1. Choose Base Colors**
- Background (darkest or lightest)
- Foreground (main text)
- Select these first

**2. Select Accent Colors**
- Use color wheel for harmony
- Complementary: Opposite colors
- Analogous: Adjacent colors
- Triadic: Three evenly spaced colors

**3. Test Contrast**
- Use WCAG contrast checker
- Aim for 4.5:1 minimum for text
- 7:1 for better accessibility

**4. Define Terminal Colors**
Need 16 colors:
- 8 normal (black, red, green, yellow, blue, magenta, cyan, white)
- 8 bright versions

### Tools for Creating Themes

**Terminal.sexy**
- Web-based terminal color scheme designer
- Export to various formats
- https://terminal.sexy

**Coolors.co**
- Generate color palettes
- Test combinations
- Export hex codes

**Pywal**
- Generate color scheme from wallpaper
- Automatic theme generation
```bash
wal -i /path/to/wallpaper.jpg
```

## Testing Color Schemes

### Before Committing

1. **Test in Different Lighting**
   - Bright daylight
   - Indoor lighting
   - Night/dim conditions

2. **Test with Real Content**
   - Code in your main language
   - Read long documents
   - Use for several hours

3. **Test All Applications**
   - Terminal
   - Editor
   - Browser
   - File manager

### Quick Preview Script

```bash
#!/bin/bash
# preview-colors.sh

for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i
    if [ $((($i + 1) % 8)) == 0 ]; then
        echo
    fi
done
```

## Color Scheme Resources

### Websites
- **Terminal.sexy**: Theme designer
- **Gogh**: Terminal color scheme collection
- **Base16**: Universal color scheme framework
- **iTerm2 Color Schemes**: Large collection

### Repositories
- **github.com/mbadolato/iTerm2-Color-Schemes**: 250+ themes
- **github.com/chriskempson/base16**: Base16 themes
- **github.com/catppuccin/catppuccin**: Catppuccin everywhere

## Troubleshooting

### Colors Look Different

**Check terminal support:**
```bash
echo $TERM  # Should be xterm-256color or similar
```

**Test 256 color support:**
```bash
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
```

### GTK Apps Don't Match

Set GTK theme:
```bash
# ~/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name=Catppuccin-Mocha
gtk-icon-theme-name=Papirus-Dark
```

### Transparent Colors

Add alpha channel:
```
#1e1e2e    # Solid
#1e1e2ecc  # 80% opacity
#1e1e2e99  # 60% opacity
```

## Conclusion

Color schemes are highly personal. What works for one person may not work for another. This repository includes several popular options, but don't hesitate to:

- Try multiple themes
- Create your own
- Mix and match elements
- Change themes seasonally

The best color scheme is the one that you're comfortable looking at all day, every day.