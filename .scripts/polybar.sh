#!/bin/sh
# kill polybar
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

# export envar for pywal colors instead of sourcing 
# so colors hold after reboot
ALPHA=aa;
export background="${background}"
export background_alpha="#$ALPHA${background/'#'}"
export foreground="${foreground}"
export color0="${color0}"
export color1="${color1}"
export color2="${color2}"
export color3="${color3}"
export color4="${color4}"
export color5="${color5}"
export color6="${color6}"
export color7="${color7}"
export color8="${color8}"
export color9="${color9}"
export color10="${color10}"
export color11="${color11}"
export color12="${color12}"
export color13="${color13}"
export color14="${color14}"
export color15="${color15}"

# launch polybar
polybar $1
