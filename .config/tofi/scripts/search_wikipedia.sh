#!/usr/bin/env bash

search_term=$(echo "" | tofi --require-match=false --prompt-text "wikipedia-search: " --height 26) || exit 0
librewolf --new-tab "https://en.wikipedia.org/wiki/Special:Search?sourceid=Mozilla-search&search=${search_term}"
