#!/bin/bash
source config.sh

link_retroarch_assets="https://buildbot.libretro.com/assets/frontend/assets.zip"

if [[ $osname == $archlinux ]]; then
    $missing
fi

if [[ $osname == $debian ]]; then
    sudo apt install retroarch -y
    sudo apt install libretro-* -y
    sudo apt purge gnome-games-app -y
    sudo adduser $username input
    sudo mkdir "/tmp/retroarch-assets"
    sudo wget $link_retroarch_assets -O "/tmp/retroarch-assets/retroarch-assets.zip"
    sudo unzip "/tmp/retroarch-assets/retroarch-assets.zip" -d "/tmp/retroarch-assets"
    cd "/tmp/retroarch-assets"
    sudo ./configure
    sudo make
    sudo make install
    cd $OLDPWD
    sudo rm -r "/tmp/retroarch-assets"
fi

if [[ $osname == $fedora ]]; then
    $missing
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install retroarch -y
    sudo apt install libretro-* -y
    sudo apt purge gnome-games-app -y
    sudo adduser $username input
fi
