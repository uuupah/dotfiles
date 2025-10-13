#!/bin/bash
#lifted wholesale from https://github.com/gmr458/.dotfiles/blob/master/tofi/.config/tofi/scripts/powermenu.sh

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

choice=$(printf "%s\n" "power off" "restart" "suspend" "hibernate" "lock" "log out" | tofi --prompt="sel: " --height=112 --width=130)

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
  "hibernate")
    systemctl hibernate
    ;;
  "lock")
    hyprlock
    ;;
  "log out")
    case "$DESKTOP_SESSION" in
      hyprland | hyprland-uwsm)
        hyprctl dispatch exit 1
        ;;
      sway)
        swaymsg exit
        ;;
    esac
    ;;
esac
