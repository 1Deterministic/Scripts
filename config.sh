#!/bin/bash

# should match /etc/os-release PRETTY_NAME string
linux="Linux"
archlinux="Arch Linux"
debian="Debian GNU/Linux 10 (buster)"
fedora="Fedora 31 (Thirty One)"
ubuntu="Ubuntu 18.04.4 LTS"

# prints the OS the installed system is based on (recursively)
lineage () {
    if [[ "$1" == "$archlinux" ]]; then echo "$archlinux"; lineage "$linux";
    elif [[ "$1" == "$debian" ]]; then echo "$debian"; lineage "$linux";
    elif [[ "$1" == "$fedora" ]]; then echo "$fedora"; lineage "$linux";
    elif [[ "$1" == "$ubuntu" ]]; then echo "$ubuntu"; lineage "$debian";
    else echo "$linux"; fi
}

# tells if OS 1 is based on OS 2 (can be indirectly)
basedOn () {
    readarray list <<< $(lineage "$1")    
    for (( i=0; i<"${#list[@]}"; i++ )); do
        if [[ "$2"$'\n' == "${list[$i]}" ]]; then
            return 0 # true
        fi
    done
    return 1 # false
}

# basic information about the system
username="$USER"
osname=$(IFS="=" read -ra ADDR <<< $(cat /etc/os-release | grep PRETTY_NAME); echo ${ADDR[-1]} | cut -d'"' -f 2)