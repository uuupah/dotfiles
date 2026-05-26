#! /usr/bin/env bash

# kill tofi if its already running
if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

config="$HOME/.config/tofi/configprompt"

fahrenheit=$(echo "" | tofi --config $config --prompt-text "fahrenheit: " ) || exit 0

re='^[+-]?[0-9]+([.][0-9]+)?$'
if ! [[ $fahrenheit =~ $re ]] ; then
   notify-send "error" "not a number"
   exit
fi

celsius=$(echo "scale=2; (${fahrenheit}-32)/(9/5)" | bc)

notify-send -- "fahrenheit to celsius" "${fahrenheit}°f is ${celsius}°c"
