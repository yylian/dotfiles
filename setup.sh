#! /bin/bash

export REPO_NAME=".files"

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/cask-versions

brew install git

git clone git://github.com/yylian/dotfiles.git $REPO_NAME

bash "${REPO_NAME}/install.sh"
