#!/bin/sh

PACKAGE_REPO="https://github.com/void-linux/void-packages.git"

echo "Installing packages..."
xbps-install -Suy
xbps-install -y void-repo-nonfree && xbps-install -Suy
xbps-install -y xtools xorg xdg-utils lxqt sddm kitty neovim lf tmux git curl rofi \
    polkit elogind nerd-fonts alsa-utils pulseaudio unzip unrar picom htop \
    firefox libreoffice papirus-icon-theme xclip \
    nodejs python3 python3-pip go openjdk11 apache-maven ccls base-devel gdb

echo "Linking services..."
ln -s /etc/sv/{dbus,elogind,polkitd,pulseaudio} /var/service

echo "Cloning void-packages repository..."
if [ ! -d "/usr/share/void-packages" ]; then
    cd /usr/share
    git clone $PACKAGE_REPO
    chown root:wheel /usr/share/void-packages
    chmod 770 /usr/share/void-packages
    cd /usr/share/void-packages
    ./xbps-src binary-bootstrap
    echo "XBPS_ALLOW_RESTRICTED=yes" >> etc/conf
fi

echo "Bootstrap complete."
