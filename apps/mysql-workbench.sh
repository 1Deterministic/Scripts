#!/bin/bash
source config.sh

link_mysql_workbench_rpm="https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-8.0.16-1.fc30.x86_64.rpm"

if [[ $osname == $archlinux ]]; then
    sudo pacman -S mysql-workbench --noconfirm
fi

if [[ $osname == $debianstable ]]; then
    sudo apt install mysql-workbench -y
fi

if [[ $osname == $debiansid ]]; then
    sudo apt install mysql-workbench -y
fi

if [[ $osname == $fedora ]]; then
    sudo dnf install $link_mysql_workbench_rpm -y
fi

if [[ $osname == $ubuntults ]]; then
    sudo apt install mysql-workbench -y
fi