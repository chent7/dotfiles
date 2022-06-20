#!/bin/sh

export vblank_mode=0
export WINEPREFIX="$HOME/Games/.wine-prefixes/osu!/wine"
export WINEARCH=win32
export PIPEWIRE_LATENCY=128/48000

pgrep -x winediscordipcbridge.exe > /dev/null || wine "$HOME/Games/.wine-prefixes/osu!/resources/winediscordipcbridge.exe" &

sleep 1
wine "/run/media/chent7/Fast Storage/Games/osu!/osu!.exe" $@
