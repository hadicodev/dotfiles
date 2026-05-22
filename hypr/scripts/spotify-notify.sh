#!/bin/bash

prev_title=""

while true; do
    status=$(playerctl --player=spotify status 2>/dev/null)

    if [[ "$status" == "Playing" ]]; then
        title=$(playerctl --player=spotify metadata title 2>/dev/null)
        artist=$(playerctl --player=spotify metadata artist 2>/dev/null)

        if [[ "$title" != "$prev_title" && -n "$title" ]]; then
            notify-send -a "Spotify" -i "spotify" "Now Playing" "$artist - $title"
            prev_title="$title"
        fi
    fi

    sleep 2
done
