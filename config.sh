#!/bin/bash

# your username
username=""

# your machine name
hostname=""

# your os name
# can be debian-9, debian-sid, ubuntu-18.04, fedora-29, arch-linux, windows-10
osname=""

# the lines here will be appended to these files
crypttab_lines=""
fstab_lines=""
samba_lines=""

incompatible="echo This is incompatible with the choosen osname"
missing="echo This is not implemented for the choosen osname yet"