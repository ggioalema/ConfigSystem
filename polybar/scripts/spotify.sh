#!/bin/bash

status=$(playerctl status 2>/dev/null)
if [ "$status" = "Playing" ]; then
    song=$(playerctl metadata title)
    artist=$(playerctl metadata artist)
    echo "$artist - $song"
else
    echo "Pausa"
fi
