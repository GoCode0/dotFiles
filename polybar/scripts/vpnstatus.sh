#!/bin/sh

IFACE=$(ifconfig | grep tun | awk '{print $1}')

if [ "$IFACE" = "tun*" ]; then
    echo "#1 %{u#55aa55}$(ifconfig tun0 | grep inet | awk '{print $2}' | cut -f2 -d ':')%{u-}"
else
    echo "%{F#FF0000}%{u#FF0000}VPN DISCONNECTED%{u-}%{F-}"
fi
