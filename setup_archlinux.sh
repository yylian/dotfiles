#! /bin/bash

if [ ! -f "/etc/arch-release" ]
then
    echo "Aborting. These dotfiles are meant to be running on archlinux"
    exit 1
fi

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
REPO_PATH="${CURRENT_PATH}/dev/${REPO_NAME}"
DOTFILES_PATH="${REPO_PATH}/dotfiles"

# Install applications
if [ ! -f "$(which yay)" ]
then
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    cd ..
    rm -rf yay-bin
fi

PACKAGES=(
    bitwarden
    discord
    dolphin
    grim slurp wl-clipboard
    firefox
    htop
    kitty
    kubectx
    man
    ncdu
    neovim
    nerd-fonts-hasklig
    openssh
    reflector
    rsync
    rofi
    telegram-desktop
    ttf-apple-emoji
    vim-plug
    visual-studio-code-bin
    wget
    whois
    z
    zip
    zsh
)

yay
yay -S $PACKAGES

git clone git://github.com/yylian/dotfiles.git $REPO_PATH

# Setup
mkdir "~/dev"
mkdir "~/.ssh"

CONFIG_PATH="$HOME/.config"
mkdir $CONFIG_PATH

mkdir "${CONFIG_PATH}/git"
ln -sf "${DOTFILES_PATH}/git/.gitignore" "${CONFIG_PATH}/git/ignore"

git config --global core.excludesfile '~/.config/git/ignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap

ln -sf "${DOTFILES_PATH}/zsh/.zshrc" $HOME

mkdir "${CONFIG_PATH}/nvim"
ln -sf "${DOTFILES_PATH}/nvim/init.vim" "${CONFIG_PATH}/nvim"

mkdir "${CONFIG_PATH}/i3"
ln -sf "${DOTFILES_PATH}/i3/config" "${CONFIG_PATH}/i3"
mkdir "${CONFIG_PATH}/rofi"
ln -sf "${DOTFILES_PATH}/rofi/config.rasi" "${CONFIG_PATH}/rofi"
ln -sf "${DOTFILES_PATH}/rofi/lila.rasi" "${CONFIG_PATH}/rofi"

mkdir "${CONFIG_PATH}/kitty"
ln -sf "${DOTFILES_PATH}/kitty/kitty.conf" "${CONFIG_PATH}/kitty"

# Finish
echo "You may still want to configure the following things:"
echo "  - Enable color and ILoveCandy output in /etc/pacman.conf"
echo "Reboot."
