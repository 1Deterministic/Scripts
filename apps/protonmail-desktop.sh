#!/bin/bash
source config.sh

link_protonmail_desktop="https://github.com/protonmail-desktop/application/releases/download/1.0.4/protonmail-desktop-unofficial-1.0.4.tar.gz"
link_protonmail_desktop_icon="https://raw.githubusercontent.com/protonmail-desktop/application/master/src/main/images/Icon.png"

if [[ $osname == $archlinux ]]; then
    mkdir /tmp/protonmail
    wget $link_protonmail_desktop_icon -O /tmp/protonmail/icon.png
    wget $link_protonmail_desktop -O /tmp/protonmail/protonmail.tar.gz
    sudo tar xvzf /tmp/protonmail/protonmail.tar.gz --directory /opt
    sudo cp /tmp/protonmail/icon.png /opt/protonmail-desktop-unofficial-1.0.4
    sudo bash -c "cat strings/launcher-protonmail-desktop > /usr/share/applications/protonmail-desktop.desktop"
    rm -r /tmp/protonmail
fi

if [[ $osname == $debian ]]; then
    mkdir /tmp/protonmail
    wget $link_protonmail_desktop_icon -O /tmp/protonmail/icon.png
    wget $link_protonmail_desktop -O /tmp/protonmail/protonmail.tar.gz
    sudo tar xvzf /tmp/protonmail/protonmail.tar.gz --directory /opt
    sudo cp /tmp/protonmail/icon.png /opt/protonmail-desktop-unofficial-1.0.4
    sudo bash -c "cat strings/launcher-protonmail-desktop > /usr/share/applications/protonmail-desktop.desktop"
    rm -r /tmp/protonmail
fi

if [[ $osname == $fedora ]]; then
    mkdir /tmp/protonmail
    wget $link_protonmail_desktop_icon -O /tmp/protonmail/icon.png
    wget $link_protonmail_desktop -O /tmp/protonmail/protonmail.tar.gz
    sudo tar xvzf /tmp/protonmail/protonmail.tar.gz --directory /opt
    sudo cp /tmp/protonmail/icon.png /opt/protonmail-desktop-unofficial-1.0.4
    sudo bash -c "cat strings/launcher-protonmail-desktop > /usr/share/applications/protonmail-desktop.desktop"
    rm -r /tmp/protonmail
fi

if [[ $osname == $ubuntu ]]; then
    mkdir /tmp/protonmail
    wget $link_protonmail_desktop_icon -O /tmp/protonmail/icon.png
    wget $link_protonmail_desktop -O /tmp/protonmail/protonmail.tar.gz
    sudo tar xvzf /tmp/protonmail/protonmail.tar.gz --directory /opt
    sudo cp /tmp/protonmail/icon.png /opt/protonmail-desktop-unofficial-1.0.4
    sudo bash -c "cat strings/launcher-protonmail-desktop > /usr/share/applications/protonmail-desktop.desktop"
    rm -r /tmp/protonmail
fi
