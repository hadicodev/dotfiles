option=$(printf "Config\nWallpaper" | rofi -dmenu -theme "~/.config/rofi/type-2/style-1.rasi")

case "$option" in
    "Config") bash -e "/home/dragon/.config/rofi/scripts/configs.sh" ;;
    "Wallpaper") bash -c "/home/dragon/.config/rofi/scripts/wallpapers.sh";;
esac
