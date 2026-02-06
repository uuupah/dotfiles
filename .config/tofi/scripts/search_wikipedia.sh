#!/usr/bin/env bash

if pgrep -x tofi >/dev/null; then
  killall -q tofi
  exit
fi

search_term=$(echo "" | tofi --require-match=false --prompt-text "wikipedia-search: " --height 26) || exit 0
librewolf --new-tab "https://en.wikipedia.org/wiki/Special:Search?sourceid=Mozilla-search&search=${search_term}"
