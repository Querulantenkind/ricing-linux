# Status Bars Comparison

A comprehensive comparison of status bars for tiling window managers.

## Overview

Status bars display system information and workspace status at the edge of your screen. This guide compares the most popular options.

## Quick Comparison

| Feature | Polybar | Waybar | i3status | i3blocks | lemonbar | Eww |
|---------|---------|--------|----------|----------|----------|-----|
| **Protocol** | X11 | Wayland | X11/Wayland | X11 | X11 | Both |
| **Config Format** | INI | JSON | Config file | Config file | stdin | Yuck/XML |
| **Built-in Modules** | Extensive | Extensive | Limited | Limited | None | None |
| **Styling** | Colors/fonts | CSS | Limited | Limited | Minimal | CSS-like |
| **Tray Support** | Yes | Yes | No | No | No | Yes |
| **Complexity** | Medium | Medium | Low | Low | High | High |
| **Active Development** | Yes | Yes | Yes | Yes | Minimal | Yes |
| **Memory Usage** | ~20-30 MB | ~15-25 MB | ~5-10 MB | ~5-10 MB | ~5 MB | ~30-50 MB |

## Polybar (X11)

### Overview

Polybar is a fast and feature-rich status bar for X11 window managers.

**Pros:**
- Extensive built-in modules
- Highly customizable
- Good documentation
- Active community
- System tray support
- Inter-process messaging

**Cons:**
- X11 only (no Wayland)
- INI configuration can get verbose
- Some modules require external scripts

### Installation

```bash
# Arch Linux
sudo pacman -S polybar

# From source
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
```

### Basic Configuration

```ini
; ~/.config/polybar/config.ini
[colors]
background = #282828
foreground = #ebdbb2
primary = #fabd2f
secondary = #8ec07c
alert = #fb4934

[bar/main]
width = 100%
height = 28
radius = 0

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 2
border-size = 0
padding = 1
module-margin = 1

font-0 = JetBrainsMono Nerd Font:size=10;2
font-1 = Noto Color Emoji:scale=10;2

modules-left = i3 xworkspaces
modules-center = date
modules-right = pulseaudio memory cpu temperature battery

tray-position = right
tray-padding = 2

cursor-click = pointer

[module/i3]
type = internal/i3
format = <label-state> <label-mode>

label-focused = %index%
label-focused-background = ${colors.primary}
label-focused-foreground = ${colors.background}
label-focused-padding = 2

label-unfocused = %index%
label-unfocused-padding = 2

label-visible = %index%
label-visible-padding = 2

label-urgent = %index%
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

[module/date]
type = internal/date
interval = 1
date = %Y-%m-%d%
time = %H:%M:%S
label = %date% %time%

[module/pulseaudio]
type = internal/pulseaudio
format-volume = <ramp-volume> <label-volume>
label-volume = %percentage%%
label-muted = 婢 muted
label-muted-foreground = #666

ramp-volume-0 = 奄
ramp-volume-1 = 奔
ramp-volume-2 = 墳

[module/memory]
type = internal/memory
interval = 2
format = <label>
label =  %percentage_used%%

[module/cpu]
type = internal/cpu
interval = 2
format = <label>
label =  %percentage%%

[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 70
format = <ramp> <label>
format-warn = <ramp> <label-warn>
label = %temperature-c%
label-warn = %temperature-c%
label-warn-foreground = ${colors.alert}

ramp-0 = 
ramp-1 = 
ramp-2 = 

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 98

format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>
format-full = <ramp-capacity> <label-full>

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
animation-charging-framerate = 750
```

### Launch Script

```bash
#!/bin/bash
# ~/.config/polybar/launch.sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
```

### Custom Modules

```ini
[module/updates]
type = custom/script
exec = checkupdates | wc -l
interval = 3600
label =  %output%

[module/weather]
type = custom/script
exec = ~/.config/polybar/scripts/weather.sh
interval = 600

[module/spotify]
type = custom/script
exec = ~/.config/polybar/scripts/spotify.sh
interval = 1
format = <label>
format-prefix = " "
```

## Waybar (Wayland)

### Overview

Waybar is a highly customizable status bar for Wayland compositors, inspired by Polybar.

**Pros:**
- Native Wayland support
- CSS styling (very flexible)
- JSON configuration
- Built-in support for many compositors
- Good documentation
- Active development

**Cons:**
- Wayland only
- CSS can be complex
- Some compositor-specific features

### Installation

```bash
# Arch Linux
sudo pacman -S waybar

# From source
git clone https://github.com/Alexays/Waybar
cd Waybar
meson build
ninja -C build
sudo ninja -C build install
```

### Basic Configuration

