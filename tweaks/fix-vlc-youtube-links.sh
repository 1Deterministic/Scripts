#!/bin/bash
source config.sh

if [[ $osname == $archlinux ]]; then
    mkdir /home/$username/.local
    mkdir /home/$username/.local/share
    mkdir /home/$username/.local/share/vlc
    mkdir /home/$username/.local/share/vlc/lua
    mkdir /home/$username/.local/share/vlc/lua/playlist
    cp strings/config-vlc-yt /home/$username/.local/share/vlc/lua/playlist/youtube.lua
fi

if [[ $osname == $debian ]]; then
    mkdir /home/$username/.local
    mkdir /home/$username/.local/share
    mkdir /home/$username/.local/share/vlc
    mkdir /home/$username/.local/share/vlc/lua
    mkdir /home/$username/.local/share/vlc/lua/playlist
    cp strings/config-vlc-yt /home/$username/.local/share/vlc/lua/playlist/youtube.lua
fi

if [[ $osname == $fedora ]]; then
    mkdir /home/$username/.local
    mkdir /home/$username/.local/share
    mkdir /home/$username/.local/share/vlc
    mkdir /home/$username/.local/share/vlc/lua
    mkdir /home/$username/.local/share/vlc/lua/playlist
    cp strings/config-vlc-yt /home/$username/.local/share/vlc/lua/playlist/youtube.lua
fi

if [[ $osname == $ubuntu ]]; then
    mkdir /home/$username/.local
    mkdir /home/$username/.local/share
    mkdir /home/$username/.local/share/vlc
    mkdir /home/$username/.local/share/vlc/lua
    mkdir /home/$username/.local/share/vlc/lua/playlist
    cp strings/config-vlc-yt /home/$username/.local/share/vlc/lua/playlist/youtube.lua
fi
