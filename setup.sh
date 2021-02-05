#! /usr/bin/env zsh

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
DOTFILES_PATH="${CURRENT_PATH}/${REPO_NAME}"
ASSETS_PATH="${DOTFILES_PATH}/assets"

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
)

APP_BREWS=(
    1password
    alfred
    docker
    fantastical
    firefox
    google-chrome
    alacritty
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

ln -sf "${ASSETS_PATH}/.gitignore" $HOME
ln -sf "${ASSETS_PATH}/.zshrc" $HOME
ln -sf "${ASSETS_PATH}/.alacritty.darwin.yml" "${HOME}/.alacritty.yml"

code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap
code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment

osascript -e "tell application \"Finder\" to set desktop picture to \"${ASSETS_PATH}/background.png\" as POSIX file"

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.dock orientation left
osascript -e 'tell application "System Events" to set autohide of dock preferences to not (autohide of dock preferences)'

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finish
echo "You may stillt want to configure the following things:"
echo "  - Request password after lock immediately"
echo "  - Configure alfred"
echo "Reboot."
