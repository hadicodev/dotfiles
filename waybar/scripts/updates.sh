#!/bin/bash
pacman=$(checkupdates | wc -l)
flatpak=$(flatpak remote-ls --updates 2>/dev/null | wc -l)
total=$((pacman + flatpak))

echo "{\"text\": \"$total\", \"tooltip\": \"Pacman: $pacman\nFlatpak: $flatpak\"}"
