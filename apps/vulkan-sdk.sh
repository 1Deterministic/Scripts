#!/bin/bash
source config.sh

link_vulkan_sdk="https://sdk.lunarg.com/sdk/download/1.2.131.2/linux/vulkansdk-linux-x86_64-1.2.131.2.tar.gz?u="

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
    mkdir "/tmp/vulkan-sdk"
    wget "$link_vulkan_sdk" -O "/tmp/vulkan-sdk/vulkan-sdk.tar.gz"
    tar xf "/tmp/vulkan-sdk/vulkan-sdk.tar.gz" --directory "/tmp/vulkan-sdk"
    sudo cp -r "/tmp/vulkan-sdk/1.2.131.2/x86_64/include/vulkan" "/usr/local/include"
    sudo cp -P "/tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libvulkan.so"* "/usr/local/lib"
    sudo cp "/tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libVkLayer_"*".so" "/usr/local/lib"
    sudo mkdir -p "/usr/local/share/vulkan/explicit_layer.d"
    sudo cp "/tmp/vulkan-sdk/1.2.131.2/x86_64/etc/vulkan/explicit_layer.d/VkLayer_"*".json" "/usr/local/share/vulkan/explicit_layer.d"
    rm -r "/tmp/vulkan-sdk"
    sudo ldconfig
fi