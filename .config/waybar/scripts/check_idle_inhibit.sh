#! /usr/bin/env bash
if [ "$(systemctl is-active --user inhibit-idle.service)"  = "active" ]; then
  echo idle off
else
  echo idle on
fi
