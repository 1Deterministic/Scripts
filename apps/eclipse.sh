#!/bin/bash
source config.sh

link_eclipse="http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/photon/R/eclipse-java-photon-R-linux-gtk-x86_64.tar.gz"

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
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
            sudo apt install openjdk-11-jdk -y
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            sudo apt install openjdk-8-jdk -y
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
        sudo update-java-alternatives --jre-headless --jre --set java-1.8.0-openjdk-amd64
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
    mkdir "/tmp/eclipse"
    wget "$link_eclipse" -O "/tmp/eclipse/eclipse.tar.gz"
    sudo tar xf "/tmp/eclipse/eclipse.tar.gz" --directory "/usr"
    rm -r "/tmp/eclipse"
    sudo ln -s "/usr/eclipse/eclipse" "/usr/bin/eclipse"
    sudo bash -c "cat strings/launcher-eclipse > /usr/share/applications/eclipse.desktop"
fi