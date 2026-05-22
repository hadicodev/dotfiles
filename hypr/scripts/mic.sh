#!/bin/bash

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -c "MUTED")

if [ "$is_muted" -eq 1 ]; then
    notify-send -a "Mic" -h string:x-canonical-private-synchronous:mic "󰍭  Mic Muted" ""
else
    notify-send -a "Mic" -h string:x-canonical-private-synchronous:mic "󰍬  Mic UnMuted" ""
fi
