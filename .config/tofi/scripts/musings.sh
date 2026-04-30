#! /usr/bin/env bash

config="$HOME/.config/tofi/configprompt"
musing=$(echo "" | tofi --config $config --prompt-text "muse: " ) || exit 0
datetime=$(date +"%Y-%m-%d %T" )
echo "${datetime} - ${musing}" | tee -a "$HOME/sync-obsidian/lists/musings.md"
