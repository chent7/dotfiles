#!/bin/sh
# kill polybar
killall -q polybar

# source pywal colors
source ~/.cache/wal/colors.sh

# export envar with alpha set
ALPHA=aa;
export background_a="#$ALPHA${background/'#'}"
export foreground_a="#$ALPHA${foreground/'#'}"
export cursor_a="#$ALPHA${cursor/'#'}"

export color0_a="#$ALPHA${color0/'#'}"
export color1_a="#$ALPHA${color1/'#'}"
export color2_a="#$ALPHA${color2/'#'}"
export color3_a="#$ALPHA${color3/'#'}"
export color4_a="#$ALPHA${color4/'#'}"
export color5_a="#$ALPHA${color5/'#'}"
export color6_a="#$ALPHA${color6/'#'}"
export color7_a="#$ALPHA${color7/'#'}"
export color8_a="#$ALPHA${color8/'#'}"
export color9_a="#$ALPHA${color9/'#'}"
export color10_a="#$ALPHA${color10/'#'}"
export color11_a="#$ALPHA${color11/'#'}"

# launch polybar
polybar main
