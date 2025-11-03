#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

disabledmonitorsconflocation="$HOME/.config/hypr/disabled_monitors.conf"

options="external monitors on
external monitors off"

choice=$(printf "%s\n" "$options" | tofi --prompt="sel: ") || exit 0

case "$choice" in
  "external monitors on")
    echo "monitor = , preferred, auto, 1" > $HOME/.config/hypr/disabled_monitors.conf
    ;;
  "external monitors off")
    echo "monitor = , disabled" > "$disabledmonitorsconflocation"
    ;;
esac
