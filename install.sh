#!/bin/bash
# Small script to install dotfiles either
# directly as files or as symlinks.

config_folder="${HOME}/.config"

main () {
    printf "Please select preferred installation method\n"
    printf "Install dotfiles either [directly] as files or as [symlinks]: "

    local input
    read input
    if [[ $input == "symlinks" ]]; then
        confirm $input
        install create_file

    elif [[ $input == "directly" ]]; then
        confirm $input
        install create_symlink

    else 
        printf "Invalid option entered, exiting...\n"
    fi
}

confirm () {
    printf "You have selected installing ${1}, confirm by entering [yes]: "
    local confirm
    read confirm
    if [[ $confirm == "yes" ]]; then
        return 0
    else 
        printf "yes was not entered, exiting...\n"
        exit 0
    fi
}

install () {
    printf "\nBeginning install\n\n"
    backup_config

    local nr_of_files=0
    local nr_of_installed=0

    for file in *; do 

        if [[ -d $file ]] && [[ $file != "oldconfig" ]]; then
            let nr_of_files++
            if $1 $file $config_folder; then
                let nr_of_installed++
            fi    
            printf "\n"
        fi
    done
    printf "Finished installing $nr_of_installed out of $nr_of_files\n"
}

backup_config () {
    printf "A backup of your current ~/.config will be saved in ./oldconfig\n"

    if cp -r $config_folder ./oldconfig; then
        printf "Backup successfully created\n\n" 
    else 
        printf "Backup failed, exiting...\n" 
        exit 1
    fi
}

create_symlink () {
    printf "Creating symlink for ${1} in ${2}\n"
    if [[ -f "${2}/${1}" ]]; then
        printf "Found already existing ${1} config\n"
        printf "Overwrite it? [yes]/[no]: "
        local overwrite
        read overwrite
        if [[ $overwrite == "yes" ]]; then
            ln -sf $1 $2
            printf "Symlink successfully created\n"
        fi
    else 
        ln -s $1 $2
        printf "Symlink successfully created\n"
    fi
    return 0
}

create_file () {
    printf "Creating config for ${1} in ${2}\n"
    if [[ -f "${2}/${1}" ]]; then
        printf "Found already existing ${1} config\n"
        printf "Overwrite it? [yes]/[no]: "
        local overwrite
        read overwrite
        if [[ $overwrite == "yes" ]]; then
            cp -rf $1 $2
            printf "File successfully created\n"
        fi
    else 
        cp -r $1 $2
        printf "File successfully created\n"
    fi
    return 0
}

main "$@"
