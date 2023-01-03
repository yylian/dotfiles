#! /bin/bash

# Isntall yay and packages
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

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

# Install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir ~/dev

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
REPO_PATH="$CURRENT_PATH/dev/$REPO_NAME"
DOTFILES_PATH="$REPO_PATH/dotfiles"


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
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHPN3sulvGbTMs1WtoAnkd4dRt6I2sfaaN08wFJaLp8A julian@jarminowski.de'



ln -sf "$DOTFILES_PATH/fish/config.fish" "$CONFIG_PATH/fish"

mkdir "$CONFIG_PATH/nvim"
ln -sf "$DOTFILES_PATH/nvim/init.vim" "$CONFIG_PATH/nvim"

mkdir "$CONFIG_PATH/kitty"
ln -sf "$DOTFILES_PATH/kitty/kitty.conf" "$CONFIG_PATH/kitty"
