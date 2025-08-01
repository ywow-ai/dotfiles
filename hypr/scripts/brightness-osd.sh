#!/bin/bash

max_brightness=$(cat /sys/class/backlight/*/max_brightness)
current_brightness=$(cat /sys/class/backlight/*/brightness)
brightness_percentage=$(( 100 * current_brightness / max_brightness ))
icon_strings=("󰃚" "󰃛" "󰃜" "󰃝" "󰃞" "󰃟" "󰃠")
num_icons=${#icon_strings[@]}
icon_index=$((brightness_percentage * (num_icons - 1) / 100))
icon="${icon_strings[$icon_index]}"

notify-send -h string:x-canonical-private-synchronous:sys-notify -a x-osd -u low "$icon $brightness_percentage%"
echo $brightness_percentage $icon_index