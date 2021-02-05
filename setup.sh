#! /usr/bin/env zsh

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
DOTFILES_PATH="${CURRENT_PATH}/${REPO_NAME}"
SYMLINK_PATH="DOTFILES_PATH/symlinks"

if [ "$(uname)" != "Darwin" ]
then
    echo "Aborting. These dotfiles are meant to be running on OSX"
    exit 1
fi

# Install applications
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

CLI_BREWS=(
    findomain
    git
    htop
    neovim
    nvm
    mas
    python3
    tmux
    wget
    z
    coreutils
)

APP_BREWS=(
    1password
    alfred
    bartender
    docker
    firefox
    google-chrome
    alacritty
    middleclick
    pycharm
    microsoft-teams
    telegram-desktop
    virtualbox
    visual-studio-code
    vmware-fusion
)

brew install $CLI_BREWS
brew install --cask $APP_BREWS

# Microsoft Remote Desktop 10
mas install 1295203466
# Gestimer
mas install 990588172

# Setup
mkdir ~/dev
mkdir ~/.ssh

git clone git://github.com/yylian/dotfiles.git $REPO_NAME
git config --global core.excludesfile '~/.gitignore'
git config --global pull.rebase true

ln -sf "${SYMLINK_PATH}/.gitignore" $HOME
ln -sf "${SYMLINK_PATH}/.zshrc" $HOME
ln -sf "${SYMLINK_PATH}/.alacritty.darwin.yml" "${HOME}/.alacritty.yml"

code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap
code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment

osascript -e "tell application \"Finder\" to set desktop picture to \"${DOTFILES_PATH}/assets/background.png\" as POSIX file"

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.dock orientation left
osascript -e 'tell application "System Events" to set autohide of dock preferences to not (autohide of dock preferences)'

#defaults write -g com.apple.keyboard.fnState -bool true
#defaults write NSGlobalDomain KeyRepeat -int 0
#defaults write NSGlobalDomain InitialKeyRepeat -int 15
#defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
#defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Finish
echo "You may stillt want to configure the following things:"
echo "1. Set passwort request after sleep to immediately"
echo "2. Configure alfred"
echo "3. Reboot this machine"
