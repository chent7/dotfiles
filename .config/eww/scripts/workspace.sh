#!/bin/sh
# Thanks eww man and all others that contributed to example bars!
# Every wm controlable with wmctrl should work??

get_workspaces_info() {
    wmctrl -d | awk '{ print $1 " " $2 }'
}

print_workspaces() {
    get_workspaces_info | while read -r id state; do
        # Each iteration is one workspace
        # Priority: focused > occupied > empty; to ignore multiple checks
        case $id in
            "0")
                icon="";;
            "1")
                icon="";;
            "2")
                icon="";;
            "3")
                icon="";;
            "4")
                icon="";;
            "5")
                icon="";;
            "6")
                icon="";;
            "7")
                icon="";;
            "8")
                icon="";;
            "9")
                icon="";;
            *)
                continue;;          
        esac
        
        if [ "$state" = "*" ]; then
            class="focused"
        elif wmctrl -l | awk '{print $2}' | grep "$id" >/dev/null; then
            class="occupied"
        else
            class="empty"
        fi

        # Output for a single workspace
        # Eww eventbox for cursor definition
        buffer="(eventbox :cursor \"hand\" \
            (button :class \"workspace-button\" :onclick \"wmctrl -s $id\" \
            (label :class \"workspace-icon-$class\" :text \"$icon\")))"
        # This is used since subshell modification is local
        # see there's no newline here
        printf "%s" "$buffer"
    done
}

# Listen to window manager events
xprop -spy -root _NET_CLIENT_LIST _NET_ACTIVE_WINDOW _NET_CURRENT_DESKTOP | while read -r; do
    # Output for all workspaces
    printf "%s\n" "(box :orientation \"h\" :class \"workspaces\" \
        :hexpand \"false\" :vexpand \"true\" \
        :halign \"center\" :valign \"center\" \
        $(print_workspaces))"
done
