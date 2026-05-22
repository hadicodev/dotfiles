#!/bin/bash

action=$1

case $action in
    up)
        brightnessctl set 5%+
        ;;
    down)
        brightnessctl set 5%-
        ;;
esac

# Get current brightness as percentage
level=$(brightnessctl -m | awk -F, '{print $4}' | tr -d '%')

if [ "$level" -le 33 ]; then
    icon="󰃞"
elif [ "$level" -le 66 ]; then
    icon="󰃟"
else
    icon="󰃠"
fi

notify-send -a "Brightness" -h string:x-canonical-private-synchronous:brightness \
    -h int:value:"$level" "$icon  Brightness" "$level%"
