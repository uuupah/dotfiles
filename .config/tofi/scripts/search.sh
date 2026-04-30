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
config="$HOME/.config/tofi/configprompt"
search_prompt=""
search_url=""

# TODO change this choice to indexes instead of words
case "$choice" in
  1)
    search_prompt="googlemaps-search: "
    search_url="https://google.com/maps/search/"
    ;;
  2)
    search_prompt="recipe-tin-eats-search: "
    search_url="https://recipetineats.com/?s="
    ;;
  3)
    search_prompt="sallys-baking-addiction-search: "
    search_url="https://sallysbakingaddiction.com/?s="
    ;;
  4)
    search_prompt="wikipedia-search: "
    search_url="https://en.wikipedia.org/wiki/Special:Search?sourceid=Mozilla-search&search="
    ;;
  5)
    search_prompt="youtube-search: "
    search_url="https://youtube.com/results?search_query="
    ;;
esac

search_term=$(echo "" | tofi --config $config --prompt-text "${search_prompt}" ) || exit 0
librewolf --new-tab "${search_url}${search_term// /+}"
