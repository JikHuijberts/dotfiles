#!/usr/bin/env bash

ICON=""
FORMAT=""
STRENGTH=""
SSID=""
WIFI_INFO="$(cut -d':' -f'2-3' <<< $(nmcli -t -f IN-USE,SIGNAL,SSID device wifi | grep '*'))"


if [ -z "$WIFI_INFO" ]
    then
        ICON="󰖪"
    else
        STRENGTH=$(echo "$WIFI_INFO" | cut -d':' -f1)
        SSID=$(echo "$WIFI_INFO" | cut -d':' -f2 )
        if [[ $STRENGTH -lt 10 ]]; then
            # Red-ish
            FORMAT="%{F#B33D43}"
            ICON="󰤯 "
        elif [[ $STRENGTH -lt 30 ]]; then
            # Orange-ish
            FORMAT="%{F#F27F24}"
            ICON="󰤟 "
        elif [[ $STRENGTH -lt 60 ]]; then
            # Yellow-ish
            FORMAT="%{F#E5C167}"
            ICON="󰤢 "
        elif [[ $STRENGTH -lt 101 ]]; then
            # Green-ish
            FORMAT="%{F#6FB379}"
            ICON="󰤨 "
        fi
fi


FORMAT="$FORMAT$ICON%{B- F-} $SSID%{B- F-}"

echo $FORMAT
