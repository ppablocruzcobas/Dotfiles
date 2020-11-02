#! /bin/sh
#
# bluetoothctl.sh
# Copyright (C) 2020 Pedro Pablo <ppablocruzcobas@gmail.com>
#
# Distributed under terms of the MIT license.
function active() {
    count=0
    echo "$1" | while read -r line; do
        device_info=$(bluetoothctl info "$line")

        if echo "$device_info" | grep -q "Connected: yes"; then
            devicealias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
            count=$(($count+1))
            echo $count
        fi
    done
    return $count
}

if [ "$(systemctl is-active "bluetooth.service")" == "active" ]; then
    devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)

    count=$(active $devices_paired)
    if [[ $count -gt 0 ]]; then 
        echo {\"icon\":\"bluetooth\", \"state\":\"Good\", \"text\":\" $count\"}
    else
        echo {\"icon\":\"bluetooth\", \"state\":\"Idle\", \"text\":\"\"}
    fi
else
    echo {\"icon\":\"bluetooth\", \"state\":\"Critical\", \"text\":\"\"}
fi   
