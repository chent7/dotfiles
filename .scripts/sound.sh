#!/bin/sh

pactl set-card-profile 2077 output:analog-stereo
pactl set-card-profile 2077 output:iec958-stereo
pactl get-default-sink