```json
// ~/.config/waybar/config.jsonc
{
    "layer": "top",
    "position": "top",
    "height": 30,
    "spacing": 4,

    "modules-left": ["hyprland/workspaces", "hyprland/window"],
    "modules-center": ["clock"],
    "modules-right": [
        "pulseaudio",
        "network",
        "cpu",
        "memory",
        "temperature",
        "battery",
        "tray"
    ],

    "hyprland/workspaces": {
        "format": "{id}",
        "on-click": "activate",
        "sort-by-number": true
    },

    "hyprland/window": {
        "format": "{title}",
        "max-length": 50,
        "separate-outputs": true
    },

    "clock": {
        "format": "{:%Y-%m-%d %H:%M:%S}",
        "interval": 1,
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
    },

    "cpu": {
        "format": " {usage}%",
        "tooltip": true,
        "interval": 2
    },

    "memory": {
        "format": " {}%",
        "tooltip-format": "Used: {used:0.1f}G / {total:0.1f}G"
    },

    "temperature": {
        "critical-threshold": 80,
        "format": "{icon} {temperatureC}°C",
        "format-icons": ["", "", ""]
    },

    "battery": {
        "states": {
            "warning": 30,
            "critical": 15
        },
        "format": "{icon} {capacity}%",
        "format-charging": " {capacity}%",
        "format-plugged": " {capacity}%",
        "format-icons": ["", "", "", "", ""]
    },

    "network": {
        "format-wifi": " {essid} ({signalStrength}%)",
        "format-ethernet": " {ipaddr}/{cidr}",
        "format-disconnected": "⚠ Disconnected",
        "tooltip-format": "{ifname} via {gwaddr}"
    },

    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": "婢 {volume}%",
        "format-icons": {
            "default": ["奄", "奔", "墳"]
        },
        "on-click": "pavucontrol"
    },

    "tray": {
        "icon-size": 16,
        "spacing": 10
    }
}
```

### Styling (CSS)

```css
/* ~/.config/waybar/style.css */
* {
    border: none;
    border-radius: 0;
    font-family: "JetBrainsMono Nerd Font";
    font-size: 13px;
    min-height: 0;
}

window#waybar {
    background: rgba(40, 40, 40, 0.9);
    color: #ebdbb2;
}

/* Workspaces */
#workspaces button {
    padding: 0 8px;
    background: transparent;
    color: #ebdbb2;
    border-bottom: 2px solid transparent;
}

#workspaces button:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.active {
    background: #fabd2f;
    color: #282828;
    border-bottom: 2px solid #fabd2f;
}

#workspaces button.urgent {
    background: #fb4934;
    color: #282828;
}

/* Modules */
#clock,
#battery,
#cpu,
#memory,
#temperature,
#network,
#pulseaudio,
#tray {
    padding: 0 10px;
    margin: 0 2px;
}

#battery.charging {
    color: #8ec07c;
}

#battery.warning:not(.charging) {
    color: #fabd2f;
}

#battery.critical:not(.charging) {
    color: #fb4934;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

@keyframes blink {
    to {
        background-color: #fb4934;
        color: #282828;
    }
}

#temperature.critical {
    color: #fb4934;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
}
```

### Custom Modules

```json
"custom/weather": {
    "format": "{icon} {}",
    "format-icons": ["", "", "", "", ""],
    "exec": "~/.config/waybar/scripts/weather.sh",
    "interval": 600
},

"custom/updates": {
    "format": " {}",
    "exec": "checkupdates | wc -l",
    "interval": 3600,
    "on-click": "alacritty -e yay -Syu"
},

"custom/media": {
    "format": "{icon} {}",
    "format-icons": {
        "Playing": "",
        "Paused": ""
    },
    "max-length": 40,
    "exec": "playerctl metadata --format '{{ artist }} - {{ title }}'",
    "on-click": "playerctl play-pause",
    "interval": 1
}
```

## i3status

### Overview

The default status bar for i3wm. Simple and efficient.

**Pros:**
- Lightweight
- Simple configuration
- Built-in i3 integration
- Stable and reliable
- Low resource usage

**Cons:**
- Limited styling options
- Fewer modules
- Basic functionality only
- Plain text output

### Configuration

```bash
# ~/.config/i3status/config
general {
    colors = true
    interval = 5
    color_good = "#8ec07c"
    color_bad = "#fb4934"
    color_degraded = "#fabd2f"
}

order += "wireless _first_"
order += "ethernet _first_"
order += "disk /"
order += "cpu_usage"
order += "memory"
order += "battery all"
order += "tztime local"

wireless _first_ {
    format_up = "W: (%quality at %essid) %ip"
    format_down = "W: down"
}

ethernet _first_ {
    format_up = "E: %ip"
    format_down = "E: down"
}

disk "/" {
    format = "D: %avail"
}

cpu_usage {
    format = "CPU: %usage"
}

memory {
    format = "MEM: %used / %total"
    threshold_degraded = "10%"
    threshold_critical = "5%"
}

battery all {
    format = "%status %percentage %remaining"
    status_chr = "CHR"
    status_bat = "BAT"
    status_full = "FULL"
    low_threshold = 30
}

tztime local {
    format = "%Y-%m-%d %H:%M:%S"
}
```

## i3blocks

### Overview

Extensible status bar using shell scripts for modules.

