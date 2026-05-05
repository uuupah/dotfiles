#! /usr/bin/env bash
rm ~/.config/niri/device.kdl
rm ~/.config/dunst/dunstdevice
rm ~/.config/alacritty/device.toml
rm ~/.config/waybar/device.css
rm ~/.config/waybar/device.jsonc
rm ~/.config/tofi/device
rm ~/.config/tofi/deviceprompt
rm ~/.config/tofi/devicebemoji
rm ~/.config/tofi/devicepower
rm ~/.config/wpaperd/config.toml

ln -s ~/.config/niri/device-desktop.kdl ~/.config/niri/device.kdl
ln -s ~/.config/dunst/dunstdevicedesktop ~/.config/dunst/dunstdevice
ln -s ~/.config/alacritty/device-desktop.toml ~/.config/alacritty/device.toml
ln -s ~/.config/waybar/device-desktop.css ~/.config/waybar/device.css
ln -s ~/.config/waybar/device-desktop.jsonc ~/.config/waybar/device.jsonc
ln -s ~/.config/tofi/devicefiles/devicedesktop ~/.config/tofi/device
ln -s ~/.config/tofi/devicefiles/devicepromptdesktop ~/.config/tofi/deviceprompt
ln -s ~/.config/tofi/devicefiles/devicebemojidesktop ~/.config/tofi/devicebemoji
ln -s ~/.config/tofi/devicefiles/devicepowerdesktop ~/.config/tofi/devicepower
ln -s ~/.config/wpaperd/deviceconfigdesktop.toml ~/.config/wpaperd/config.toml
