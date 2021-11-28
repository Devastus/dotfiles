#!/bin/sh

SRC="$HOME/.cache/wal"

if [ -d "$SRC" ]; then
    cp "$SRC/colors-kitty.conf" "$HOME/.config/kitty/colors.conf"
    cp "$SRC/colors.Xresources" "$HOME/.Xresources"
fi