**Pros:**
- Scriptable modules
- Flexible
- Click events
- Easy to customize
- Community blocklets

**Cons:**
- Requires scripting knowledge
- Basic styling
- More complex setup

### Configuration

```ini
# ~/.config/i3blocks/config
separator_block_width=15
markup=pango

[volume]
command=~/.config/i3blocks/scripts/volume.sh
interval=once
signal=10

[memory]
command=~/.config/i3blocks/scripts/memory.sh
interval=10

[cpu]
command=~/.config/i3blocks/scripts/cpu.sh
interval=2

[battery]
command=~/.config/i3blocks/scripts/battery.sh
interval=30

[time]
command=date '+%Y-%m-%d %H:%M:%S'
interval=1
```

### Example Script

```bash
#!/bin/bash
# ~/.config/i3blocks/scripts/volume.sh

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'yes' && echo 'yes' || echo 'no')

if [ "$MUTED" = "yes" ]; then
    echo "婢 muted"
else
    echo " $VOLUME%"
fi

# Click events
case $BUTTON in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    3) pavucontrol & ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac
```

## lemonbar

### Overview

Minimalistic bar that reads from stdin.

**Pros:**
- Extremely lightweight
- Full control via scripts
- Click actions
- Multi-monitor support

**Cons:**
- Requires extensive scripting
- No built-in modules
- Steep learning curve
- Minimal documentation

### Example

```bash
#!/bin/bash
# Simple lemonbar script

while true; do
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    MEM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
    
    echo "%{l} Workspaces %{c}$DATE %{r}CPU: $CPU% | MEM: $MEM "
    sleep 1
done | lemonbar -p -g 1920x30+0+0 -f "JetBrainsMono Nerd Font:size=10" -B "#282828" -F "#ebdbb2"
```

## Eww (Elkowar's Wacky Widgets)

### Overview

Widget system that can create status bars and more.

**Pros:**
- Extremely flexible
- CSS-like styling
- Works on both X11 and Wayland
- Can create custom widgets
- Active development

**Cons:**
- Complex configuration
- High resource usage
- Steep learning curve
- Configuration in custom language

### Installation

```bash
# Arch Linux
paru -S eww-wayland  # or eww-x11

# From source
git clone https://github.com/elkowar/eww
cd eww
cargo build --release
sudo install target/release/eww /usr/local/bin/
```

### Example Configuration

```lisp
; ~/.config/eww/eww.yuck
(defwidget bar []
  (box :class "bar"
       :orientation "h"
       :space-evenly false
    (workspaces)
    (box :halign "center" (time))
    (box :halign "end"
         :space-evenly false
      (volume)
      (battery)
      (systray))))

(defwidget workspaces []
  (box :class "workspaces"
       :orientation "h"
       :space-evenly false
    (for workspace in workspaces-data
      (button :class "${workspace.active ? 'active' : ''}"
              :onclick "hyprctl dispatch workspace ${workspace.id}"
        "${workspace.id}"))))

(defwidget time []
  (box :class "time"
    time-data))

(defpoll time-data :interval "1s"
  "date '+%Y-%m-%d %H:%M:%S'")

(defwindow bar
  :monitor 0
  :geometry (geometry :x "0%"
                      :y "0%"
                      :width "100%"
                      :height "30px"
                      :anchor "top center")
  :stacking "fg"
  :exclusive true
  (bar))
```

## Recommendations

### For i3wm

**Beginners**: i3status (simple, works out of the box)
**Intermediate**: Polybar (good balance of features and ease)
**Advanced**: i3blocks or lemonbar (full customization)

### For Hyprland

**Recommended**: Waybar (native support, well-integrated)
**Alternative**: Eww (if you want maximum customization)

### For Both

**Universal**: Eww (works everywhere, most flexible)

## Performance Comparison

| Bar | Startup Time | Memory Usage | CPU Usage (idle) |
|-----|--------------|--------------|------------------|
| i3status | <0.1s | 5 MB | <0.1% |
| i3blocks | <0.1s | 8 MB | <0.2% |
| Polybar | 0.2s | 25 MB | 0.5% |
| Waybar | 0.3s | 20 MB | 0.4% |
| lemonbar | <0.1s | 5 MB | <0.1% |
| Eww | 0.5s | 45 MB | 1.0% |

## Configuration Tips

### Module Order

Common patterns:
- **Left**: Workspaces, window title
- **Center**: Clock, date
- **Right**: System stats, tray

### Icon Fonts

Use Nerd Fonts for icons:
```bash
sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd
```

### Auto-start

**i3:**
```bash
exec_always --no-startup-id ~/.config/polybar/launch.sh
```

**Hyprland:**
```bash
exec-once = waybar
```

## Conclusion

Choose based on your needs:
- **Simple**: i3status
- **Balanced**: Polybar/Waybar
- **Scriptable**: i3blocks/lemonbar
- **Maximum flexibility**: Eww

All bars are highly capable. Start simple, then customize as needed.