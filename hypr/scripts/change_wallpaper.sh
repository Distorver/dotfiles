DIR=~/Pictures/wallpapers/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}
awww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type any --transition-duration 3
wal -i ${DIR}/${RANDOMPICS}
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/look/colors.conf
cp ~/.cache/wal/color.ini ~/.config/spicetify/Themes/text/color.ini
cp ~/.cache/wal/obsidian.css "/home/thinkpad/Documentes/My Brain/.obsidian/themes/"
pywalfox update

notify-send -i ${DIR}/${RANDOMPICS} "Wallpaper Changed" ${RANDOMPICS}