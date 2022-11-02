#! /bin/bash

if [ ! -f "/etc/arch-release" ]
then
    echo "Aborting. These dotfiles are meant to be running on archlinux"
    exit 1
fi


mkdir ~/dev

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
REPO_PATH="$CURRENT_PATH/dev/$REPO_NAME"
DOTFILES_PATH="$REPO_PATH/dotfiles"

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
    fish
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
    zoxide
    zip
)

yay
yay -S $PACKAGES

git clone https://github.com/yylian/dotfiles.git $REPO_PATH

mkdir ~/.ssh

CONFIG_PATH="$HOME/.config"
mkdir $CONFIG_PATH

mkdir "${CONFIG_PATH}/git"
ln -sf "${DOTFILES_PATH}/git/.gitignore" "${CONFIG_PATH}/git/ignore"

git config --global core.excludesfile '~/.config/git/ignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false
mv ~/.gitconfig ~/.config/git/config

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap

ln -sf "$DOTFILES_PATH/fish/config.fish" "$CONFIG_PATH/fish"

mkdir "$CONFIG_PATH/nvim"
ln -sf "$DOTFILES_PATH/nvim/init.vim" "$CONFIG_PATH/nvim"

mkdir "$CONFIG_PATH/kitty"
ln -sf "$DOTFILES_PATH/kitty/kitty.conf" "$CONFIG_PATH/kitty"

# Finish
echo "You may still want to configure the following things:"
echo "  - Enable color and ILoveCandy output in /etc/pacman.conf"
echo "Reboot."
