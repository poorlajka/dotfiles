#!/bin/bash

declare -A distro_icons
distro_icons=( 
    ["gentoo"]="󰣨"
    ["arch"]="󰣇"
    ["artix"]=""
    ["arco"]=""
    ["ubuntu"]=""
    ["fedora"]=""
    ["mint"]="󰣭"
    ["debian"]=""
    ["nix"]="󰣭"
    ["suse"]="󱄅"
    ["void"]=""
    ["kali"]=""
    ["manjaro"]=""
    ["pop"]=""
    ["slack"]=""
    ["alpine"]=""
    ["mx"]=""
)

release=$(</etc/os-release)
for name in ${!distro_icons[@]}; do 
    if [[ $release =~ $name ]]; then
        echo -n ${distro_icons[$name]}
        exit 0
    fi
done
echo -n ""

