#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

search_term=$(echo "" | tofi --require-match=false --prompt-text "sallys-baking-addiction-search: " --height 26 --width 450) || exit 0
formatted_search_term="${search_term// /+}"
librewolf --new-tab "https://sallysbakingaddiction.com/?s=${formatted_search_term}"
