#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

options="wikipedia
maps
recipe tin eats
sally's baking addiction
youtube
fedora packages"

choice=$(printf "%s\n" "$options" | tofi --prompt="sel: " --print-index=true) || exit 0
config="$HOME/.config/tofi/configprompt"
search_prompt=""
search_url=""

case "$choice" in
  1)
    search_prompt="wikipedia-search: "
    search_url="https://en.wikipedia.org/wiki/Special:Search?sourceid=Mozilla-search&search="
    ;;
  2)
    search_prompt="googlemaps-search: "
    search_url="https://google.com/maps/search/"
    ;;
  3)
    search_prompt="recipe-tin-eats-search: "
    search_url="https://recipetineats.com/?s="
    ;;
  4)
    search_prompt="sallys-baking-addiction-search: "
    search_url="https://sallysbakingaddiction.com/?s="
    ;;
  5)
    search_prompt="youtube-search: "
    search_url="https://youtube.com/results?search_query="
    ;;
  6)
    search_prompt="fedora-package-search: "
    search_url="https://packages.fedoraproject.org/search?query="
esac

search_term=$(echo "" | tofi --config $config --prompt-text "${search_prompt}" ) || exit 0
librewolf --new-tab "${search_url}${search_term// /+}"
