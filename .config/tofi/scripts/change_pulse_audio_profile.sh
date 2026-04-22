#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

promptlength=5
characterwidth=10
tofipadding=10

options=$(pactl list cards | awk '/Profiles:/{flag=1;next}/Active Profile:/{flag=0}flag' | awk '{$1=$1};1' | sed 's/:.*$//g')
firstcardnumber=$(pactl list  cards | grep "Card #*" | cut -d '#' -f2-)

width=$(($(($(($(printf "%s\n" "$options" | wc -L)+$promptlength))*$characterwidth))+$tofipadding))
echo "$width"

choice=$(printf "%s\n" "$options" | tofi --prompt="sel: " --width "$width") || exit 0

echo $firstcardnumber
echo $choice

pactl set-card-profile "$firstcardnumber" "$choice"
