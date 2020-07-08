#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S plasma-meta dolphin kfind konsole kate kde-gtk-config networkmanager print-manager cups haveged packagekit-qt5 xdg-user-dirs --noconfirm
        sudo systemctl enable haveged NetworkManager sddm org.cups.cupsd
        sudo systemctl set-default graphical.target
        # if not using an english keyboard, change to your language
        # sudo localectl set-x11-keymap br
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
            sudo apt install kde-plasma-desktop sddm-theme-debian-breeze plasma-nm -y
            sudo systemctl enable sddm wpa_supplicant
            sudo systemctl set-default graphical.target
            sudo bash -c "cat strings/config-networkmanager-managed > /etc/NetworkManager/NetworkManager.conf"
            # as NetworkManager will be used, this will disable the default network handler
            sudo awk -i inplace '$0~/^allow-hotplug|^iface|^[" "]*address|^[" "]*netmask|^[" "]*gateway/{$0="# "$0};1' "/etc/network/interfaces"
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
        # sudo dnf install @kde-desktop-environment -y
        sudo dnf install @"base-x" @"Common NetworkManager Submodules" @"Fonts" @"Hardware Support" adwaita-gtk2-theme bluedevil breeze-icon-theme cagibi colord-kde cups-pk-helper dolphin glibc-all-langpacks gnome-keyring-pam kcm_systemd kde-gtk-config kde-partitionmanager kde-print-manager kde-settings-pulseaudio kde-style-breeze kdegraphics-thumbnailers kdeplasma-addons kdialog kdnssd kf5-baloo-file kf5-kipi-plugins khotkeys kinfocenter kmenuedit konsole5 kscreen kscreenlocker ksshaskpass ksysguard kwalletmanager5 kwebkitpart kwin NetworkManager-config-connectivity-fedora pam-kwallet phonon-qt5-backend-gstreamer pinentry-qt plasma-breeze plasma-desktop plasma-desktop-doc plasma-nm plasma-nm-l2tp plasma-nm-openconnect plasma-nm-openswan plasma-nm-openvpn plasma-nm-pptp plasma-nm-vpnc plasma-pa plasma-user-manager plasma-workspace plasma-workspace-geolocation qt5-qtbase-gui qt5-qtdeclarative sddm sddm-breeze sddm-kcm sni-qt xorg-x11-drv-libinput breeze-gtk @"Printing Support" @"Input Methods" @Multimedia kfind plasma-pk-updates plasma-discover kate -y
        sudo systemctl enable sddm
        sudo systemctl set-default graphical.target
        sudo dracut -f
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
