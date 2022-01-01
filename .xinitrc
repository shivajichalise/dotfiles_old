#        _       _                _      
#       | |     | |              (_)     
#   __ _| |_ __ | |__   __ ___  ___ _ __ 
#  / _` | | '_ \| '_ \ / _` \ \/ / | '__| Shivaji Chalise (alphajr)
# | (_| | | |_) | | | | (_| |>  <| | |    http://www.github.com/shivajichalise
#  \__,_|_| .__/|_| |_|\__,_/_/\_\ |_|   
#         | |                   _/ |     
#         |_|                  |__/      
#
# X Window System Initializer

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# start some nice programs
picom &
xset r rate 280 50 &
exec i3
