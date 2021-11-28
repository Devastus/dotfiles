#!/bin/sh

if [ -f "$HOME/.Xresources" ]]; then
    xrdb -merge -I$HOME $HOME/.Xresources
fi

xset r rate 300 50 &
exec startlxqt
