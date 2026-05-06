#! /usr/bin/env bash

PLAYERORDER="kew,quodlibet,%any,firefox,chromium,edge"
STATUS=$(playerctl --player="${PLAYERORDER}" status)

if [ "$STATUS" = "" ]; then
  echo ''
  exit
fi

ARTIST=$(playerctl --player="${PLAYERORDER}" metadata artist)
TRACKNAME=$(playerctl --player="${PLAYERORDER}" metadata title)

case $STATUS in
  Playing)
    STATUSICON="▶"
    ;;
  Paused)
    STATUSICON="⏸"
    ;;
esac

echo "$(echo "${STATUSICON} ${TRACKNAME} - ${ARTIST}" | tr '[:upper:]' '[:lower:]') | "
