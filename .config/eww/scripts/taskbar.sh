#!/bin/sh

# Stop printing taskbar entry after 5 windows
# to stop eww from stretching
window_limit=5
get_current_desktop_window_ids() {
    xdotool search --onlyvisible --desktop "$(xdotool get_desktop)" --limit "$window_limit" --class ".*"
}

get_window_title() {
    # Replace quotes with escaped double quotes
    title=$(xdotool getwindowname "$1" | sed 's/"/\\"/g')
   
    if [ "${#title}" -ge "15" ]; then
        printf "%.12s...\n" "$title"
    else
        printf "%s\n" "$title"
    fi
}

spit_windows() {
    get_current_desktop_window_ids | while read -r id; do
        title=$(get_window_title "$id")
        out="(box :class \"window\" :space-evenly \"false\" :hexpand \"false\" :vexpand \"false\" \
            (button :class \"window-title\" :onclick \"xdotool windowactivate $id\" :timeout \"1s\" \
            (label :text \"$title\")) \
            (button :class \"close-button\" :onclick \"xdotool windowquit $id\" :timeout \"1s\" \
            (label :class \"taskbar-icon\" :text \"\")))"
        printf "%s" "$out"
    done
}

# I could listen instead of poll
# but the script would lockup when listening
# also title changes like browsers is hard to track when listening
printf "%s\n" "(box :space-evenly \"false\" :hexpand \"false\" :vexpand \"false\" $(spit_windows))"
