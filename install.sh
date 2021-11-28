#!/bin/bash -e

DIR=$(dirname "$(readlink -f "$0")")

##########################################################
# FUNCTIONS
##########################################################

function link() {
    if [ -d "$DIR/$1" ]; then
        # Check whether directory exists
        if [ -d "$HOME/$1"  ]; then
            echo "Removing existing directory $HOME/$1"
            rm -rf "$HOME/$1"
        fi
        ln -s "$DIR/$1" "$HOME/$1"
    else
        # Check whether file exists
        if [ -f "$HOME/$1"  ]; then
            echo "Removing existing file $HOME/$1"
            rm -f "$HOME/$1"
        fi
        ln -s "$DIR/$1" "$HOME/$1"
    fi
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
link ".bashrc_common"
link ".gitignore"
link ".config/nvim"
link ".config/kitty"
link ".config/openbox"
link ".config/rofi"
link ".config/starship.toml"
link ".local/bin"

# FINALIZATION
git config --global core.excludesfile ~/.gitignore

echo "Installation complete."
