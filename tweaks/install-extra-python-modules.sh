#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi

if [[ $osname == $debian ]]; then
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi

if [[ $osname == $fedora ]]; then
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi

if [[ $osname == $ubuntu ]]; then
    pip3 install --user nuitka xlsxwriter python-magic eyed3 cython pygame git+https://github.com/kivy/kivy.git@master
fi