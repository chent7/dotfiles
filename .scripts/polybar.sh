#!/bin/sh
# kill polybar
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

# source pywal colors
source ~/.cache/wal/colors.sh

# export envar with alpha set
ALPHA=aa;
export background_a="#$ALPHA${background/'#'}"

# launch polybar
polybar bar
