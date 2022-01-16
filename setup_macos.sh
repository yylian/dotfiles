#! /usr/bin/env zsh

if [ "$(uname)" != "Darwin" ]
then
    echo "Aborting. These dotfiles are meant to be running on macOS"
    exit 1
fi

REPO_NAME=".files"
CURRENT_PATH=$(pwd)
DOTFILES_PATH="${CURRENT_PATH}/${REPO_NAME}"
DOTFILES_PATH="${DOTFILES_PATH}/dotfiles"

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
    alacritty
    pycharm
    microsoft-teams
    telegram-desktop
    virtualbox
    visual-studio-code
    vmware-fusion
)

brew tap homebrew/cask-fonts
brew install $CLI_BREWS
brew install --cask $APP_BREWS

# Microsoft Remote Desktop 10
mas install 1295203466
# Gestimer
mas install 990588172

# Setup
mkdir "~/dev"
mkdir "~/.ssh"

git clone git://github.com/yylian/dotfiles.git $REPO_NAME
git config --global core.excludesfile '~/.gitignore'
git config --global pull.rebase true
git config --global init.defaultBranch main
git config --global advice.statusHints false

code --install-extension editorconfig.editorconfig
code --install-extension k--kato.docomment
code --install-extension shardulm94.trailing-spaces
code --install-extension stkb.rewrap

CONFIG_PATH="$HOME/.config"
mkdir $CONFIG_PATH

mkdir "${CONFIG_PATH}/nvim"
ln -sf "${DOTFILES_PATH}/nvim/init.vim" "${CONFIG_PATH}/nvim"

mkdir "${CONFIG_PATH}/kitty"
ln -sf "${DOTFILES_PATH}/kitty/kitty.conf" "${CONFIG_PATH}/kitty"

ln -sf "${DOTFILES_PATH}/git/.gitignore" $HOME
ln -sf "${DOTFILES_PATH}/zsh/.zshrc" $HOME
ln -sf "${DOTFILES_PATH}/alacritty/.alacritty.darwin.yml" "${HOME}/.alacritty.yml"

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

# Finish
echo "You may stillt want to configure the following things:"
echo "  - Request password after lock immediately"
echo "  - Configure alfred"
echo "Reboot."
