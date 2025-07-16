#!/bin/bash

window_info=$(hyprctl activewindow -j)
workspace_info=$(hyprctl activeworkspace -j)

is_floating=$(echo "$window_info" | jq -r '.floating')
fullscreen_state=$(echo "$window_info" | jq -r '.fullscreen')
windows_count=$(echo "$workspace_info" | jq -r '.windows')

state=""

if [[ "$is_floating" == "true" ]]; then
    state="[floating]"
fi

if [[ "$fullscreen_state" == "2" ]]; then
    state="[fullscreen]"
elif [[ "$fullscreen_state" == "1" ]]; then
  if [[ "$windows_count" > "1" ]]; then
    : $((--windows_count))
    state="[fullscreen - $windows_count hidden]"
  else
    state="[fullscreen]"
  fi
fi

echo "{\"text\": \"$state\" }"
