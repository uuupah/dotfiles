#! /usr/bin/env bash

PRINTPLAYING=$(quodlibet --print-playing 2> /dev/null)
IFS='-' read -ra NOWPLAYING <<< $PRINTPLAYING
MARKER=${NOWPLAYING%% *}
STATUS=$(quodlibet --status 2> /dev/null | awk '{print $1;}')
STATUSICON=""

case $STATUS in
  playing)
    STATUSICON="▶"
    ;;
  paused)
    STATUSICON="⏸"
    ;;
esac

case $MARKER in
  /)
  	echo ""
  	;;
  "")
    echo ""
    ;;
  *)
    echo "$(echo "${STATUSICON} ${NOWPLAYING[0]}-${NOWPLAYING[-1]}" | tr '[:upper:]' '[:lower:]') |"
    ;;
esac
 # Quod Libet is not running (add '--run' to start it)
# 
# if [[ $NOWPLAYING == "/ [untitled Unknown Audio File]" ]]; then
	# echo ""
# elif [[ $NOWPLAYING == "Quod Libet is not running (add '--run' to start it)"]]; then
	# echo ""
# else
	# echo "$(echo "${STATUS%% *} - ${NOWPLAYING[0]}-${NOWPLAYING[3]}" | tr '[:upper:]' '[:lower:]') |"
# fi

# echo ${STATUS%% *}
