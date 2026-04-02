# hypr-monitor-manager

KDE-style display configuration tool for [Hyprland](https://hyprland.org/), built with GTK4 + libadwaita.

![screenshot placeholder]

## Features

- Visual canvas — drag monitors to reposition them
- Edge snapping — no gaps between monitors
- Per-monitor: resolution, refresh rate, rotation, scale, position
- Enable/disable monitors
- **Apply** — applies at runtime via `hyprctl keyword` (no file write)
- **Save** — writes to `~/.config/hypr/monitors.conf`

## Dependencies

| Package | Arch |
|---|---|
| Python 3 | `python` |
| PyGObject | `python-gobject` |
| libadwaita | `libadwaita` |
| pycairo | `python-cairo` |
| Hyprland | `hyprland` |

```bash
sudo pacman -S python-gobject libadwaita python-cairo
```

## Install

```bash
git clone https://github.com/fastphoenixx/hypr-monitor-manager
cd hypr-monitor-manager
bash install.sh
```

## Usage

```bash
hypr-monitor-manager
```

Or launch from your app menu as **Monitor Manager**.

## monitors.conf format

The generated file is compatible with standard Hyprland syntax:

```
monitor = HDMI-A-1, 2560x1080@74.99, 0x0, 1
monitor = DP-2, 1920x1080@74.97, 2560x-420, 1, transform, 1
```
