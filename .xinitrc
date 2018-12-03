#!/bin/sh
# $XConsortium: xinitrc.cpp,v 1.4 91/08/22 11:41:34 rws Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# If the user lacks $HOME/GNUstep, install it:
#if [ ! -f $HOME/GNUstep/Defaults/WindowMaker ]; then
#    wmaker.inst
#fi

# Test for cpp, which wmaker uses to process config files:
#if [ ! -x /usr/bin/cpp ]; then
#  NOCPP="--no-cpp"
#fi

# Start the window manager:
#if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
#  exec ck-launch-session dbus-launch --exit-with-session /usr/bin/wmaker $NOCPP
#else
#  exec dbus-launch --exit-with-session /usr/bin/wmaker $NOCPP
#fi

# Thinkpad Trackpoint Scrolling
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# autostart
xset r rate 350 35 &
xset b off &
#wal -i "$(< "${HOME}/.cache/wal/wal")" -t &
#nitrogen --restore &
hsetroot -solid "#303030" &
#sleep 1; bash .scripts/compton.sh &
sleep 1; bash .scripts/dunst_reload.sh &
beep -f 200 -l 1000 -D 500 -n -f 1000 -l 50 -D 50 -n -f 2000 -l 50 -D 50 -n -f 800 -l 50 -D 50 -n -f 1000 -l 50 -D 50 -n  -f 2000 -l 50 -D 50 -n  -f 3000 -l 50
udiskie &&
mpd &
#while true; do
#    sh ~/.scripts/dwm_status.sh
#    sleep 1
#done &

# awesome
#exec awesome

# bspwm
#sxhkd &
#exec bspwm

# pekwm
#exec pekwm

# btdwm
#exec btdwm

# dwm
#while true; do
    # Log stderror to a file 
#    slstatus &
#    dwm 1> ~/.dwm.log
    # No error logging
#    dwm >/dev/null 2>&1
#done

# i3
exec i3

# xfce
#exec startxfce4

# 2bwm
#bash ~/.scripts/bar.sh | lemonbar -p -f "GohuFont:size=8" -f "Sazanami Gothic:size=6" &
#exec 2bwm
#st

# catwm
#catwm

# musca
#musca

# snapwm / Nextwm
#exec snapwm
