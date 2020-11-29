#!/bin/bash

if [ "$(uname)" != "Darwin" ]
then
    echo "Wrong system. These dotfiles are meant to be running on macOS"
    exit 1
fi

REPO_NAME="${REPO_NAME:.files}"
CURRENT_PATH=$(pwd)
export DOTFILES_PATH="${CURRENT_PATH}/${REPO_NAME}"
SCRIPTS_PATH="${DOTFILES_PATH}/scripts"


bash "${SCRIPTS_PATH}/install_programms.sh"
bash "${SCRIPTS_PATH}/link_files.sh"
bash "${SCRIPTS_PATH}/configure_applications.sh"
bash "${SCRIPTS_PATH}/set_preferences.sh"

open "${DOTFILES_PATH}/finish.txt"


# z
source /usr/local/etc/profile.d/z.sh
