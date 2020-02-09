#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install retroarch libretro-* -y
    sudo apt purge gnome-games-app -y
    sudo adduser $username input
    mkdir /tmp/retroarch
    sudo tar xvzf assets/retroarch.tar.gz --directory /tmp/retroarch
    cd "/tmp/retroarch"
    sudo ./configure
    sudo make
    sudo make install
    cd $OLDPWD
    rm -r "/tmp/retroarch"
fi

if [[ $osname == $fedora ]]; then
    $missing
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install retroarch libretro-* -y
    sudo apt purge gnome-games-app -y
    sudo adduser $username input
    mkdir /tmp/retroarch
    sudo tar xvzf assets/retroarch.tar.gz --directory /tmp/retroarch
    cd "/tmp/retroarch"
    sudo ./configure
    sudo make
    sudo make install
    cd $OLDPWD
    rm -r "/tmp/retroarch"
fi
