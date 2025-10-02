#!/bin/bash

chosen=$(echo -e "  Lock\n⏾  Suspend\n\uf021  Reboot\n⏻  Shutdown\n✖  Cancel" | rofi -dmenu -i -p "Power menu")

case "$chosen" in
    "  Lock") i3lock -e -f -i ~/Pictures/Sfondo;;
    "⏾  Suspend") systemctl suspend ;;
   
    "\uf021  Reboot") systemctl reboot ;;
    "⏻  Shutdown") systemctl poweroff ;;
    *) exit 0 ;;
esac

