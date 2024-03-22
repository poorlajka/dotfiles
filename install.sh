#!/bin/bash
# Small script to install dotfiles either
# directly as files or as symlinks.

save () {
    printf "A backup of your current config will be saved in ./oldconfig\n\n"
}

create_symlink () {
    printf "${1}, ${2}, symlink\n"
}

create_file () {
    printf "${1}, ${2}, file\n"
}

install () {
    printf "\nBeginning install\n"
    save

    shopt -s dotglob
    nr_of_files=0
    for file in *; do 

        if [[ -d $file ]] && [[ $file != ".git" ]] && [[ $file != "oldconfig" ]]; then
            ((nr_of_files++))
            printf "Installing ${file} in ${config_folder}\n"
            #$1 $file $config_folder
            printf "Success\n\n"

        elif [[ $file =~ "rc" ]]; then
            ((nr_of_files++))
            printf "Installing ${file} in ${HOME}\n"
            #$1 $file $HOME
            printf "Success\n\n"
        fi
    done
    shopt -u dotglob
    printf "Finished installing $nr_of_files out of $nr_of_files\n"
}

config_folder="${HOME}/.config"

printf "Please select preferred installation method\n"
printf "Install dotfiles either [directly] as files or as [symlinks]: "
read input

if [[ $input == "symlinks" ]]; then
    printf "You have selected installing symlinks, confirm by entering [yes]: "
    read confirm
    if [[ $confirm == "yes" ]]; then
        install create_symlink
    fi

elif [[ $input == "directly" ]]; then
    printf "You have selected installing directly, confirm by entering [yes]: "
    if [[ $confirm == "yes" ]]; then
        install create_file
    fi

else 
    printf "Invalid option!\n"
fi



