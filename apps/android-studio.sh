#!/bin/bash
source config.sh

link_android_studio="https://dl.google.com/dl/android/studio/ide-zips/3.5.1.0/android-studio-ide-191.5900203-linux.tar.gz"

if [[ $osname == $archlinux ]]; then
    mkdir /tmp/android-studio
    wget $link_android_studio -O /tmp/android-studio/android-studio.tar.gz
    sudo tar xvzf /tmp/android-studio/android-studio.tar.gz --directory /opt
    rm -r /tmp/android-studio
    sudo bash -c "cat strings/launcher-android-studio > /usr/share/applications/android-studio.desktop"
fi

if [[ $osname == $debian ]]; then
    sudo apt install lib32stdc++6 unzip -y
    mkdir /tmp/android-studio
    wget $link_android_studio -O /tmp/android-studio/android-studio.tar.gz
    sudo tar xvzf /tmp/android-studio/android-studio.tar.gz --directory /opt
    rm -r /tmp/android-studio
    sudo bash -c "cat strings/launcher-android-studio > /usr/share/applications/android-studio.desktop"
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install zlib.i686 ncurses-libs.i686 bzip2-libs.i686 -y
    mkdir /tmp/android-studio
    wget $link_android_studio -O /tmp/android-studio/android-studio.tar.gz
    sudo tar xvzf /tmp/android-studio/android-studio.tar.gz --directory /opt
    rm -r /tmp/android-studio
    sudo bash -c "cat strings/launcher-android-studio > /usr/share/applications/android-studio.desktop"
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install lib32stdc++6 unzip -y
    mkdir /tmp/android-studio
    wget $link_android_studio -O /tmp/android-studio/android-studio.tar.gz
    sudo tar xvzf /tmp/android-studio/android-studio.tar.gz --directory /opt
    rm -r /tmp/android-studio
    sudo bash -c "cat strings/launcher-android-studio > /usr/share/applications/android-studio.desktop"
fi
