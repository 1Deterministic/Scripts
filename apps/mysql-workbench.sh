#!/bin/bash
source config.sh

link_mysql_workbench_rpm="https://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-8.0.18-1.fc31.x86_64.rpm"
link_mysql_workbench_deb="https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.19-1ubuntu18.04_amd64.deb"

if [[ $osname == $archlinux ]]; then
    sudo pacman -S mysql-workbench --noconfirm
fi

if [[ $osname == $debian ]]; then
    mkdir /tmp/mysql-workbench
    wget $link_mysql_workbench_deb -O /tmp/mysql-workbench/mysql-workbench.deb
    sudo apt install /tmp/mysql-workbench/mysql-workbench.deb -y
    rm -r /tmp/mysql-workbench
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install $link_mysql_workbench_rpm -y
fi

if [[ $osname == $ubuntu ]]; then
    sudo apt install mysql-workbench -y
fi
