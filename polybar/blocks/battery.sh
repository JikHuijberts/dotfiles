#!/usr/bin/env bash

BATTERY_INFO=($( acpi | awk -F',' '{ print $0 }'))

# Formatting helpers
CHARGE=$((${BATTERY_INFO[3]//%,}))
ICON=""
FORMAT=""

# Format battery icon, depending on the status.
if [[ "${BATTERY_INFO[2]}" == *"Charging"* ]]; then
    ICON="  " # Plug icon, font awesome.
else
    ICON="  " # Car Battery icon, font awesome
fi

if [[ $CHARGE -lt 10 ]]; then
    # Red-ish
    FORMAT="%{F#B33D43} "
elif [[ $CHARGE -lt 30 ]]; then
    # Orange-ish
    FORMAT="%{F#F27F24}  "
elif [[ $CHARGE -lt 60 ]]; then
    # Yellow-ish
    FORMAT="%{F#E5C167}  "
elif [[ $CHARGE -lt 101 ]]; then
    # Green-ish
    FORMAT="%{F#6FB379}  "
fi

# Format charge & color depending on the status.
FORMAT="$FORMAT$ICON%{B- F-}$CHARGE%{B- F-}"

# Final formatted output.
echo $FORMAT
