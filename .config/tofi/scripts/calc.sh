#!/usr/bin/env bash

search_term=$(echo "" | tofi --require-match=false --prompt-text "calc: " --height 26) || exit 0

notify-send "result" "$(echo ${search_term} | bc)"
