#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -R konqueror --noconfirm
        sudo pacman -R write --noconfirm
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
        sudo dnf remove dnfdragora -y
        sudo dnf remove system-config-language -y
        sudo dnf remove firewall-config -y
        sudo dnf remove qt5-qdbusviewer -y
        sudo dnf remove calligra* -y
        sudo dnf remove kmail -y
        sudo dnf remove kaddressbook -y
        sudo dnf remove korganizer -y
        sudo dnf remove kolourpaint -y
        sudo dnf remove kcolorchooser -y
        sudo dnf remove kruler -y
        sudo dnf remove akregator -y
        sudo dnf remove falkon -y
        sudo dnf remove kget -y
        sudo dnf remove konqueror -y
        sudo dnf remove konversation -y
        sudo dnf remove krdc -y
        sudo dnf remove krfb -y
        sudo dnf remove ktorrent -y
        sudo dnf remove dragonplayer -y
        sudo dnf remove juk -y
        sudo dnf remove k3b -y
        sudo dnf remove kamoso -y
        sudo dnf remove kpat -y
        sudo dnf remove kmahjongg -y
        sudo dnf remove kmines -y
        sudo dnf remove mediawriter -y
        sudo dnf remove fedora-release-notes -y
        sudo dnf remove gnome-abrt -y
        sudo dnf remove kcharselect -y
        sudo dnf remove kgpg -y
        sudo dnf remove kmag -y
        sudo dnf remove kmousetool -y
        sudo dnf remove kmouth -y
        sudo dnf remove krusader -y
        sudo dnf remove gnome-disk-utility -y
        sudo dnf remove setroubleshoot -y
        sudo dnf remove ibus-cangjie -y
        sudo dnf remove im-chooser -y
        sudo dnf remove system-config-users -y
        sudo dnf remove qt5-qdbusviewer -y
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi