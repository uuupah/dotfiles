#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

options="calculator
toggle external monitors
mount all mtp devices
change audio profile
connect to wifi
disconnect from wifi
next wallpaper
previous wallpaper
fahrenheit to celsius
celsius to fahrenheit
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
  "mount all mtp devices")
    $HOME/scripts/mount_all_mtp_devices.sh
    ;;
  "next wallpaper")
    wpaperctl next
    ;;
  "niri documentation")
    librewolf --new-tab "https://niri-wm.github.io/niri/Configuration%3A-Introduction.html"
    ;;
  "previous wallpaper")
    wpaperctl previous
    ;;
  "fahrenheit to celsius")
    $HOME/.config/tofi/scripts/fahrenheit_to_celsius.sh
    ;;
  "celsius to fahrenheit")
    $HOME/.config/tofi/scripts/celsius_to_fahrenheit.sh
    ;;
  "remmina connections")
    $HOME/.config/tofi/scripts/remote_connections.sh
    ;;
esac
