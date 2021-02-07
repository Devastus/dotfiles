#!/bin/bash -e

DIR=$(dirname "$(readlink -f "$0")")

##########################################################
# FUNCTIONS
##########################################################

function link() {
    if [ -d "$DIR/$1" ]; then
        # Check whether directory exists
        if [ -d "$HOME/$1"  ]; then
            rm -rf "$HOME/$1"
        fi
        ln -s "$DIR/$1" "$HOME/$1"
    else
        # Check whether file exists
        if [ -f "$HOME/$1"  ]; then
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
# git submodule update --init --recursive
sh "$DIR/.config/alacritty/generate_conf.sh"

# INSTALLATION

# SYMBOLIC LINKS
# link ".vim"
link ".ctags"
link ".tmux.conf"
link ".gdbinit"
link ".config/nvim"
link ".config/alacritty"
# link ".config/kak"
# link ".config/kak-lsp"
link "bin"
link ".config/starship.toml"
link ".bashrc_common"
link ".gitignore"

# FINALIZATION
git config --global core.excludesfile ~/.gitignore

echo "Installation complete."
