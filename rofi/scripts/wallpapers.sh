#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers"
CACHE_DIR="$HOME/.cache/rofi-wallpapers"
SELF="$(realpath "$0")"

mkdir -p "$CACHE_DIR"

get_thumb() {
    local img="$1"
    local hash thumb
    hash=$(md5sum "$img" | awk '{print $1}')
    thumb="$CACHE_DIR/$hash.jpg"
    if [[ ! -f "$thumb" ]]; then
        convert "$img" -thumbnail "480x270^" -gravity center -extent "480x270" -quality 85 "$thumb"
    fi
    echo "$thumb"
}

case "${1:-}" in
    --picker)
        if [[ -n "${2:-}" ]]; then
            # an entry was selected → apply it
            img=$(find "$WALLPAPER_DIR" -type f | grep -iE '\.(jpg|jpeg|png|webp)$' | grep -F "/$2" | head -1)
            awww img "$img" --transition-type grow --transition-pos 0.5,0.5 --transition-duration 1.5 --transition-fps 60
            echo "$img" > "$CACHE_DIR/last"
        else
            # initial call → list wallpapers with thumbnails
            find "$WALLPAPER_DIR" -type f | grep -iE '\.(jpg|jpeg|png|webp)$' | sort | while IFS= read -r img; do
                thumb=$(get_thumb "$img")
                printf '%s\0icon\x1f%s\n' "$(basename "$img")" "$thumb"
            done
        fi
        ;;
    *)
        rofi -show w -modes "w:$SELF --picker" -show-icons -icon-size 128 -columns 4 -p "Wallpapers" -theme ~/.config/rofi/type-2/style-1.rasi
        ;;
esac
