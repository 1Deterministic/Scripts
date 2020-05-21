#!/bin/bash
source config.sh

link_protonmail_desktop="https://github.com/protonmail-desktop/application/releases/download/1.0.4/protonmail-desktop-unofficial-1.0.4.tar.gz"
link_protonmail_desktop_icon="https://raw.githubusercontent.com/protonmail-desktop/application/master/src/main/images/Icon.png"

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
    mkdir "/tmp/protonmail"
    wget "$link_protonmail_desktop_icon" -O "/tmp/protonmail/icon.png"
    wget "$link_protonmail_desktop" -O "/tmp/protonmail/protonmail.tar.gz"
    sudo tar xf "/tmp/protonmail/protonmail.tar.gz" --directory "/opt"
    sudo cp "/tmp/protonmail/icon.png" "/opt/protonmail-desktop-unofficial-1.0.4"
    sudo bash -c "cat strings/launcher-protonmail-desktop > /usr/share/applications/protonmail-desktop.desktop"
    rm -r "/tmp/protonmail"
fi