#! /usr/bin/env bash
rm ~/.config/niri/device.kdl
rm ~/.config/dunst/dunstdevice
rm ~/.config/alacritty/device.toml
rm ~/.config/waybar/device.css
rm ~/.config/waybar/device.jsonc
rm ~/.config/tofi/device
rm ~/.config/tofi/deviceprompt
rm ~/.config/tofi/devicebemoji

ln -s ~/.config/niri/device-yoga.kdl ~/.config/niri/device.kdl
ln -s ~/.config/dunst/dunstdeviceyoga ~/.config/dunst/dunstdevice
ln -s ~/.config/alacritty/device-yoga.toml ~/.config/alacritty/device.toml
ln -s ~/.config/waybar/device-yoga.css ~/.config/waybar/device.css
ln -s ~/.config/waybar/device-yoga.jsonc ~/.config/waybar/device.jsonc
ln -s ~/.config/tofi/devicefiles/deviceyoga ~/.config/tofi/device
ln -s ~/.config/tofi/devicefiles/devicepromptyoga ~/.config/tofi/deviceprompt
ln -s ~/.config/tofi/devicefiles/devicebemojiyoga ~/.config/tofi/devicebemoji
