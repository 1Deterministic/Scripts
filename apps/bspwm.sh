#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S xorg-server bspwm sxhkd xdg-user-dirs pulseaudio networkmanager --noconfirm
        sudo systemctl enable NetworkManager
        # to use lightdm uncomment these lines
        # sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm
        # sudo systemctl enable lightdm
        mkdir "/home/$username/.config"
        mkdir "/home/$username/.config/bspwm"
        cp "/usr/share/doc/bspwm/examples/bspwmrc" "/home/$username/.config/bspwm"
        mkdir "/home/$username/.config/sxhkd"
        cp "/usr/share/doc/bspwm/examples/sxhkdrc" "/home/$username/.config/sxhkd"
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
        sudo dnf install @"base-x" @"Common NetworkManager Submodules" @"Fonts" @"Hardware Support" xorg-x11-drv-libinput @"Printing Support" @"Input Methods" @Multimedia bspwm sxhkd xdg-user-dirs pulseaudio NetworkManager -y
        sudo systemctl enable NetworkManager
        # to use lightdm uncomment these lines
        # sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm
        # sudo systemctl enable lightdm
        # sudo systemctl set-default graphical.target
        # sudo dracut -f
        mkdir "/home/$username/.config"
        mkdir "/home/$username/.config/bspwm"
        cp "/usr/share/doc/bspwm/examples/bspwmrc" "/home/$username/.config/bspwm"
        mkdir "/home/$username/.config/sxhkd"
        cp "/usr/share/doc/bspwm/examples/sxhkdrc" "/home/$username/.config/sxhkd"
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
