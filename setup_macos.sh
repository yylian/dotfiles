#! /usr/bin/env zsh

if [ "$(uname)" != "Darwin" ]
then
    echo "Aborting. These dotfiles are meant to be running on macOS"
    exit 1
fi


mkdir "~/dev"

REPO_NAME="dotfiles"
CURRENT_PATH=$(pwd)
REPO_PATH="$CURRENT_PATH/dev/$REPO_NAME"
DOTFILES_PATH="$REPO_PATH/dotfiles"

# Install applications
if [ ! -f "$(which brew)" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

CLI_BREWS=(
    findomain
    font-hasklug-nerd-font
    git
    htop
    kubectx
    kubernetes-cli
    mas
    neovim
    fnm
    pritunl
    python3
    tmux
    wget
    z
)

APP_BREWS=(
    1password
    alfred
    docker
    fantastical
    firefox
    google-chrome
    kitty
    microsoft-teams
    telegram-desktop
    visual-studio-code
)

brew tap homebrew/cask-fonts
brew install $CLI_BREWS
brew install --cask $APP_BREWS

# Microsoft Remote Desktop 10
mas install 1295203466

# Setup
mkdir "~/.ssh"

git clone https://github.com/yylian/dotfiles.git $REPO_PATH

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

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap

mkdir "${CONFIG_PATH}/nvim"
ln -sf "${DOTFILES_PATH}/nvim/init.vim" "${CONFIG_PATH}/nvim"

mkdir "${CONFIG_PATH}/kitty"
ln -sf "${DOTFILES_PATH}/kitty/kitty.conf" "${CONFIG_PATH}/kitty"

osascript -e "tell application \"Finder\" to set desktop picture to \"${DOTFILES_PATH}/background.png\" as POSIX file"

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.dock no-bouncing -bool TRUE
defaults write com.apple.dock orientation left
osascript -e 'tell application "System Events" to set autohide of dock preferences to not (autohide of dock preferences)'

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write -g ApplePressAndHoldEnabled -bool false

# Finish
echo "You may stillt want to configure the following things:"
echo "  - Request password after lock immediately"
echo "  - Configure alfred"
echo "Reboot."
