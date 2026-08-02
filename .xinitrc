#!/bin/sh

# 1. Maintain system-wide default scripts (Highly recommended)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# 2. Set up environment variables
export GTK_THEME="Adwaita:dark"
export EDITOR="nano"

# 3. Load X resources (fonts, colors, DPI)
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

setxkbmap us,ru -option grp:alt_shift_toggle
feh --bg-scale ~/.config/hypr/Wallpaper/001.jpg &

pamixer --set-volume 100

udiskie --no-automount &
numlockx &

exec i3
