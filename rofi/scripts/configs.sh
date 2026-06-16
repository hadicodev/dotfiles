#!/bin/bash

option=$(printf "Hyprland\nWaybar\nKitty\nSwaync" | rofi -dmenu -p "Edit Config" -theme "~/.config/rofi/type-2/style-1.rasi")

case "$option" in
    "Hyprland") kitty --hold nvim "/home/dragon/.config/hypr/modules" ;;
    "Kitty") kitty --hold nvim "/home/dragon/.config/kitty/kitty.conf" ;;
    "Waybar") kitty --hold nvim "/home/dragon/.config/waybar/config.jsonc" ;;
    "Swaync") kitty --hold nvim "/home/dragon/.config/swaync/config.json" ;;
esac
