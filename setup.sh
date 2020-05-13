#! /bin/bash

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/versions

brew install git

git clone git://github.com/yylian/dotfiles.git .files

bash .files/install.sh
