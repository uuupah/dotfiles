#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

options="toggle external monitors
wifi
remmina connections"

choice=$(printf "%s\n" "$options" | tofi --prompt="sel: ") || exit 0

case "$choice" in
  "toggle external monitors")
    $HOME/.config/tofi/scripts/set_hyprland_monitors.sh
    ;;
  "wifi")
    $HOME/.config/tofi/scripts/wifi_menu.sh
    ;;
  "remmina connections")
    $HOME/.config/tofi/scripts/remote_connections.sh
    ;;
esac
