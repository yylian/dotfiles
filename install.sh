#!/bin/bash

if [ "$(uname)" != "Darwin" ]
then
    echo "Wrong system. These dotfiles are meant to be running on macOS"
    exit 1
fi

bash scripts/01_install_programms.sh
bash scripts/02_link-files.sh
bash scripts/03_configure_applications.sh
bash scripts/04_set_preferences.sh
bash scripts/05_generate_ssh_key.sh

cp assets/finish.txt ~/Desktop/

FILE="~/Desktop/finish.txt"
if test -f "$FILE"; then
    echo "\n" >> $FILE
    cat ~/.ssh/id_rsa.pub >> $FILE
fi

# z
source /usr/local/etc/profile.d/z.sh
