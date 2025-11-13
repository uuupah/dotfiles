#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

options="toggle external monitors
change audio profile
connect to wifi
disconnect from wifi
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
  "connect to wifi")
    $HOME/.config/tofi/scripts/wifi_menu.sh
    ;;
  "disconnect from wifi")
    nmcli device disconnect wlp0s20f3
    notify-send "wi-fi disconnected" "disconnected from wi-fi on device wlp0s20f3"
    ;;
  "change colour scheme")
    $HOME/scripts/colour_scheme_script.sh
    ;;
  "remmina connections")
    $HOME/.config/tofi/scripts/remote_connections.sh
    ;;
esac
