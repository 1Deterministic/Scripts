#!/bin/bash
source config.sh

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
    link_vscodium="https://github.com/VSCodium/vscodium/releases/download/1.39.0/VSCodium-linux-x64-1.39.0.tar.gz"
    mkdir "/tmp/vscodium"
    wget "$link_vscodium" -O "/tmp/vscodium/vscodium.tar.gz"
    sudo mkdir "/opt/vscodium"
    sudo tar xvzf "/tmp/vscodium/vscodium.tar.gz" --directory "/opt/vscodium"
    sudo chmod +x "/opt/vscodium/codium"
    rm -r "/tmp/vscodium"
    sudo bash -c "cat strings/launcher-vscodium > /usr/share/applications/vscodium.desktop"
fi