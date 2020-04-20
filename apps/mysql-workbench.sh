#!/bin/bash
source config.sh

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        sudo pacman -S mysql-workbench --noconfirm
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        mkdir "/tmp/mysql-workbench"
        # debian-specific
        if [[ "$osname" == "$debian" ]]; then
            link_mysql_workbench_deb="https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.19-1ubuntu18.04_amd64.deb"
            wget "$link_mysql_workbench_deb" -O "/tmp/mysql-workbench/mysql-workbench.deb"
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            link_mysql_workbench_deb="https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.19-1ubuntu19.10_amd64.deb"
            wget "$link_mysql_workbench_deb" -O "/tmp/mysql-workbench/mysql-workbench.deb"
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
        sudo apt install "/tmp/mysql-workbench/mysql-workbench.deb" -y
        rm -r "/tmp/mysql-workbench"
    # common to fedora-based distros
    elif basedOn "$osname" "$fedora"; then
        # code that has to be executed before downstream-specific distros
        link_mysql_workbench_rpm="https://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-8.0.18-1.fc31.x86_64.rpm"
        sudo dnf install $link_mysql_workbench_rpm -y
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
fi
