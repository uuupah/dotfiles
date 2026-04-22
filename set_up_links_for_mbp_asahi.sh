#! /usr/bin/env bash
rm ~/.config/niri/device.kdl
rm ~/.config/dunst/dunstdevice
rm ~/.config/alacritty/device.toml
rm ~/.config/waybar/device.css
rm ~/.config/waybar/device.jsonc
rm ~/.config/tofi/device
rm ~/.config/tofi/deviceprompt
rm ~/.config/tofi/devicebemoji

ln -s ~/.config/niri/device-mbpasahi.kdl ~/.config/niri/device.kdl
ln -s ~/.config/dunst/dunstdevicembpasahi ~/.config/dunst/dunstdevice
ln -s ~/.config/alacritty/device-mbpasahi.toml ~/.config/alacritty/device.toml
ln -s ~/.config/waybar/device-mbpasahi.css ~/.config/waybar/device.css
ln -s ~/.config/waybar/device-mbpasahi.jsonc ~/.config/waybar/device.jsonc
ln -s ~/.config/tofi/devicefiles/devicembpasahi ~/.config/tofi/device
ln -s ~/.config/tofi/devicefiles/devicepromptmbpasahi ~/.config/tofi/deviceprompt
ln -s ~/.config/tofi/devicefiles/devicebemojimbpasahi ~/.config/tofi/devicebemoji
