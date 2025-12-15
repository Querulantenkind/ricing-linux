# Scripts

This directory contains utility scripts for managing, automating, and maintaining your Linux rice.

## Directory Structure

```
scripts/
├── automation/         # Automation and maintenance scripts
│   ├── backup-configs.sh    # Configuration backup/restore
│   ├── rice-switcher.sh     # Theme switching utility
│   └── update-system.sh     # System update helper
├── installation/       # Installation scripts
│   ├── install-dependencies.sh
│   ├── install-hyprland.sh
│   ├── install-i3wm.sh
│   └── README.md
└── utilities/          # Daily use utilities
    ├── audio-control.sh
    ├── brightness.sh
    ├── power-menu.sh
    ├── screen-record.sh
    └── screenshot.sh
```

## Automation Scripts

### backup-configs.sh

Backup and restore your configuration files with timestamped archives.

```bash
# Create a backup
./automation/backup-configs.sh

# Create compressed backup
./automation/backup-configs.sh -c

# Create named backup
./automation/backup-configs.sh -n "before-big-change"

# List all backups
./automation/backup-configs.sh -l

# Restore a backup
./automation/backup-configs.sh -r 20231215_143022
```

**Features:**
- Backs up all rice-related config directories
- Creates timestamped or named backups
- Optional compression (tar.gz)
- Easy restoration
- Metadata logging

### rice-switcher.sh

Switch between different theme configurations quickly.

```bash
# Apply a theme
./automation/rice-switcher.sh catppuccin

# List available themes
./automation/rice-switcher.sh -l

# Preview theme colors
./automation/rice-switcher.sh -p nord

# Full switch with backup and reload
./automation/rice-switcher.sh -b -r -w tokyo-night

# Interactive selection (requires fzf)
./automation/rice-switcher.sh -i

# Dry run (see what would change)
./automation/rice-switcher.sh -d dracula
```

**Features:**
- Applies color schemes from themes directory
- Backs up before switching (optional)
- Reloads applications after switching
- Sets matching wallpaper
- Interactive theme selection with fzf
- Dry-run mode

### update-system.sh

Comprehensive system update helper with cleanup options.

```bash
# Update system packages
./automation/update-system.sh

# Full update (system + flatpak + cleanup)
./automation/update-system.sh -a

# Update with notification
./automation/update-system.sh -a -y -n

# Only clean system
./automation/update-system.sh -c

# Update flatpak only
./automation/update-system.sh -f
```

**Features:**
- Auto-detects distribution (Arch, Debian, Fedora)
- Supports AUR helpers (yay, paru)
- Flatpak updates
- System cleanup (orphans, cache)
- Desktop notifications
- Logging

## Utility Scripts

### `audio-control.sh`

Control system volume and mute state. Supports `pamixer` and `pactl`.

```bash
# Increase volume by 5%
./utilities/audio-control.sh up 5

# Mute/unmute
./utilities/audio-control.sh toggle

# Show current volume
./utilities/audio-control.sh show
```

### `brightness.sh`

Control screen brightness. Uses `brightnessctl`, `light` or `xbacklight`.

```bash
# Increase brightness by 10%
./utilities/brightness.sh up 10

# Set brightness to 50%
./utilities/brightness.sh set 50
```

### `power-menu.sh`

Interactive power menu using `rofi` or `dmenu` with options: Lock, Suspend, Reboot, Shutdown, Logout.

```bash
# Run power menu
./utilities/power-menu.sh

# Skip confirmation
./utilities/power-menu.sh --no-confirm
```

### `screen-record.sh`

Start/stop screen recordings using `wf-recorder` or `ffmpeg`.

```bash
# Start recording (default filename)
./utilities/screen-record.sh start

# Stop recording
./utilities/screen-record.sh stop
```

### `screenshot.sh`

Take screenshots for Wayland (grim/slurp) or X11 (maim/scrot) and optionally copy to clipboard.

```bash
# Fullscreen
./utilities/screenshot.sh full

# Region selection
./utilities/screenshot.sh region

# Region selection and copy to clipboard
./utilities/screenshot.sh clipboard
```

### Making them executable

```bash
chmod +x scripts/utilities/*.sh
```


## Making Scripts Executable

```bash
# Make all scripts executable
chmod +x scripts/**/*.sh

# Or individually
chmod +x scripts/automation/backup-configs.sh
chmod +x scripts/automation/rice-switcher.sh
chmod +x scripts/automation/update-system.sh
```

## Quick Reference

| Script | Purpose | Common Usage |
|--------|---------|--------------|
| backup-configs.sh | Backup configs | `./backup-configs.sh -c` |
| rice-switcher.sh | Switch themes | `./rice-switcher.sh -i` |
| update-system.sh | Update system | `./update-system.sh -a` |

## Best Practices

1. **Always backup first**: Run `backup-configs.sh` before major changes
2. **Test in dry-run**: Use `-d` flag to preview changes
3. **Keep logs**: Check `/tmp/` for log files
4. **Regular updates**: Run `update-system.sh -a` weekly

## Dependencies

Some scripts require additional tools:

```bash
# Arch Linux
sudo pacman -S fzf tar gzip

# For notifications
sudo pacman -S libnotify

# For AUR (recommended)
yay -S paru  # or keep using yay
```

## Customization

Scripts can be customized by editing variables at the top:

```bash
# Example: Change backup location
BACKUP_BASE_DIR="$HOME/my-backups"

# Example: Add custom config paths
CONFIG_DIRS+=("$HOME/.config/my-app")
```

## See Also

- [Installation Scripts](installation/README.md)
- [Utility Scripts](utilities/README.md)
- [Theme Documentation](../themes/README.md)
- [Automation Guide](../docs/guides/07-scripting-automation.md)