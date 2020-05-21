#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    mkdir -p "/home/$username/.config/fontconfig"
    cat "strings/config-fonts" > "/home/$username/.config/fontconfig/fonts.conf"
    cat "strings/config-xresources" > "/home/$username/.Xresources"
    xrdb -merge "/home/$username/.Xresources"
    fc-cache -fv

    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo bash -c "cat strings/config-freetype-version >> /etc/profile.d/freetype2.sh"
        sudo ln -s "/etc/fonts/conf.avail/70-no-bitmaps.conf" "/etc/fonts/conf.d"
        sudo ln -s "/etc/fonts/conf.avail/10-sub-pixel-rgb.conf" "/etc/fonts/conf.d"
        sudo ln -s "/etc/fonts/conf.avail/11-lcdfilter-default.conf" "/etc/fonts/conf.d"
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        sudo dpkg-reconfigure fontconfig-config
        sudo dpkg-reconfigure fontconfig
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
        sudo bash -c "cat strings/config-xresources > /etc/X11/Xresources"
        xrdb -merge "/etc/X11/Xresources"
        fc-cache -fv
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
