#!/bin/bash

# Legge la capacità della batteria e mostra icona + percentuale
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$status" = "Charging" ]; then
    echo "AC0 $capacity%"
elif [ "$status" = "Discharging" ]; then
    if [ "$capacity" -lt 15 ]; then
        echo "LOW $capacity%"
    else
        echo "BAT0 $capacity%"
    fi
else
    echo "FULL;"
fi
