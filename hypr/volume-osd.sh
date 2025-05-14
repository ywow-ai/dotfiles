#!/bin/bash

status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(echo "$status" | awk '{print int($2 * 100)}')
muted=$(echo "$status" | awk '{print $3}')
icon=$(
    if [ "$muted" == "[MUTED]" ]; then echo "󰝟";
    elif [ "$volume" -lt 5 ]; then echo "󰕿";
    elif [ "$volume" -lt 50 ]; then echo "󰖀";
    else echo "󰕾";
  fi
)

notify-send -h string:x-canonical-private-synchronous:sys-notify -a x-osd -u low "$icon $volume%"
