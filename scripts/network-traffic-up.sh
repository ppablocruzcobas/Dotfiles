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

    echo "$bytes"
}

INTERFACES="enp4s0 wlp2s0" 

up=0
for interface in $INTERFACES; do
    touch $DIR/tx_$interface
    tx=$(cat $DIR/tx_$interface)
    if [[ $tx == "" ]]; then
        tx=0
    fi

    now_tx="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"
    echo $now_tx > $DIR/tx_$interface
    bytes_up=$(($now_tx - $tx))
    up=$(($up + $bytes_up))
done

echo {\"icon\":\"net_up\", \"state\":\"Idle\", \"text\":\"$(print_bytes $up)\"}

