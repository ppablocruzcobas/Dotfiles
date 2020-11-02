#! /bin/sh
#
# network-traffic.sh
# Copyright (C) 2020 Pedro Pablo <ppablocruzcobas@gmail.com>
#
# Distributed under terms of the MIT license.
#
# DIR=/home/ppablocruzcobas/.config/i3/scripts
DIR=/tmp

print_bytes() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then
        bytes="0 kB/s"
    elif [ "$1" -lt 1000000 ]; then
        bytes="$(echo "scale=0;$1/1000" | bc -l ) kB/s"
    else
        bytes="$(echo "scale=1;$1/1000000" | bc -l ) MB/s"
    fi

    echo $bytes
}

INTERFACES="enp4s0 wlp2s0"
down=0
for interface in $INTERFACES; do
    touch $DIR/rx_$interface
    rx=$(cat $DIR/rx_$interface)
    if [[ $rx == "" ]]; then
        rx=0
    fi

    now_rx="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
    echo $now_rx > $DIR/rx_$interface
    bytes_down=$(($now_rx - $rx))
    down=$(($down + $bytes_down))
done

echo {\"icon\":\"net_down\", \"state\":\"Idle\", \"text\":\"$(print_bytes $down)\"} ;

