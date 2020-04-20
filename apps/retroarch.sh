#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S libretro --noconfirm
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
            sudo apt install retroarch libretro-* -y
            sudo apt purge gnome-games-app -y
            mkdir "/tmp/retroarch"
            tar xvzf assets/retroarch.tar.gz --directory /tmp/retroarch
            cd "/tmp/retroarch"
                sudo "./configure"
                sudo make
                sudo make install
            cd "$OLDPWD"
            rm -r "/tmp/retroarch"
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            sudo apt install libretro-beetle-pce-fast libretro-beetle-psx libretro-beetle-vb libretro-beetle-wswan libretro-bsnes-mercury-accuracy libretro-bsnes-mercury-balanced libretro-bsnes-mercury-performance libretro-core-info libretro-desmume libretro-gambatte libretro-genesisplusgx libretro-gtk-0.14-0 libretro-mgba libretro-mupen64plus libretro-nestopia libretro-snes9x retroarch -y
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
        sudo adduser "$username" input
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
fi
