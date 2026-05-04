#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

options="calculator
toggle external monitors
change audio profile
connect to wifi
disconnect from wifi
next wallpaper
previous wallpaper
change colour scheme
remmina connections
niri documentation"

choice=$(printf "%s\n" "$options" | tofi --prompt="sel: ") || exit 0

# TODO change this choice to indexes instead of words
case "$choice" in
  "calculator")
    $HOME/.config/tofi/scripts/calc.sh
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
  "next wallpaper")
    wpaperctl next
    ;;
  "previous wallpaper")
    wpaperctl previous
    ;;
  "remmina connections")
    $HOME/.config/tofi/scripts/remote_connections.sh
    ;;
  "niri documentation")
    librewolf --new-tab "https://niri-wm.github.io/niri/Configuration%3A-Introduction.html"
    ;;
esac
