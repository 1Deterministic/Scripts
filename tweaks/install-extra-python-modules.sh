#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    sudo pacman -S python python-pip --noconfirm
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi

if [[ $osname == $debian ]]; then
    sudo apt install python3 python3-pip -y
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install python python-pip -y
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install python3 python3-pip -y
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi