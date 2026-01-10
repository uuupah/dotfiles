#!/usr/bin/env bash

# i unfortunately made the robot write this for me
# Listen for BlueZ Device1 property changes and send notifications

dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" |
while read -r line; do
    # Detect the interface we care about
    if [[ "$line" =~ org.bluez.Device1 ]]; then
        device_path=""
        device_name=""
        connected_state=""

        # Read subsequent lines for details
        while read -r sub; do
            # Extract the device path
            if [[ "$sub" =~ path\ *\=/org/bluez ]]; then
                device_path=$(echo "$sub" | sed -n "s/.*path=//p")
            fi

            # Extract the device name
            if [[ "$sub" =~ string\ \"Name\" ]]; then
                read -r name_line
                device_name=$(echo "$name_line" | sed -n 's/.*string "\(.*\)".*/\1/p')
            fi

            # Detect Connected property change
            if [[ "$sub" =~ string\ \"Connected\" ]]; then
                read -r state_line
                if [[ "$state_line" =~ boolean\ true ]]; then
                    connected_state="connected"
                else
                    connected_state="disconnected"
                fi
            fi

            # When we have enough info, break
            if [[ -n "$connected_state" ]]; then
                break
            fi
        done

        # Fallback name if BlueZ didn't provide one yet
        if [[ -z "$device_name" ]]; then
            device_name="${device_path##*/}"
        fi

        # Send notification
        if [[ "$connected_state" == "connected" ]]; then
            notify-send "Bluetooth device connected" "$device_name"
        else
            notify-send "Bluetooth device disconnected" "$device_name"
        fi
    fi
done
