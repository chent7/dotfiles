#!/bin/bash
if [[ $(xprop -id $(bspc query -N -n) WM_CLASS) = *"Steam"* ]]; then
    # unmap steam window
    xdotool windowunmap $(xdotool getactivewindow)
    return 0
else
    # close natively with bspc
    bspc node focused -c
    return 0
fi
