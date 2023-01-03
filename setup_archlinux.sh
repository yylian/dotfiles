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

# git stuff
REPO_PATH="/home/yylian/dev/dotfiles"
git clone https://github.com/yylian/dotfiles.git $REPO_PATH

git config --global core.excludesfile '~/.config/git/ignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHPN3sulvGbTMs1WtoAnkd4dRt6I2sfaaN08wFJaLp8A julian@jarminowski.de'

# Create dirs and link files
mkdir "$HOME/dev"
mkdir "$HOME/.ssh"
mkdir "$HOME/.config"

mkdir "$HOME/.config/nvim"
mkdir "$HOME/.config/fish"
ln -sf "/Users/yylian/dev/dotfiles/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "/Users/yylian/dev/dotfiles/dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sf "/Users/yylian/dev/dotfiles/dotfiles/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "/Users/yylian/dev/dotfiles/dotfiles/fish/functions" "$HOME/.config/fish/functions"

# Link folders
ln -sf "/Users/yylian/dev/dotfiles/dotfiles/git" "$HOME/.config/git"
ln -sf "/Users/yylian/dev/dotfiles/dotfiles/kitty" "$HOME/.config/kitty"
