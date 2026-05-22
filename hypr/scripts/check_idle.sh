#!/bin/bash

ACTION=$1

# Check ALL players for "Playing"
if playerctl --all-players status 2>/dev/null | grep -q "Playing"; then
    exit 0
fi

# No media playing
case "$ACTION" in
    lock)
        loginctl lock-session
        ;;
    suspend)
        systemctl suspend
        ;;
esac