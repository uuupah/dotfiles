#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

search_term=$(echo "" | tofi --require-match=false --prompt-text "googlemaps-search: " --height 26) || exit 0
formatted_search_term="${search_term// /+}"
librewolf --new-tab "https://google.com/maps/search/${formatted_search_term}"
