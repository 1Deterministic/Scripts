#!/bin/bash
source config.sh

link_proton_ge="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/5.2-GE-2/Proton-5.2-GE-2.tar.gz"

if [[ $osname == $archlinux ]]; then
    mkdir /tmp/proton-ge
    wget $link_proton_ge -O /tmp/proton-ge/proton-ge.tar.gz
    mkdir /home/$username/.steam/root/compatibilitytools.d
    tar -xvf /tmp/proton-ge/proton-ge.tar.gz --directory /home/$username/.steam/root/compatibilitytools.d
    rm -r /tmp/proton-ge
fi

if [[ $osname == $debian ]]; then
    mkdir /tmp/proton-ge
    wget $link_proton_ge -O /tmp/proton-ge/proton-ge.tar.gz
    mkdir /home/$username/.steam/root/compatibilitytools.d
    tar -xvf /tmp/proton-ge/proton-ge.tar.gz --directory /home/$username/.steam/root/compatibilitytools.d
    rm -r /tmp/proton-ge
fi

if [[ $osname == $fedora ]]; then
    mkdir /tmp/proton-ge
    wget $link_proton_ge -O /tmp/proton-ge/proton-ge.tar.gz
    mkdir /home/$username/.steam/root/compatibilitytools.d
    tar -xvf /tmp/proton-ge/proton-ge.tar.gz --directory /home/$username/.steam/root/compatibilitytools.d
    rm -r /tmp/proton-ge
fi

if [[ $osname == $ubuntu ]]; then
    mkdir /tmp/proton-ge
    wget $link_proton_ge -O /tmp/proton-ge/proton-ge.tar.gz
    mkdir /home/$username/.steam/root/compatibilitytools.d
    tar -xvf /tmp/proton-ge/proton-ge.tar.gz --directory /home/$username/.steam/root/compatibilitytools.d
    rm -r /tmp/proton-ge
fi
