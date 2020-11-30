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

echo "You may stillt want to configure the following things:"
echo "Configure the sidebar folders in finder"
echo "- set passwort request after sleep to immediately"
echo "- configure amphetamine, bartender"
echo "- add bartender, amphetamine, gestimer and middleclick, alfred to autostart"
echo "A reboot is needed to finish the configuration"
