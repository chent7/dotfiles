#!/bin/sh
# A very inefficient launcher for eww

get_app_dirs() {
    printf "%s\n%s\n" "$(ls /usr/share/applications/*.desktop)" \
        "$(ls $HOME/.local/share/applications/*.desktop)"
}

is_hidden() {
    cat $1 | grep -e "NoDisplay=true"
}

get_name() {
    cat $1 | grep -e "Name=" | grep -w "Name" | head -n1 | cut -d "=" -f2
}

get_icon_name() {
    cat $1 | grep -e "Icon=" | head -n1 | cut -d "=" -f2
}

get_icons() {
    find "/usr/share/icons" "/usr/share/pixmaps" "$HOME/.local/share/icons" -name "$1.*" | sort
}

get_current_icon_theme() {
    # Thank you neofetch man
    # Can use Qt if you want I guess
    cat "$HOME/.config/gtk-3.0/settings.ini" | grep -w "gtk-icon-theme-name" | cut -d "=" -f2
}

get_apps_info() {
    get_app_dirs | while read -r file; do
        hidden=$(is_hidden $file)
        if [ -n "$hidden" ]; then
            continue
        fi
        
        name=$(get_name $file)
        icon=$(get_icon_name $file)
        icons=$(get_icons $icon)
        
        # Finding order should be
        # single location > vector themed > themed > vector default > default
        if [ -z "$icons" ]; then
            icons=$icon
            printf "%s=%s\n" "$name" "$icons"
            continue
        else
            themed_icons=$(echo "$icons" | grep -w "$vanilla_icon_theme")
            # Themed icons
            if [ -n "$themed_icons" ]; then
                # Vector themed icons
                themed_vector=$(echo "$themed_icons" | grep -e ".svg")
                if [ -n "$themed_vector" ]; then
                    variant=$(echo "$themed_vector" | grep -w "$icon_theme" | tail -n1)
                    if [ -n "$variant" ]; then
                        # i.e Papirus-Dark
                        printf "%s=%s\n" "$name" "$variant"
                        continue
                    else
                        # i.e Papirus
                        out=$(echo "$themed_vector" | tail -n1)
                        printf "%s=%s\n" "$name" "$out"
                        continue
                    fi
                else
                    # Pixel themed icons which would be $themed_icons
                    out=$(echo "$themed_icons" | tail -n1)
                    printf "%s=%s\n" "$name" "$out"
                    continue
                fi
            else
                # Default icons which would be $icons
                vector=$(echo "$icons" | grep -e ".svg" | tail -n1)
                if [ -n "$vector" ]; then
                    # Vector default icons
                    printf "%s=%s\n" "$name" "$vector"
                    continue
                else
                    # Pixel default icons
                    out=$(echo "$icons" | tail -n1)
                    printf "%s=%s\n" "$name" "$out"
                    continue
                fi
            fi
        fi
    done
}

output_apps() {
    apps=$(echo "$(get_apps_info)" | sort)

    for app in "$apps"; do
        :
    done
}

icon_theme=$(get_current_icon_theme)
vanilla_icon_theme=$(echo "$icon_theme" | cut -d "-" -f1)
launcher_column_size=5
    
output_apps $launcher_column_size
