#!/bin/bash

WALL_DIR="/home/thinkpad/Pictures/wallpapers/"

SELECTED=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) \
    | while read -r img; do
        printf '%s\0icon\x1f%s\n' "$img" "$img"
      done \
    | rofi -dmenu -i -show-icons -theme "~/.config/rofi/style.rasi"
)

[ -z "$SELECTED" ] && exit 0

if ! pgrep -x "awww" > /dev/null; then
    awww &
    sleep 0.2
fi

awww img $SELECTED --transition-fps 60 --transition-type any --transition-duration 2
wal -i $SELECTED
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/look/colors.conf
cp ~/.cache/wal/color.ini ~/.config/spicetify/Themes/text/color.ini
cp ~/.cache/wal/obsidian.css "/home/thinkpad/Documentes/My Brain/.obsidian/themes/"
ln -sf $SELECTED ~/.current_wallpaper.png
pywalfox update

notify-send -i $SELECTED "Wallpaper Changed" $SELECTED