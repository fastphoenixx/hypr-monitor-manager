#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"

# Dependencies check
deps=(python3 hyprctl)
missing=()
for dep in "${deps[@]}"; do
    command -v "$dep" &>/dev/null || missing+=("$dep")
done

python3 -c "import gi; gi.require_version('Gtk','4.0'); gi.require_version('Adw','1'); from gi.repository import Gtk,Adw,Gdk,GLib; import cairo" 2>/dev/null || \
    missing+=("python-gobject + libadwaita + pycairo")

if [[ ${#missing[@]} -gt 0 ]]; then
    echo "Dependências ausentes: ${missing[*]}"
    echo "Arch: sudo pacman -S python-gobject libadwaita python-cairo"
    exit 1
fi

mkdir -p "$BIN_DIR" "$APPS_DIR"
install -m 755 "$SCRIPT_DIR/hypr-monitor-manager" "$BIN_DIR/hypr-monitor-manager"
install -m 644 "$SCRIPT_DIR/hypr-monitor-manager.desktop" "$APPS_DIR/hypr-monitor-manager.desktop"

echo "Instalado em $BIN_DIR/hypr-monitor-manager"
echo "Execute: hypr-monitor-manager"
