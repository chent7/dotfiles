#!/bin/sh
if [[ $(xprop -id $(bspc query -N -n) WM_CLASS) = *"Steam"* ]]; then
    # unmap steam window
    xdotool windowunmap $(xdotool getactivewindow)
    exit
else
    # close natively with bspc
    bspc node focused -c
    exit;
fi
