#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo mkdir /usr/share/fonts/extra-fonts
    sudo tar xvzf assets/fonts.tar.gz --directory /usr/share/fonts/extra-fonts
fi

if [[ $osname == $debian ]]; then
    sudo mkdir /usr/share/fonts/extra-fonts
    sudo tar xvzf assets/fonts.tar.gz --directory /usr/share/fonts/extra-fonts
fi

if [[ $osname == $fedora ]]; then
    sudo mkdir /usr/share/fonts/extra-fonts
    sudo tar xvzf assets/fonts.tar.gz --directory /usr/share/fonts/extra-fonts
fi

if [[ $osname == $ubuntu ]]; then
    sudo mkdir /usr/share/fonts/extra-fonts
    sudo tar xvzf assets/fonts.tar.gz --directory /usr/share/fonts/extra-fonts
fi
