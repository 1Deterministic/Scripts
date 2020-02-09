#!/bin/bash
source config.sh

link_vscodium="https://github.com/VSCodium/vscodium/releases/download/1.39.0/VSCodium-linux-x64-1.39.0.tar.gz"

if [[ $osname == $archlinux ]]; then
    mkdir /tmp/vscodium
    wget $link_vscodium -O /tmp/vscodium/vscodium.tar.gz
    sudo mkdir /opt/vscodium
    sudo tar xvzf /tmp/vscodium/vscodium.tar.gz --directory /opt/vscodium
    sudo chmod +x /opt/vscodium/codium
    rm -r /tmp/vscodium
    sudo bash -c "cat strings/launcher-vscodium > /usr/share/applications/vscodium.desktop"
fi

if [[ $osname == $debian ]]; then
    mkdir /tmp/vscodium
    wget $link_vscodium -O /tmp/vscodium/vscodium.tar.gz
    sudo mkdir /opt/vscodium
    sudo tar xvzf /tmp/vscodium/vscodium.tar.gz --directory /opt/vscodium
    sudo chmod +x /opt/vscodium/codium
    rm -r /tmp/vscodium
    sudo bash -c "cat strings/launcher-vscodium > /usr/share/applications/vscodium.desktop"
fi

if [[ $osname == $fedora ]]; then
    mkdir /tmp/vscodium
    wget $link_vscodium -O /tmp/vscodium/vscodium.tar.gz
    sudo mkdir /opt/vscodium
    sudo tar xvzf /tmp/vscodium/vscodium.tar.gz --directory /opt/vscodium
    sudo chmod +x /opt/vscodium/codium
    rm -r /tmp/vscodium
    sudo bash -c "cat strings/launcher-vscodium > /usr/share/applications/vscodium.desktop"
fi

if [[ $osname == $ubuntu ]]; then
    mkdir /tmp/vscodium
    wget $link_vscodium -O /tmp/vscodium/vscodium.tar.gz
    sudo mkdir /opt/vscodium
    sudo tar xvzf /tmp/vscodium/vscodium.tar.gz --directory /opt/vscodium
    sudo chmod +x /opt/vscodium/codium
    rm -r /tmp/vscodium
    sudo bash -c "cat strings/launcher-vscodium > /usr/share/applications/vscodium.desktop"
fi
