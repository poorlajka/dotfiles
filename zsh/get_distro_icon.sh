
get_distro_icon () {
    local value=$(</etc/os-release)

    if [[ $value =~ "gentoo" ]]; then
        echo -n "󰣨"
    elif [[ $value =~ "arch" ]]; then
        echo -n "󰣇"
    elif [[ $value =~ "artix" ]]; then
        echo -n ""
    elif [[ $value =~ "arco" ]]; then
        echo -n ""
    elif [[ $value =~ "ubuntu" ]]; then
        echo -n ""
    elif [[ $value =~ "fedora" ]]; then
        echo -n ""
    elif [[ $value =~ "mint" ]]; then
        echo -n "󰣭"
    elif [[ $value =~ "debian" ]]; then
        echo -n ""
    elif [[ $value =~ "nix" ]]; then
        echo -n "󰣭"
    elif [[ $value =~ "suse" ]]; then
        echo -n "󱄅"
    elif [[ $value =~ "void" ]]; then
        echo -n ""
    elif [[ $value =~ "kali" ]]; then
        echo -n ""
    elif [[ $value =~ "manjaro" ]]; then
        echo -n ""
    elif [[ $value =~ "pop" ]]; then
        echo -n ""
    elif [[ $value =~ "slack" ]]; then
        echo -n ""
    elif [[ $value =~ "alpine" ]]; then
        echo -n ""
    elif [[ $value =~ "mx" ]]; then
        echo -n ""
    else
        echo -n ""
    fi
}


