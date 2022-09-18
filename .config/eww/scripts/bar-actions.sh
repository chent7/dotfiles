#!/bin/sh

launcher () {
    rofi -show drun &
}

calendar() {
    eww open --toggle calendar
}

case $1 in
    "--launcher"|"-l")
        launcher
        ;;
    "--calendar"|"-c")
        calendar
        ;;
    *)
        ;;
esac
