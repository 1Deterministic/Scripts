#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -R gnome-boxes --noconfirm
        sudo pacman -R gnome-calendar --noconfirm
        sudo pacman -R gnome-books --noconfirm
        sudo pacman -R gnome-contacts --noconfirm
        sudo pacman -R gnome-documents --noconfirm
        sudo pacman -R gnome-maps --noconfirm
        sudo pacman -R gnome-music --noconfirm
        sudo pacman -R gnome-photos --noconfirm
        sudo pacman -R simple-scan --noconfirm
        sudo pacman -R gnome-todo --noconfirm
        sudo pacman -R gnome-weather --noconfirm
        sudo pacman -R totem epiphany --noconfirm
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
            sudo apt purge mutt -y
            sudo apt purge tracker -y
            sudo apt purge gnome-logs -y
            sudo apt purge gnome-disk-utility -y
            sudo apt purge gnome-contacts -y
            sudo apt purge yelp -y
            sudo apt purge totem -y
            sudo apt purge evince -y
            sudo apt purge gedit -y
            sudo apt purge gnome-calculator -y
            sudo apt purge gnome-characters -y
            sudo apt purge gnome-font-viewer -y
            sudo apt purge gnome-system-monitor -y
            sudo apt purge eog -y
            sudo apt purge baobab -y
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
            	# assuming a "minimal" install
                sudo apt purge snapd -y
                sudo apt purge gnome-startup-applications -y
                sudo apt purge update-manager -y
                sudo apt purge gnome-characters -y
                sudo apt purge gnome-disk-utility -y
                sudo apt purge software-properties-gtk -y
                sudo apt purge gnome-power-manager -y
                sudo apt purge gnome-font-viewer -y
                sudo apt purge gnome-logs -y
                sudo apt purge seahorse -y
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
        sudo dnf remove gnome-boxes -y
        sudo dnf remove gnome-calendar -y
        sudo dnf remove cheese -y
        sudo dnf remove gnome-contacts -y
        sudo dnf remove simple-scan -y
        sudo dnf remove gnome-abrt -y
        sudo dnf remove gnome-documents -y
        sudo dnf remove evolution -y
        sudo dnf remove gnome-photos -y
        sudo dnf remove gnome-maps -y
        sudo dnf remove gnome-weather -y
        sudo dnf remove gnome-clocks -y
        sudo dnf remove rhythmbox -y
        sudo dnf remove totem -y
        sudo dnf remove libreoffice* -y
        sudo dnf remove evince -y
        sudo dnf remove yelp -y
        sudo dnf remove flatpak -y
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
