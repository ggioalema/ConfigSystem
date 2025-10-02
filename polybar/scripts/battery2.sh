#!/usr/bin/env bash

PRIMARY="#F0C674"
RESET="%{F-}"

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$status" = "Charging" ]; then
    output="AC $capacity%"
elif [ "$status" = "Discharging" ]; then
    output="BAT $capacity%"
    if [ "$capacity" -le 10 ]; then
        output="⚠ $capacity%"
        notify-send -u critical "Battery low" "Only $capacity% remaining!" -i battery-caution
    fi
else
    output="FULL"
fi

first=$(echo "$output" | cut -d' ' -f1)
rest=$(echo "$output" | cut -d' ' -f2-)

if [ "$output" = "FULL" ]; then
    echo "%{F$PRIMARY}${first}${RESET}"
else 
    echo "%{F$PRIMARY}${first}${RESET} ${rest}"
fi

