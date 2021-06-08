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
if [ ! -f "$(which yay)" ]
then
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

PACKAGES=(
    alacritty
    bitwarden
    coreutils
    discord
    escrotum-git python-numpy
    firefox
    htop
    man
    neovim
    nerd-fonts-complete
    openssh
    pavucontrol-git
    rofi
    telegram-desktop
    thunar
    tmux
    ttf-apple-emoji
    vim-plug
    visual-studio-code-bin
    z
    zsh
)

yay
yay -S $PACKAGES

# Setup
mkdir "~/dev"
mkdir "~/.ssh"

git clone git://github.com/yylian/dotfiles.git $REPO_NAME
git config --global core.excludesfile '~/.gitignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap

ln -sf "${DOTFILES_PATH}/git/.gitignore" $HOME
ln -sf "${DOTFILES_PATH}/zsh/.zshrc" $HOME
ln -sf "${DOTFILES_PATH}/alacritty/.alacritty.yml" $HOME

CONFIG_PATH="$HOME/.config"
mkdir $CONFIG_PATH

mkdir "${CONFIG_PATH}/nvim"
ln -sf "${DOTFILES_PATH}/nvim/init.vim" "${CONFIG_PATH}/nvim"

mkdir "${CONFIG_PATH}/i3"
ln -sf "${DOTFILES_PATH}/i3/config" "${CONFIG_PATH}/i3"
mkdir "${CONFIG_PATH}/rofi"
ln -sf "${DOTFILES_PATH}/rofi/config.rasi" "${CONFIG_PATH}/rofi"

# WM installation and configuration
yay -S lightdm-mini-greeter xorg-server xorg-xinit i3-gaps xorg-xsetroot

sudo ln -sf "${DOTFILES_PATH}/X11/xinitrc" "/etc/X11/xinit/xinitrc"
sudo ln -sf "${DOTFILES_PATH}/lightdm/lightdm.conf" "/etc/lightdm/lightdm.conf"
sudo ln -sf "${DOTFILES_PATH}/lightdm/lightdm-mini-greeter.conf" "/etc/lightdm/lightdm-mini-greeter.conf"

sudo systemctl enable lightdm.service

# Finish
echo "You may stillt want to configure the following things:"
echo "  - Enable color output in /etc/pacman.conf"
echo "Reboot."
