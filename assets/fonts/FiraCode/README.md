# Fira Code

Fira Code is a free monospaced font with programming ligatures. It is an extension of the Fira Mono font containing a set of ligatures for common programming multi-character combinations.

![Fira Code Preview](https://raw.githubusercontent.com/tonsky/FiraCode/master/showcases/all_ligatures.png)

## Features

- **Programming Ligatures**: Combines multiple characters into single glyphs
- **Extensive Language Support**: Supports Latin, Cyrillic, and Greek scripts
- **Clear Distinction**: Clear distinction between similar characters (0/O, 1/l/I)
- **Retina-ready**: Optimized for both regular and high-DPI displays
- **Open Source**: Free under the SIL Open Font License

## Installation

### Arch Linux / Manjaro

```bash
# Official repository
sudo pacman -S ttf-fira-code

# With Nerd Fonts patches (recommended)
yay -S ttf-firacode-nerd
```

### Ubuntu / Debian

```bash
sudo apt install fonts-firacode
```

### Fedora

```bash
sudo dnf install fira-code-fonts
```

### Manual Installation

Download from [GitHub Releases](https://github.com/tonsky/FiraCode/releases):

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download and extract
cd ~/.local/share/fonts
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip
rm Fira_Code_v6.2.zip

# Update font cache
fc-cache -fv
```

## Configuration Examples

### Alacritty

```yaml
font:
  normal:
    family: "Fira Code"
    style: Regular
  bold:
    family: "Fira Code"
    style: Bold
  italic:
    family: "Fira Code"
    style: Italic
  size: 11.0
```

### Kitty

```conf
font_family      Fira Code
bold_font        Fira Code Bold
italic_font      Fira Code Italic
font_size        11.0

# Enable ligatures
disable_ligatures never
```

### Neovim

```lua
vim.opt.guifont = "Fira Code:h11"
```

### VS Code

```json
{
  "editor.fontFamily": "'Fira Code', monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 13
}
```

### i3 Status Bar / i3status

```conf
font pango:Fira Code 10
```

### Rofi

```rasi
* {
    font: "Fira Code 11";
}
```

## Ligature Examples

Fira Code includes ligatures for common programming sequences:

```
!= !=== == === => ==> >= <=
-> --> <-  <-- <=> <!--
:: ::: ++ +++ && || 
www <!-- ## ### ####
/* */ /** **/ ///
</ /> </> ~@ ~-
```

### Disable Ligatures (if needed)

**Alacritty**: Ligatures are enabled by default, cannot be disabled

**Kitty**:
```conf
disable_ligatures always
```

**VS Code**:
```json
{
  "editor.fontLigatures": false
}
```

## Font Weights Available

- **Light** (300)
- **Regular** (400)
- **Medium** (500)
- **SemiBold** (600)
- **Bold** (700)

## Character Support

- Latin Extended (Western and Central European languages)
- Cyrillic
- Greek
- Programming symbols and operators
- Box drawing characters
- Powerline symbols (Nerd Font version)

## Comparison with JetBrains Mono

| Feature | Fira Code | JetBrains Mono |
|---------|-----------|----------------|
| Ligatures | ✓ | ✓ |
| Character Height | Taller | Standard |
| Letter Spacing | Tighter | Wider |
| Best For | Compact displays | Readability |
| x-height | Lower | Higher |

## Tips

### Optimal Size Settings

- **1080p Display**: 10-11pt
- **1440p Display**: 11-13pt
- **4K Display**: 13-15pt

### Line Spacing

For better readability, increase line spacing:

**Kitty**:
```conf
adjust_line_height 120%
```

**Alacritty**:
```yaml
font:
  offset:
    y: 2
```

### Use with Powerline

For status lines with special symbols, use the Nerd Fonts version:

```bash
yay -S ttf-firacode-nerd
```

Then use `FiraCode Nerd Font` as the font family.

## Troubleshooting

### Ligatures not working

1. Ensure ligatures are enabled in your application
2. Check font name: `fc-list | grep -i fira`
3. Use exact font family name: `Fira Code` (not `FiraCode`)

### Missing icons/symbols

Install the Nerd Fonts version:
```bash
yay -S ttf-firacode-nerd
```

### Blurry text

Enable font hinting:

**Kitty**:
```conf
font_features FiraCode-Regular +ss01 +ss02
```

**Fontconfig** (`~/.config/fontconfig/fonts.conf`):
```xml
<match target="font">
  <test name="family" compare="eq">
    <string>Fira Code</string>
  </test>
  <edit name="hinting" mode="assign">
    <bool>true</bool>
  </edit>
  <edit name="hintstyle" mode="assign">
    <const>hintslight</const>
  </edit>
</match>
```

## Resources

- [Official Repository](https://github.com/tonsky/FiraCode)
- [Ligature Guide](https://github.com/tonsky/FiraCode/wiki/How-to-enable-ligatures)
- [Character Table](https://github.com/tonsky/FiraCode/wiki/Character-Table)
- [Stylistic Sets](https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets)

## License

Fira Code is licensed under the [SIL Open Font License 1.1](https://github.com/tonsky/FiraCode/blob/master/LICENSE)
