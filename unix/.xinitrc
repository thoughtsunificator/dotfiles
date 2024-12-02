#!/bin/sh

# copied from /etc/X11/xinit/xinitrc

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

# Set mouse acceleration and threshold
xset m 5 1 
# disable dpms
xset s off -dpms
# immediately switches the source and/or sink to the latest hotplugged device
pactl load-module module-switch-on-connect
# set i3 as desktop
export XDG_SESSION_DESKTOP=i3
export XDG_CURRENT_DESKTOP=i3
# persist clipmenu clipboard
export CM_DIR=$HOME/.clipboard

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# start i3 and keep it running
exec /home/romain/forks/i3/build/i3
