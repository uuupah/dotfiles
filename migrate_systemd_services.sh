#! /usr/bin/env bash
mkdir -p $HOME/.config/systemd/user

rm $HOME/.config/systemd/user/swayidle.service
rm $HOME/.config/systemd/user/swaybg.service
rm $HOME/.config/systemd/user/inhibit-idle.service

ln ./systemd-services/inhibit-idle.service $HOME/.config/systemd/user/inhibit-idle.service
ln ./systemd-services/swaybg.service       $HOME/.config/systemd/user/swaybg.service
ln ./systemd-services/swayidle.service     $HOME/.config/systemd/user/swayidle.service

systemctl --user add-wants niri.service waybar.service
systemctl --user add-wants niri.service swaybg.service
systemctl --user add-wants niri.service swayidle.service
