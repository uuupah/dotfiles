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
config="$HOME
Changes to be committed:/.config/tofi/configprompt"

# TODO change this choice to indexes instead of words
case "$choice" in
  1)
    search_term=$(echo "" | tofi --config $config --prompt-text "googlemaps-search: ") || exit 0
    librewolf --new-tab "https://google.com/maps/search/${search_term// /+}"
    ;;
  2)
    search_term=$(echo "" | tofi --config $config --prompt-text "recipe-tin-eats-search: ") || exit 0
    librewolf --new-tab "https://recipetineats.com/?s=${search_term// /+}"
    ;;
  3)
    search_term=$(echo "" | tofi --config $config --prompt-text "sallys-baking-addiction-search: ") || exit 0
    librewolf --new-tab "https://sallysbakingaddiction.com/?s=${search_term// /+}"
    ;;
  4)
    search_term=$(echo "" | tofi --config $config --prompt-text "wikipedia-search: " ) || exit 0
    librewolf --new-tab "https://en.wikipedia.org/wiki/Special:Search?sourceid=Mozilla-search&search=${search_term// /+}"
    ;;
  5)
    search_term=$(echo "" | tofi --config $config --prompt-text "youtube-search: " ) || exit 0
    librewolf --new-tab "https://youtube.com/results?search_query=${search_term// /+}"
    ;;
esac
