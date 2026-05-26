#! /usr/bin/env bash

# kill tofi if its already running
if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

config="$HOME/.config/tofi/configprompt"

celsius=$(echo "" | tofi --config $config --prompt-text "celsius: " ) || exit 0

re='^[+-]?[0-9]+([.][0-9]+)?$'
if ! [[ $celsius =~ $re ]] ; then
   notify-send "error" "not a number"
   exit
fi

fahrenheit=$(echo "scale=2; (${celsius}*(9/5))+32" | bc)

notify-send -- "celsius to fahrenheit" "${celsius}°c is ${fahrenheit}°f"
