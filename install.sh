#!/bin/bash

if [ "$(uname)" != "Darwin" ]
then
    echo "Wrong system. These dotfiles are meant to be running on macOS"
    exit 1
fi

bash scripts/01_install_programms.sh
bash scripts/02_move-files.sh
bash scripts/03_configure_applications.sh
bash scripts/04_set_preferences.sh
bash scripts/05_generate_ssh_key.sh

cp assets/finish.txt ~/Desktop/

# z
source /usr/local/etc/profile.d/z.sh
