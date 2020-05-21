#!/bin/bash
source config.sh

link_proton_ge="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/5.2-GE-2/Proton-5.2-GE-2.tar.gz"

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        # debian-specific
        if [[ "$osname" == "$debian" ]]; then
            :
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
    # common to fedora-based distros
    elif basedOn "$osname" "$fedora"; then
        # code that has to be executed before downstream-specific distros
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
    if [[ -L "/home/$username/.steam" ]]; then
        mkdir "/tmp/proton-ge"
        wget "$link_proton_ge" -O "/tmp/proton-ge/proton-ge.tar.gz"
        mkdir "/home/$username/.steam/root/compatibilitytools.d"
        tar xf "/tmp/proton-ge/proton-ge.tar.gz" --directory "/home/$username/.steam/root/compatibilitytools.d"
        rm -r "/tmp/proton-ge"
    else
        echo "You must install Steam and run it at least once before installing Proton GE"
    fi
fi