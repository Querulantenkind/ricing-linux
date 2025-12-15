# Installation Scripts

This folder contains helper scripts for installing system packages required by this rice.

Scripts:

- `install-dependencies.sh` — Installs a curated set of useful utilities and fonts.
- `install-hyprland.sh` — Sets up Hyprland and common Wayland tooling (best on Arch).
- `install-i3wm.sh` — Sets up i3 window manager and common utilities across distros.

General notes:

- Scripts attempt to detect the package manager (pacman, apt, dnf) and map packages
  where possible. For some distributions (or bleeding-edge packages like Hyprland),
  manual steps or AUR usage may be required.

- Scripts are interactive by default. Use `-y` to run non-interactively.

Examples:

```bash
# Install common dependencies (interactive)
./install-dependencies.sh

# Install dependencies non-interactively
./install-dependencies.sh -y

# Install Hyprland (Arch recommended)
./install-hyprland.sh

# Install i3wm and common tooling
./install-i3wm.sh
```

Safety:

- Scripts avoid destructive actions and ask for confirmation before performing
  package installations. They are intended to be a convenience, not a replacement
  for reading and understanding the steps they perform.

If you need help customizing package lists or adding distribution-specific steps,
open an issue or submit a PR with suggested changes.