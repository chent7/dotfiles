#!/bin/sh
# Debating on whether this script should be called
# once or polled
# Calling once means if you change the number
# of workspaces these entries won't update and
# moving windows to non-existing workplaces
# can crash the window manager

get_current_id() {
    printf "%s\n" "$(xdotool get_desktop)"
}

get_max_id() {
    printf "%s\n" "$(($(xdotool get_num_desktops)-1))"
}

get_next_workspace_id(){
    if [ "$(get_current_id)" -ge "$(get_max_id)" ]; then
        printf "%s\n" "0"
    else
        out=$(($(get_current_id)+1))
        printf "%s\n" "$out"
    fi
}

get_previous_workspace_id(){
    if [ "$(get_current_id)" -le "0" ]; then
        printf "%s\n" "$(get_max_id)"
    else
        out=$(($(get_current_id)-1))
        printf "%s\n" "$out"
    fi
}

get_wm_name() {
    printf "%s\n" "$(wmctrl -m | grep -w "Name:" | cut -d " " -f2)"
}

window_move() {
    if [ "$1" != "left" ] && [ "$1" != "right" ]; then
        return 1
    fi
    
    case "$(get_wm_name)" in
        "herbstluftwm")
            herbstclient shift "$1";;
        *)
            return 0;;
    esac
}

case $1 in
    "--next-id"|"-n")
        get_next_workspace_id;;

    "--previous-id"|"-p")
        get_previous_workspace_id;;

    "--move"|"-m")
        window_move $2;;
esac
