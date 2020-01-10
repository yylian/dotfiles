#!/bin/bash

# Install zsh

brew install zsh
brew install zsh-completions
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install applications
brew install elixir
brew install htop
brew install hub
brew install midnight-commander
brew install neovim
brew install pandoc
brew install python3
brew install tmux
brew install wget
brew install z

brew cask install 1password
brew cask install alfred
brew cask install bartender
brew cask install docker
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2-nightly
brew cask install middleclick
brew cask install pycharm-ce
brew cask install slack
brew cask install telegram-desktop
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install vmware-fusion

# Install mas for installing appstore apps

brew install mas

# Microsoft Remote Desktop 10
mas install 1295203466
# Amphetamine
mas install 937984704
