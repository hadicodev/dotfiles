#!/bin/bash

action=$1

case $action in
    up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
esac

# Get current volume and mute status
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
is_muted=$(echo "$volume" | grep -c "MUTED")

# Extract level as percentage (e.g. "Volume: 1.00" -> 100, "Volume: 0.47" -> 47)
level=$(echo "$volume" | awk '{print $2}' | awk '{printf "%d", $1 * 100}')

[ -z "$level" ] && level=0

if [ "$is_muted" -eq 1 ]; then
    icon="󰝟"
    notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume \
        -h int:value:0 "$icon Muted" ""
elif [ "$level" -le 33 ]; then
    icon="󰕿"
    notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume \
        -h int:value:"$level" "$icon Volume" "$level%"
elif [ "$level" -le 66 ]; then
    icon="󰖀"
    notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume \
        -h int:value:"$level" "$icon Volume" "$level%"
else
    icon="󰕾"
    notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume \
        -h int:value:"$level" "$icon Volume" "$level%"
fi
