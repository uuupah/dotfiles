#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

search_term=$(echo "" | tofi --require-match=false --prompt-text "youtube-search: " --height 26) || exit 0
formatted_search_term="${search_term// /+}"
librewolf --new-tab "https://youtube.com/results?search_query=${formatted_search_term}"
