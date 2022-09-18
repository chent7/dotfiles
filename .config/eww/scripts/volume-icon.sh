#!/bin/sh

get_volume_icon() {
    icon=""
    volume=$(pamixer --get-volume)
    if [ $(pamixer --get-mute) = true ]; then
        icon=""
    elif [ $volume -gt 0 ]; then
        icon=""
        if [ $volume -gt 50 ]; then
            icon=""
        fi
    fi
    echo "$icon"
}

echo "(label :class \"icon\" :vexpand \"true\" :text \"$(get_volume_icon)\")"
# Listen for volume changes
# Best I can do is 2 updates per volume change
pactl subscribe | grep --line-buffered "sink" | while read -r; do
    # Print the volume icon
    echo "(label :class \"icon\" :vexpand \"true\" :text \"$(get_volume_icon)\")"
done
