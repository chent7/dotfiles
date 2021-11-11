### MAKE SURE YOU HAVE CORRECT DRIVERS INSTALLED
## AND/OR INSTALL steam-native-runtime FROM ARCH REPOS

1. create 32-bit wine prefix called 'osu-wine-32' here
2. install dotnet472 dotnet48 gdiplus using winetricks
3. run winetricks settings fontsmooth=rgb & winetricks sound=alsa
4. run wine regedit dsound.reg, fonts-1.reg, and fonts-2.reg
5. obtain a copy of Windows 10 fonts and copy to 'osu-wine-32/drive_c/windows/Fonts'
6. make sure osu!.desktop and osu-32.sh are executable
7. symlink osu!.desktop to '~/.local/share/applications' or '/usr/share/applications'

### I DO NOT OWN winediscordipcbridge.exe
## ANY MODIFICATION/COMMERICAL USAGE REQUIRES PERMISSION FROM ORIGINAL AUTHOR
https://github.com/0e4ef622/wine-discord-ipc-bridge
