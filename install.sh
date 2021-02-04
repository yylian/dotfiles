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

USERNAME='yylian'
GITMAIL='git@jarminowski.de'

bash "${SCRIPTS_PATH}/install_programms.sh"
bash "${SCRIPTS_PATH}/link_files.sh"
bash "${SCRIPTS_PATH}/set_preferences.sh"

# Configure installed applications
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap
code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment

git config --global core.excludesfile '~/.gitignore'
git config --global user.name $USERNAME
git config --global user.email $email
git config --global pull.rebase true

# Finish
echo "You may stillt want to configure the following things:"
echo "Configure the sidebar folders in finder"
echo "- set passwort request after sleep to immediately"
echo "- configure amphetamine, bartender"
echo "- add bartender, amphetamine, gestimer and middleclick, alfred to autostart"
echo "A reboot is needed to finish the configuration"
