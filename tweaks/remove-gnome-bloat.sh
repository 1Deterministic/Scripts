#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -R gnome-boxes gnome-calendar gnome-books gnome-contacts gnome-documents gnome-maps gnome-music gnome-photos simple-scan gnome-todo gnome-weather totem epiphany --noconfirm
        # can't remove these without breaking too much stuff, removing shortcuts to prevent accidental click and to improve aesthetics
        sudo rm "/usr/share/applications/avahi-discover.desktop"
        sudo rm "/usr/share/applications/bssh.desktop"
        sudo rm "/usr/share/applications/bvnc.desktop"
        sudo rm "/usr/share/applications/qv4l2.desktop"
        sudo rm "/usr/share/applications/qvidcap.desktop"
        sudo rm "/usr/share/applications/nm-connection-editor.desktop"
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
            sudo apt purge mutt tracker gnome-logs gnome-disk-utility gnome-contacts yelp totem evince gedit gnome-calculator gnome-characters gnome-font-viewer gnome-system-monitor eog baobab -y
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
            	# assuming a "minimal" install
                sudo apt purge snapd gnome-startup-applications update-manager gnome-characters gnome-disk-utility software-properties-gtk gnome-power-manager gnome-font-viewer gnome-logs seahorse -y
                # can't remove these without breaking too much stuff, removing shortcuts to prevent accidental click and to improve aesthetics
                sudo rm /usr/share/applications/yelp.desktop
                sudo rm /usr/share/applications/gnome-language-selector.desktop
                
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
        sudo apt autoremove -y
    # common to fedora-based distros
    elif basedOn "$osname" "$fedora"; then
        # code that has to be executed before downstream-specific distros
        sudo dnf remove gnome-boxes gnome-calendar cheese gnome-contacts simple-scan gnome-abrt gnome-documents evolution gnome-photos gnome-maps gnome-weather gnome-clocks rhythmbox totem libreoffice* evince yelp flatpak -y
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
