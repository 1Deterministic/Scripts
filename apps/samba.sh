#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S samba --noconfirm
        sudo systemctl enable smb nmb
        sudo bash -c "cat strings/config-samba > /etc/samba/smb.conf"
        sudo smbpasswd -a "$username"
        sudo firewall-cmd --add-service=samba --permanent
        sudo firewall-cmd --reload
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        sudo apt install samba -y
        sudo systemctl enable smbd
        sudo bash -c "cat strings/config-samba > /etc/samba/smb.conf"
        sudo smbpasswd -a "$username"
        sudo firewall-cmd --add-service=samba --permanent
        sudo firewall-cmd --reload
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
        sudo dnf install samba -y
        sudo systemctl enable smb.service nmb.service
        sudo bash -c "cat strings/config-samba > /etc/samba/smb.conf"
        sudo smbpasswd -a "$username"
        sudo firewall-cmd --add-service=samba --permanent
        sudo firewall-cmd --reload
        sudo setsebool -P samba_domain_controller on
        # run "sudo chcon -t samba_share_t /path/to/folder -R" to allow samba to access a folder mounted under /
        # if running VMs on libvirt, also run "sudo firewall-cmd --zone=libvirt --add-service=samba --permanent && sudo firewall-cmd --reload" to allow them to access shared folders from the virbr0 interface
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
