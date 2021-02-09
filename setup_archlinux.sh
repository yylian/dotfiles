#! /bin/bash

if [ ! -f "/etc/arch-release" ]
then
    echo "Aborting. These dotfiles are meant to be running on archlinux"
    exit 1
fi

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
DOTFILES_PATH="${CURRENT_PATH}/${REPO_NAME}"
DOTFILES_PATH="${DOTFILES_PATH}/dotfiles"

# Install applications
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

PACKAGES=(
    z
    zsh
    tmux
    alacritty
    rofi
    steam
    firefox
    webstorm
    jdk8-openjdk
    pavucontrol
    pulseaudio
    telegram-desktop
    1password
    openssh
    htop
    man
    thunar
    discord
    ttf-apple-emoji
    escrotum-git
    python-numpy
)

yay
yay -S $PACKAGES

# Setup
mkdir ~/dev
mkdir ~/.ssh
mkdir ~/.config

git clone git://github.com/yylian/dotfiles.git $REPO_NAME
git config --global core.excludesfile '~/.gitignore'
git config --global pull.rebase true

ln -sf "${DOTFILES_PATH}/git/.gitignore" $HOME
ln -sf "${DOTFILES_PATH}/zsh/.zshrc" $HOME
ln -sf "${DOTFILES_PATH}/alacritty/.alacritty.yml" $HOME

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap
