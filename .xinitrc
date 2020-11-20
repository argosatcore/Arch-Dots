#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


#----merge in defaults and keymaps

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


#----start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


#----Set keyboard layout:
setxkbmap latam &


#----Start compositor:
picom --config /home/carlos/.config/picom/picom.conf &


#----Enable transparency for Xterm:
#devilspie &


#----Set screen brightness to 5%:
xbacklight -set 5


#----start the Tint2 panel:
tint2 &


#----Lefthanded mouse:
xmodmap .mouseconfig &


#----Swap Esc with Caps Lock:
xmodmap .speedswapper &


#----Set cursor:
xsetroot -cursor_name right_ptr &


#---Nordify .Xresources
#xrdb .Xresources 


#----Set random wallpapers:
#feh --bg-fill --randomize /home/carlos/Pictures/Wallpapers/ &	 
feh --bg-fill /home/carlos/Pictures/Wallpapers/ArchNord.png &	

#----Start sxhkd:
pgrep -x sxhkd > /dev/null || sxhkd &

#----Start window manager
exec bspwm


