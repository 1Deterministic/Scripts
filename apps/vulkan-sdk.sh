#!/bin/bash
source config.sh

link_vulkan_sdk="https://sdk.lunarg.com/sdk/download/1.2.131.2/linux/vulkansdk-linux-x86_64-1.2.131.2.tar.gz?u="

if [[ $osname == $archlinux ]]; then
    mkdir /tmp/vulkan-sdk
    wget $link_vulkan_sdk -O /tmp/vulkan-sdk/vulkan-sdk.tar.gz
    tar xvzf /tmp/vulkan-sdk/vulkan-sdk.tar.gz --directory /tmp/vulkan-sdk
    sudo cp -r /tmp/vulkan-sdk/1.2.131.2/x86_64/include/vulkan /usr/local/include
    sudo cp -P /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libvulkan.so* /usr/local/lib
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libVkLayer_*.so /usr/local/lib
    sudo mkdir -p /usr/local/share/vulkan/explicit_layer.d
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/etc/vulkan/explicit_layer.d/VkLayer_*.json /usr/local/share/vulkan/explicit_layer.d
    rm -r /tmp/vulkan-sdk
    sudo ldconfig
fi

if [[ $osname == $debian ]]; then
    mkdir /tmp/vulkan-sdk
    wget $link_vulkan_sdk -O /tmp/vulkan-sdk/vulkan-sdk.tar.gz
    tar xvzf /tmp/vulkan-sdk/vulkan-sdk.tar.gz --directory /tmp/vulkan-sdk
    sudo cp -r /tmp/vulkan-sdk/1.2.131.2/x86_64/include/vulkan /usr/local/include
    sudo cp -P /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libvulkan.so* /usr/local/lib
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libVkLayer_*.so /usr/local/lib
    sudo mkdir -p /usr/local/share/vulkan/explicit_layer.d
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/etc/vulkan/explicit_layer.d/VkLayer_*.json /usr/local/share/vulkan/explicit_layer.d
    rm -r /tmp/vulkan-sdk
    sudo ldconfig
fi

if [[ $osname == $fedora ]]; then
    mkdir /tmp/vulkan-sdk
    wget $link_vulkan_sdk -O /tmp/vulkan-sdk/vulkan-sdk.tar.gz
    tar xvzf /tmp/vulkan-sdk/vulkan-sdk.tar.gz --directory /tmp/vulkan-sdk
    sudo cp -r /tmp/vulkan-sdk/1.2.131.2/x86_64/include/vulkan /usr/local/include
    sudo cp -P /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libvulkan.so* /usr/local/lib
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libVkLayer_*.so /usr/local/lib
    sudo mkdir -p /usr/local/share/vulkan/explicit_layer.d
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/etc/vulkan/explicit_layer.d/VkLayer_*.json /usr/local/share/vulkan/explicit_layer.d
    rm -r /tmp/vulkan-sdk
    sudo ldconfig
fi

if [[ $osname == $ubuntu ]]; then
    mkdir /tmp/vulkan-sdk
    wget $link_vulkan_sdk -O /tmp/vulkan-sdk/vulkan-sdk.tar.gz
    tar xvzf /tmp/vulkan-sdk/vulkan-sdk.tar.gz --directory /tmp/vulkan-sdk
    sudo cp -r /tmp/vulkan-sdk/1.2.131.2/x86_64/include/vulkan /usr/local/include
    sudo cp -P /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libvulkan.so* /usr/local/lib
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/lib/libVkLayer_*.so /usr/local/lib
    sudo mkdir -p /usr/local/share/vulkan/explicit_layer.d
    sudo cp /tmp/vulkan-sdk/1.2.131.2/x86_64/etc/vulkan/explicit_layer.d/VkLayer_*.json /usr/local/share/vulkan/explicit_layer.d
    rm -r /tmp/vulkan-sdk
    sudo ldconfig
fi
