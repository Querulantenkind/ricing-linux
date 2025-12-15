# JetBrains Mono

JetBrains Mono is a free and open-source typeface specifically designed for developers. It features increased height for better readability and optimized letter shapes for extended coding sessions.

![JetBrains Mono Preview](https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/images/ligatures.gif)

## Features

- **Increased x-height**: Better readability of code
- **Programming Ligatures**: Optional ligatures for common code patterns
- **Distinct Characters**: Clear distinction between 0/O, 1/l/I
- **Enhanced Letter Forms**: Letters designed to reduce eye strain
- **8 Weights**: From Thin to ExtraBold
- **Open Source**: Free under the OFL-1.1 license

## Installation

### Arch Linux / Manjaro

```bash
# Official repository
sudo pacman -S ttf-jetbrains-mono

# With Nerd Fonts patches (recommended for icons)
yay -S ttf-jetbrains-mono-nerd
```

### Ubuntu / Debian

```bash
sudo apt install fonts-jetbrains-mono
```

### Fedora

```bash
sudo dnf install jetbrains-mono-fonts
```

### Manual Installation

Download from [JetBrains](https://www.jetbrains.com/lp/mono/):

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download and extract
cd ~/.local/share/fonts
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip
rm JetBrainsMono-2.304.zip

# Update font cache
fc-cache -fv
```

### Nerd Fonts Version

For icons and symbols in terminal:

```bash
cd ~/.local/share/fonts
curl -fLo "JetBrainsMonoNerdFont-Regular.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

curl -fLo "JetBrainsMonoNerdFont-Bold.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/JetBrainsMonoNerdFont-Bold.ttf

fc-cache -fv
```

## Configuration Examples

### Alacritty

```yaml
font:
  normal:
    family: "JetBrains Mono"
    style: Regular
  bold:
    family: "JetBrains Mono"
    style: Bold
  italic:
    family: "JetBrains Mono"
    style: Italic
  size: 11.0

  # Optional: Adjust spacing
  offset:
    x: 0
    y: 1
  glyph_offset:
    x: 0
    y: 0
```

### Kitty

```conf
font_family      JetBrains Mono
bold_font        JetBrains Mono Bold
italic_font      JetBrains Mono Italic
bold_italic_font JetBrains Mono Bold Italic
font_size        11.0

# Enable ligatures
disable_ligatures never

# Optional: Better spacing
adjust_line_height 110%
adjust_column_width 0
```

### Neovim

```lua
-- For GUI clients
vim.opt.guifont = "JetBrains Mono:h11"

-- For terminal, set in terminal emulator
```

### VS Code

```json
{
  "editor.fontFamily": "'JetBrains Mono', monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 13,
  "editor.lineHeight": 22,
  "editor.fontWeight": "400"
}
```

### Hyprland (Waybar)

```css
* {
    font-family: "JetBrains Mono", "Font Awesome 6 Free";
    font-size: 11px;
    font-weight: 500;
}
```

### i3wm (Polybar)

```ini
[bar/main]
font-0 = JetBrains Mono:size=10;2
font-1 = Font Awesome 6 Free:style=Solid:size=10;2
font-2 = JetBrains Mono:style=Bold:size=10;2
```

### Rofi

```rasi
* {
    font: "JetBrains Mono 11";
}
```

### Dunst (Notifications)

```ini
[global]
    font = JetBrains Mono 10
```

## Ligature Examples

JetBrains Mono supports programming ligatures:

```
== === != !== >= <= 
=> ==> <=> -> --> <-
<-- :: |> <| ++ -- 
/* */ /** **/ /// 
|| && ! !! ?: ?. 
.= .- .< .. ... 
;; :: ::: 
```

### Control Ligatures

**Enable in Kitty**:
```conf
disable_ligatures never
```

**Disable in Kitty**:
```conf
disable_ligatures always
```

**Disable for specific characters**:
```conf
disable_ligatures cursor  # Disable only under cursor
```

## Font Weights Available

JetBrains Mono offers 8 weights:

- **Thin** (100)
- **ExtraLight** (200)
- **Light** (300)
- **Regular** (400) ← Recommended for general use
- **Medium** (500) ← Recommended for status bars
- **SemiBold** (600)
- **Bold** (700)
- **ExtraBold** (800)

### Weight Configuration

**Alacritty**:
```yaml
font:
  normal:
    family: "JetBrains Mono"
    style: Medium
```

**Kitty**:
```conf
font_family JetBrains Mono Medium
```

**CSS (Waybar)**:
```css
* {
    font-weight: 500; /* Medium */
}
```

## Styling Tips

### Optimal Size Settings

| Display Resolution | Recommended Size |
|-------------------|------------------|
| 1080p (Full HD)   | 10-11pt         |
| 1440p (2K)        | 11-13pt         |
| 2160p (4K)        | 13-16pt         |

### Line Height Recommendations

For comfortable reading:

**Kitty**:
```conf
adjust_line_height 110%  # 10% increase
```

**VS Code**:
```json
{
  "editor.lineHeight": 1.6
}
```

**CSS**:
```css
* {
    line-height: 1.5;
}
```

### Letter Spacing

For better readability on low-DPI screens:

**CSS (Waybar)**:
```css
* {
    letter-spacing: 0.5px;
}
```

## Comparison with Fira Code

| Feature | JetBrains Mono | Fira Code |
|---------|---------------|-----------|
| x-height | Higher | Lower |
| Letter Width | Wider | Standard |
| Character Spacing | More generous | Compact |
| Best For | Readability | Dense code |
| Weight Options | 8 weights | 5 weights |
| Design Focus | Long coding sessions | Ligatures |

## Advanced Configuration

### Fontconfig (`~/.config/fontconfig/fonts.conf`)

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <!-- JetBrains Mono settings -->
  <match target="font">
    <test name="family" compare="eq">
      <string>JetBrains Mono</string>
    </test>
    <edit name="hinting" mode="assign">
      <bool>true</bool>
    </edit>
    <edit name="hintstyle" mode="assign">
      <const>hintslight</const>
    </edit>
    <edit name="antialias" mode="assign">
      <bool>true</bool>
    </edit>
    <edit name="rgba" mode="assign">
      <const>rgb</const>
    </edit>
    <edit name="lcdfilter" mode="assign">
      <const>lcddefault</const>
    </edit>
  </match>
</fontconfig>
```

### Using with Polybar (i3wm)

For crisp icons and text:

```ini
[bar/main]
; Regular text
font-0 = JetBrains Mono:style=Medium:size=10;2

; Icons
font-1 = Font Awesome 6 Free:style=Solid:size=10;2
font-2 = Font Awesome 6 Brands:style=Regular:size=10;2

; Bold text for focused workspace
font-3 = JetBrains Mono:style=Bold:size=10;2
```

### Using with Waybar (Hyprland)

```jsonc
{
    "layer": "top",
    "modules-left": ["hyprland/workspaces"],
    // ... other config
}
```

```css
* {
    font-family: "JetBrains Mono", "Font Awesome 6 Free";
    font-size: 11px;
    font-weight: 500;
}

#workspaces button.active {
    font-weight: 700; /* Bold for active */
}
```

## Troubleshooting

### Font not found

Verify installation:
```bash
fc-list | grep -i "jetbrains"
```

Expected output:
```
JetBrains Mono
JetBrains Mono,JetBrains Mono Medium
JetBrains Mono,JetBrains Mono Bold
...
```

### Ligatures not working

1. Check if ligatures are enabled in your application
2. Verify font supports ligatures: `fc-list "JetBrains Mono" | grep -i liga`
3. Use exact font family name (case-sensitive)

### Missing icons in terminal

Install Nerd Fonts version:
```bash
yay -S ttf-jetbrains-mono-nerd
```

Use font family: `JetBrainsMono Nerd Font`

### Blurry or pixelated text

Enable font rendering:

```bash
# Edit ~/.config/fontconfig/fonts.conf
# Add hinting and antialiasing (see Advanced Configuration above)

# Reload font cache
fc-cache -fv
```

### Wrong weight being used

Specify weight explicitly:

**Kitty**:
```conf
font_family JetBrains Mono Medium
```

**Alacritty**:
```yaml
font:
  normal:
    family: "JetBrains Mono"
    style: Medium
```

## Using with Nerd Fonts

For terminal prompts and status bars with icons:

```bash
# Install Nerd Fonts version
yay -S ttf-jetbrains-mono-nerd

# Verify installation
fc-list | grep -i "jetbrains.*nerd"
```

Configuration:
```conf
# Kitty
font_family JetBrainsMono Nerd Font

# Alacritty
font:
  normal:
    family: "JetBrainsMono Nerd Font"
```

## Resources

- [Official Website](https://www.jetbrains.com/lp/mono/)
- [GitHub Repository](https://github.com/JetBrains/JetBrainsMono)
- [Font Specimen](https://www.jetbrains.com/lp/mono/#specimens)
- [Design Philosophy](https://www.jetbrains.com/lp/mono/#design)
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## Screenshots

Check out JetBrains Mono in action:
- [Terminal configurations](../../../configs/)
- [Theme examples](../../../themes/)
- [Screenshots](../../screenshots/)

## License

JetBrains Mono is licensed under the [OFL-1.1](https://github.com/JetBrains/JetBrainsMono/blob/master/OFL.txt)
