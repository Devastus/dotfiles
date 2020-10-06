#!/bin/sh -e

DIR=$(dirname $0)
cat $DIR/alacritty_base.yml $DIR/alacritty_color.yml > $DIR/alacritty.yml
