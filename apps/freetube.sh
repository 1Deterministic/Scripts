#!/bin/bash
source config.sh

link_freetube="https://github.com/FreeTubeApp/FreeTube/releases/download/v0.7.2-beta/FreeTube-0.7.2-linux.tar.xz"

if [[ $osname == $archlinux ]]; then
    mkdir /tmp/freetube
    wget $link_freetube -O /tmp/freetube/freetube.tar.xz
    sudo tar xf /tmp/freetube/freetube.tar.xz --directory /opt
    sudo bash -c "cat strings/launcher-freetube > /usr/share/applications/freetube.desktop"
    rm -r /tmp/freetube
fi

if [[ $osname == $debian ]]; then
    mkdir /tmp/freetube
    wget $link_freetube -O /tmp/freetube/freetube.tar.xz
    sudo tar xf /tmp/freetube/freetube.tar.xz --directory /opt
    sudo bash -c "cat strings/launcher-freetube > /usr/share/applications/freetube.desktop"
    rm -r /tmp/freetube
fi

if [[ $osname == $fedora ]]; then
    mkdir /tmp/freetube
    wget $link_freetube -O /tmp/freetube/freetube.tar.xz
    sudo tar xf /tmp/freetube/freetube.tar.xz --directory /opt
    sudo bash -c "cat strings/launcher-freetube > /usr/share/applications/freetube.desktop"
    rm -r /tmp/freetube
fi

if [[ $osname == $ubuntu ]]; then
    mkdir /tmp/freetube
    wget $link_freetube -O /tmp/freetube/freetube.tar.xz
    sudo tar xf /tmp/freetube/freetube.tar.xz --directory /opt
    sudo bash -c "cat strings/launcher-freetube > /usr/share/applications/freetube.desktop"
    rm -r /tmp/freetube
fi
