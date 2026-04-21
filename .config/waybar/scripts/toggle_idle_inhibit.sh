#! /usr/bin/env bash
if [ "$(systemctl is-active --user inhibit-idle.service)"  = "active" ]; then
  systemctl stop --user inhibit-idle
  notify-send "idle-inhibit" "idle behaviour re-enabled"
else
  notify-send "idle-inhibit" "idle suspend disabled for 3 hours"
  systemctl start --user inhibit-idle
fi
