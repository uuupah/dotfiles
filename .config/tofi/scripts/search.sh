#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

options="maps
recipe tin eats
sally's baking addiction
wikipedia
youtube"

choice=$(printf "%s\n" "$options" | tofi --prompt="sel: " --print-index=true) || exit 0

# TODO change this choice to indexes instead of words
case "$choice" in
  1)
    $HOME/.config/tofi/scripts/search_maps.sh
    ;;
  2)
    $HOME/.config/tofi/scripts/search_recipetineats.sh
    ;;
  3)
    $HOME/.config/tofi/scripts/search_sallys.sh
    ;;
  4)
    $HOME/.config/tofi/scripts/search_wikipedia.sh
    ;;
  5)
    $HOME/.config/tofi/scripts/search_youtube.sh
    ;;
esac
