#!/bin/bash -e

DIR=$(dirname "$(readlink -f "$0")")

##########################################################
# FUNCTIONS
##########################################################

function link() {
    if [ -d "$HOME/$1" ] || [ -f "$HOME/$1" ] || [ -h "$HOME/$1" ]; then
    	echo "Removing existing $HOME/$1"
    	rm -rf "$HOME/$1"
    fi

    ln -s "$DIR/$1" "$HOME/$1"
    echo "$DIR/$1 linked to $HOME/$1"
}

function copy() {
    cp -rf "$DIR/$1" "$HOME/$1"
    echo "$DIR/$1 copied to $HOME/$1"
}

##########################################################
# PROCESS
##########################################################

# INITIALIZATION
echo "Installing dotfiles..."

# SYMBOLIC LINKS
link ".ctags"
link ".tmux.conf"
link ".xinitrc"
#link ".Xresources"
link ".bashrc_common"
link ".gitignore"
link ".config/nvim"
link ".config/kitty"
#link ".config/openbox"
#link ".config/rofi"
link ".config/starship.toml"
#link ".config/lxqt/panel.conf"
#link ".config/lxqt/globalkeyshortcuts.conf"
#link ".local/bin"

# FINALIZATION
git config --global core.excludesfile ~/.gitignore

echo "Installation complete."
