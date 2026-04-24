#!/bin/bash
#lifted wholesale from https://github.com/gmr458/.dotfiles/blob/master/tofi/.config/tofi/scripts/powermenu.sh

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

choice=$(printf "%s\n" "power off" "restart" "suspend" "lock" "log out" | tofi --config ~/.config/tofi/configpower) || exit 0

case "$choice" in
  "power off")
    systemctl poweroff
    ;;
  "restart")
    systemctl reboot
    ;;
  "suspend")
    systemctl suspend
    ;;
  # "hibernate")
  #   systemctl hibernate
  #   ;;
  "lock")
    swaylock
    ;;
  "log out")
    niri msg action quit -s
    ;;
esac
