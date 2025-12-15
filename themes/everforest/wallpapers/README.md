# Theme Wallpapers

This directory is intended for wallpapers that match the theme's color palette and aesthetic.

## Wallpaper Guidelines

Theme-matching wallpapers should:

- **Use theme colors** as primary or accent colors
- **Match the mood** (e.g., Nord = arctic/winter, Gruvbox = warm/retro)
- **Be high resolution** (1920x1080 minimum, 2560x1440 or 4K recommended)
- **Work well with desktop elements** (avoid busy centers where windows appear)

## Finding Theme-Matching Wallpapers

### Resources

- **Unsplash**: https://unsplash.com - High-quality free photos
- **Wallhaven**: https://wallhaven.cc - Curated wallpaper collection
- **Reddit r/wallpapers**: https://reddit.com/r/wallpapers
- **Theme-specific ports**: Many themes have official wallpaper collections

### Color Filtering

Use color search on wallpaper sites:
- Search by hex code (e.g., `#89b4fa` for Catppuccin blue)
- Filter by color palette
- Look for "minimalist" or "abstract" for less distraction

### Tools

- **Pywal**: Generate color schemes from wallpapers automatically
- **ImageMagick**: Adjust colors to match theme palette
- **GIMP**: Edit and color-correct wallpapers

## Adding Your Own

Place wallpapers here and reference them in your theme configs:

**Hyprland** (`~/.config/hypr/hyprpaper.conf`):
```conf
preload = ~/path/to/themes/[theme-name]/wallpapers/your-wallpaper.jpg
wallpaper = ,~/path/to/themes/[theme-name]/wallpapers/your-wallpaper.jpg
```

**i3wm** (using `feh`):
```bash
feh --bg-scale ~/path/to/themes/[theme-name]/wallpapers/your-wallpaper.jpg
```

## Official Theme Wallpapers

Check the theme's official repository for curated wallpaper collections:
- Many themes provide official wallpaper packs
- Community-created collections often available
- Theme-specific subreddits for sharing

---

**Note**: Wallpapers are not included in this repository due to size constraints. Users should source their own or use the resources above.
