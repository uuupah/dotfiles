#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

options="toggle external monitors
change audio profile
wifi
change colour scheme
remmina connections"

choice=$(printf "%s\n" "$options" | tofi --prompt="sel: ") || exit 0

# TODO change this choice to indexes instead of words
case "$choice" in
  "toggle external monitors")
    $HOME/.config/tofi/scripts/set_hyprland_monitors.sh
    ;;
  "change audio profile")
    $HOME/.config/tofi/scripts/change_pulse_audio_profile.sh
    ;;
  "wifi")
    $HOME/.config/tofi/scripts/wifi_menu.sh
    ;;
  "change colour scheme")
    $HOME/scripts/colour_scheme_script.sh
    ;;
  "remmina connections")
    $HOME/.config/tofi/scripts/remote_connections.sh
    ;;
esac
