DIR=~/Pictures/wallpapers/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}
swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type any --transition-duration 3
wal -i ${DIR}/${RANDOMPICS}
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/look/colors.conf
pywalfox update

notify-send -i ${DIR}/${RANDOMPICS} "Wallpaper Changed" ${RANDOMPICS}