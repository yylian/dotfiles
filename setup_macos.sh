#! /usr/bin/env zsh

# Install brew and packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
    pritunl
    telegram-desktop
    visual-studio-code
)

brew tap homebrew/cask-fonts
brew install $CLI_BREWS
brew install --cask $APP_BREWS

# Install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Install Microsoft Remote Desktop 10
mas install 1295203466

# git stuff
REPO_PATH="/Users/yylian/dev/dotfiles"
git clone https://github.com/yylian/dotfiles.git $REPO_PATH

git config --global core.excludesfile '~/.config/git/ignore'
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global advice.statusHints false
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHPN3sulvGbTMs1WtoAnkd4dRt6I2sfaaN08wFJaLp8A julian@jarminowski.de'
git config --global rebase.autosquash true

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

# Configure macos
osascript -e "tell application \"Finder\" to set desktop picture to \"/Users/yylian/dev/dotfiles/dotfiles/background.png\" as POSIX file"

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
