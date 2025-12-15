# Best Practices

Essential best practices for managing your Linux rice, dotfiles, backups, and development workflow.

## Table of Contents

1. [Dotfiles Management with Git](#dotfiles-management-with-git)
2. [Backup Strategies](#backup-strategies)
3. [Development Workflow](#development-workflow)
4. [Security Best Practices](#security-best-practices)
5. [Maintenance & Updates](#maintenance--updates)

---

## Dotfiles Management with Git

### Why Use Git for Dotfiles?

- **Version control:** Track changes over time
- **Sync:** Share configs across machines
- **Backup:** Remote repository as backup
- **Collaboration:** Share with community
- **History:** Rollback to working configs

### Method 1: Bare Git Repository (Recommended)

The cleanest approach without symlinks.

**Initial Setup:**

```bash
# Initialize bare repository
git init --bare $HOME/.dotfiles

# Create alias (add to ~/.bashrc or ~/.zshrc)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no
```

**Daily Usage:**

```bash
# Add config file
dotfiles add ~/.config/i3/config

# Commit changes
dotfiles commit -m "Update i3 config"

# Push to remote
dotfiles push origin main

# Check status
dotfiles status

# View diff
dotfiles diff ~/.config/i3/config
```

**Clone to New Machine:**

```bash
# Clone bare repository
git clone --bare https://github.com/USER/dotfiles.git $HOME/.dotfiles

# Create alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout files (backup existing first!)
dotfiles checkout

# If conflicts exist
dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} {}.backup
dotfiles checkout

# Hide untracked
dotfiles config --local status.showUntrackedFiles no
```

### Method 2: Symlink Approach

Traditional approach with a dedicated directory.

**Setup:**

```bash
# Create dotfiles directory
mkdir ~/dotfiles
cd ~/dotfiles
git init

# Move configs and create symlinks
mv ~/.config/i3 ~/dotfiles/.config/
ln -s ~/dotfiles/.config/i3 ~/.config/i3

# Repeat for other configs
mv ~/.zshrc ~/dotfiles/
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

**Using GNU Stow (Simplifies Symlinks):**

```bash
# Install stow
sudo pacman -S stow

# Structure
~/dotfiles/
├── i3/
│   └── .config/
│       └── i3/
│           └── config
├── zsh/
│   └── .zshrc
└── alacritty/
    └── .config/
        └── alacritty/
            └── alacritty.yml

# Apply configs
cd ~/dotfiles
stow i3 zsh alacritty

# Remove configs
stow -D i3
```

### Method 3: Chezmoi (Advanced)

Full-featured dotfiles manager with templating.

```bash
# Install
sudo pacman -S chezmoi

# Initialize
chezmoi init

# Add files
chezmoi add ~/.config/i3/config

# Edit managed files
chezmoi edit ~/.config/i3/config

# Apply changes
chezmoi apply

# Push to remote
chezmoi cd
git add .
git commit -m "Update configs"
git push
```

**Templating (machine-specific configs):**

```bash
# ~/.local/share/chezmoi/.chezmoi.toml.tmpl
[data]
    email = "user@example.com"
    hostname = "{{ .chezmoi.hostname }}"

# Template in config
{{- if eq .chezmoi.hostname "laptop" }}
monitor=eDP-1,1920x1080,0x0,1
{{- else }}
monitor=DP-1,2560x1440,0x0,1
{{- end }}
```

### Dotfiles Organization

**Recommended Structure:**

```
~/dotfiles/
├── .config/
│   ├── alacritty/
│   ├── dunst/
│   ├── fish/
│   ├── hypr/
│   ├── i3/
│   ├── kitty/
│   ├── nvim/
│   ├── picom/
│   ├── polybar/
│   ├── rofi/
│   └── waybar/
├── .local/
│   └── bin/           # Custom scripts
├── .zshrc
├── .bashrc
├── .gitconfig
├── .Xresources
├── install.sh         # Installation script
├── README.md          # Documentation
└── screenshots/       # Rice screenshots
```

### Git Best Practices for Dotfiles

**1. Use .gitignore:**

```bash
# ~/dotfiles/.gitignore
*.log
*.cache
*.swp
*~
.DS_Store
node_modules/
__pycache__/
secrets.conf
```

**2. Never commit secrets:**

```bash
# Use separate file for secrets
source ~/.config/secrets.conf  # Not tracked

# Or use environment variables
export API_KEY="your-key"  # In .zshrc (not committed)
```

**3. Use meaningful commits:**

```bash
# Good
dotfiles commit -m "polybar: add battery module"
dotfiles commit -m "i3: fix workspace keybindings"

# Bad
dotfiles commit -m "update"
dotfiles commit -m "stuff"
```

**4. Branch for experiments:**

```bash
dotfiles checkout -b experimental-theme
# Make changes
dotfiles checkout main  # Return to stable
```

---

## Backup Strategies

### The 3-2-1 Rule

- **3** copies of data
- **2** different storage types
- **1** offsite backup

### Backup Types

**1. Configuration Backups (This Repo's Script):**

```bash
# Quick backup
./scripts/automation/backup-configs.sh

# Compressed with timestamp
./scripts/automation/backup-configs.sh -c -n "before-major-change"

# List backups
./scripts/automation/backup-configs.sh -l

# Restore
./scripts/automation/backup-configs.sh -r 20231215_143022
```

**2. System Snapshots (Timeshift):**

```bash
# Install
sudo pacman -S timeshift

# Create snapshot
sudo timeshift --create --comments "Before rice update"

# Restore
sudo timeshift --restore

# GUI
sudo timeshift-gtk
```

**3. Full System Backup (rsync):**

```bash
# Backup home directory
rsync -avh --progress \
  --exclude='.cache' \
  --exclude='node_modules' \
  --exclude='.local/share/Trash' \
  ~/ /backup/home/

# Restore
rsync -avh --progress /backup/home/ ~/
```

**4. Cloud Backup (rclone):**

```bash
# Install
sudo pacman -S rclone

# Configure remote
rclone config

# Sync to cloud
rclone sync ~/dotfiles remote:dotfiles-backup

# Scheduled backup (cron)
0 2 * * * rclone sync ~/dotfiles remote:dotfiles-backup
```

### What to Backup

**Essential (Always):**
- `~/.config/` - All application configs
- `~/.local/bin/` - Custom scripts
- `~/.zshrc`, `~/.bashrc` - Shell configs
- `~/.ssh/` - SSH keys (encrypted!)
- `~/.gnupg/` - GPG keys (encrypted!)

**Important:**
- `~/Documents/`
- `~/Projects/`
- Browser bookmarks/profiles
- Email configs

**Optional:**
- `~/Downloads/` (usually reproducible)
- `~/Pictures/` (if valuable)
- `~/Music/` (if purchased)

**Never Backup:**
- `~/.cache/` - Regenerated automatically
- `node_modules/` - Reinstall with npm
- `.git/` directories - Clone from remote
- Temporary files

### Automated Backup Script

```bash
#!/bin/bash
# ~/.local/bin/daily-backup.sh

BACKUP_DIR="/backup/daily"
DATE=$(date +%Y%m%d)

# Create today's backup
mkdir -p "$BACKUP_DIR/$DATE"

# Backup configs
tar -czf "$BACKUP_DIR/$DATE/configs.tar.gz" \
  -C ~ .config .zshrc .bashrc .gitconfig

# Backup documents
rsync -av --delete ~/Documents/ "$BACKUP_DIR/$DATE/Documents/"

# Keep only last 7 days
find "$BACKUP_DIR" -maxdepth 1 -type d -mtime +7 -exec rm -rf {} \;

# Sync to cloud
rclone sync "$BACKUP_DIR" remote:backups/

echo "Backup completed: $DATE"
```

**Schedule with systemd timer:**

```bash
# ~/.config/systemd/user/daily-backup.service
[Unit]
Description=Daily Backup

[Service]
Type=oneshot
ExecStart=%h/.local/bin/daily-backup.sh

# ~/.config/systemd/user/daily-backup.timer
[Unit]
Description=Run backup daily

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target

# Enable
systemctl --user enable daily-backup.timer
systemctl --user start daily-backup.timer
```

### Recovery Plan

**Document your setup:**

1. Create `README.md` in dotfiles with:
   - Distribution and version
   - Required packages
   - Installation steps
   - Post-install configuration

2. Keep list of installed packages:
   ```bash
   # Arch
   pacman -Qe > pkglist.txt
   
   # Ubuntu
   apt list --installed > pkglist.txt
   ```

3. Test recovery periodically:
   - Spin up VM
   - Follow your own instructions
   - Fix any issues

---

## Development Workflow

### Editor Integration

**Neovim Configuration:**

```lua
-- ~/.config/nvim/init.lua
-- Auto-reload configs on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*/.config/i3/config" },
  callback = function()
    vim.fn.system("i3-msg reload")
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*/.config/hypr/*.conf" },
  callback = function()
    vim.fn.system("hyprctl reload")
  end,
})
```

**VSCode Settings:**

```json
{
  "files.associations": {
    "*.conf": "ini",
    "*/i3/config": "i3",
    "*/hypr/*.conf": "hyprlang",
    "*.rasi": "css"
  },
  "editor.formatOnSave": true
}
```

### Testing Workflow

**1. Test configs before applying:**

```bash
# i3 syntax check
i3 -C -c ~/.config/i3/config

# Hyprland (no built-in check, use reload)
hyprctl reload

# Shell scripts
shellcheck script.sh
bash -n script.sh
```

**2. Use a testing environment:**

```bash
# Xephyr for X11 (nested X server)
Xephyr :1 -screen 1920x1080 &
DISPLAY=:1 i3

# For Wayland, use a VM or spare TTY
```

**3. Git workflow for changes:**

```bash
# Create feature branch
dotfiles checkout -b new-theme

# Make changes and test
# ...

# If working, merge
dotfiles checkout main
dotfiles merge new-theme

# If broken, discard
dotfiles checkout main
dotfiles branch -D new-theme
```

### Live Reload Development

**Watch for changes and reload:**

```bash
#!/bin/bash
# watch-reload.sh

inotifywait -m -e modify ~/.config/i3/config |
while read -r directory events filename; do
    i3-msg reload
    notify-send "i3 config reloaded"
done
```

**Using entr:**

```bash
# Install
sudo pacman -S entr

# Watch and reload
ls ~/.config/polybar/* | entr -r polybar-msg cmd restart
```

### Debugging Tips

**1. Check logs:**

```bash
# i3 logs
cat ~/.xsession-errors

# Hyprland logs
cat ~/.local/share/hypr/hyprland.log

# System logs
journalctl --user -xe
```

**2. Enable debug mode:**

```bash
# i3 debug
i3 --shmlog-size=26214400
i3-dump-log > i3-debug.log

# Hyprland debug
hyprctl -j monitors  # JSON output
```

**3. Minimal config testing:**

```bash
# Start with minimal config
cp ~/.config/i3/config ~/.config/i3/config.backup
cat > ~/.config/i3/config << 'EOF'
# Minimal test config
set $mod Mod4
bindsym $mod+Return exec alacritty
bindsym $mod+Shift+q kill
bindsym $mod+Shift+r restart
EOF

# Test
i3-msg reload

# Restore
mv ~/.config/i3/config.backup ~/.config/i3/config
```

### Automation

**Pre-commit hooks:**

```bash
# .git/hooks/pre-commit
#!/bin/bash

# Check shell scripts
for file in $(git diff --cached --name-only | grep '\.sh$'); do
    if ! shellcheck "$file"; then
        echo "shellcheck failed on $file"
        exit 1
    fi
done

# Check i3 config
if git diff --cached --name-only | grep -q 'i3/config'; then
    if ! i3 -C; then
        echo "i3 config syntax error"
        exit 1
    fi
fi
```

**Makefile for common tasks:**

```makefile
# ~/dotfiles/Makefile

.PHONY: install backup test lint

install:
	stow -v */

backup:
	./scripts/automation/backup-configs.sh -c

test:
	i3 -C
	shellcheck scripts/**/*.sh

lint:
	shellcheck scripts/**/*.sh
	yamllint .config/**/*.yml

sync:
	git add -A
	git commit -m "Sync: $$(date +%F)"
	git push
```

---

## Security Best Practices

### Never Commit Secrets

**Use .gitignore:**

```bash
# API keys, tokens
secrets.conf
*.secret
.env

# SSH keys
.ssh/id_*
.ssh/known_hosts

# GPG
.gnupg/
```

**Use environment variables:**

```bash
# ~/.zshrc (or separate file not committed)
export GITHUB_TOKEN="your-token"
export API_KEY="your-key"

# In scripts
curl -H "Authorization: Bearer $GITHUB_TOKEN" ...
```

**Use pass or secret-tool:**

```bash
# Install pass
sudo pacman -S pass

# Initialize
pass init your-gpg-id

# Store secret
pass insert api/github-token

# Use in script
TOKEN=$(pass show api/github-token)
```

### File Permissions

```bash
# SSH keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/*.pub

# GPG
chmod 700 ~/.gnupg
chmod 600 ~/.gnupg/*

# Scripts
chmod 755 ~/.local/bin/*
```

### Review Third-Party Configs

Before using configs from others:

1. **Read the code** - Understand what it does
2. **Check for backdoors** - Look for suspicious commands
3. **Verify sources** - Use reputable repositories
4. **Test in VM** - Before applying to main system

---

## Maintenance & Updates

### Regular Maintenance Tasks

**Weekly:**
- Update system packages
- Review and commit config changes
- Clean package cache

```bash
# Update script
./scripts/automation/update-system.sh -a
```

**Monthly:**
- Review installed packages
- Remove unused software
- Update documentation
- Test backup restoration

**Quarterly:**
- Major config review
- Update screenshots
- Check for deprecated features
- Security audit

### Package Management

**Keep track of what you install:**

```bash
# Arch - export package list
pacman -Qe > ~/dotfiles/pkglist.txt

# Install from list
sudo pacman -S --needed - < pkglist.txt

# AUR packages
pacman -Qem > ~/dotfiles/aurlist.txt
```

**Clean up regularly:**

```bash
# Remove orphans
sudo pacman -Rns $(pacman -Qtdq)

# Clean cache
sudo paccache -r
```

### Documentation

**Keep README updated:**

```markdown
# My Dotfiles

## Screenshots
![Rice](screenshots/latest.png)

## Dependencies
- i3-wm
- polybar
- rofi
- alacritty
- picom

## Installation
git clone --bare ...

## Key Features
- Catppuccin theme
- Custom scripts
- ...

## Keybindings
See [keybindings.md](docs/keybindings.md)
```

---

## Quick Reference

### Essential Commands

```bash
# Dotfiles management (bare repo)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles status
dotfiles add ~/.config/FILE
dotfiles commit -m "message"
dotfiles push

# Backup
./scripts/automation/backup-configs.sh -c

# Update
./scripts/automation/update-system.sh -a

# Test configs
i3 -C              # i3 syntax check
shellcheck *.sh    # Shell scripts
```

### Checklist for New Machine

- [ ] Install base system
- [ ] Clone dotfiles repository
- [ ] Install required packages
- [ ] Apply dotfiles
- [ ] Configure SSH keys
- [ ] Set up GPG
- [ ] Configure Git
- [ ] Install fonts
- [ ] Apply theme
- [ ] Test everything
- [ ] Set up backups

---

## See Also

- [Scripting & Automation Guide](07-scripting-automation.md)
- [FAQ](../FAQ.md)
- [Troubleshooting](../wiki/troubleshooting.md)
