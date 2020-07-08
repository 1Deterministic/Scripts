#!/bin/bash
source config.sh

link_freetube="https://github.com/FreeTubeApp/FreeTube/releases/download/v0.7.2-beta/FreeTube-0.7.2-linux.tar.xz"

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
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
    mkdir "/tmp/freetube"
    wget "$link_freetube" -O "/tmp/freetube/freetube.tar.xz"
    sudo mkdir "/opt/freetube"
    sudo tar --strip-components=1 xf "/tmp/freetube/freetube.tar.xz" --directory "/opt/freetube"
    sudo bash -c "cat strings/launcher-freetube > /usr/share/applications/freetube.desktop"
    rm -r "/tmp/freetube"
    sudo chown root:root -R "/opt/freetube/chrome-sandbox"
    sudo chmod 4755 "/opt/freetube/chrome-sandbox"
fi
