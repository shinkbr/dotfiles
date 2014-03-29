#!/bin/sh
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
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

#load color profile
xcalib /usr/share/color/icc/MBA/Color\ LCD-00000610-0000-9CF0-0000-000004273C00.icc &

#start uim
uim-xim &
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS=@im=uim


#suspend after idle for 60min and disable screen blanking
xautolock -time 60 -detectsleep -locker "systemctl suspend" &
xset -dpms; xset s off &

#Disable taps just after a keyboard input
syndaemon -t -k -i 1 -d &

#add keybinds
xcape -e '#133=Shift_L|Muhenkan' &
xcape -e '#134=Shift_L|Henkan_Mode' &
xbindkeys &

#X stuff
xcompmgr -c -f -I 1 -O 1 &
xsetroot -cursor_name left_ptr &
hsetroot -full $HOME/Pictures/Wallpapers/Current/*
exec xmonad
