# Set backgorund image
osascript -e 'tell application "Finder" to set desktop picture to "/Users/julianjarminowski/Downloads/dotfiles/.files/assets/background.png" as POSIX file'

# Change theme to dark
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Disable harddrives shown on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Change dock
defaults write com.apple.dock static-only -bool TRUE
osascript -e 'tell application "System Events" to set autohide of dock preferences to not (autohide of dock preferences)'
defaults write com.apple.dock orientation left

# Change lock screen settings
defaults -currentHost write com.apple.screensaver idleTime 86400

# change display settings
brew cask install cscreen
cscreen -x 1680 -y 1050 -s 1
brew cask uninstall cscreen

# This changes the trackpad settings
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0

# This sets the keyboard settings
defaults write -g com.apple.keyboard.fnState -bool true
defaults write -g InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 2

# echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# echo "show hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool true

# echo "show the ~/Library folder in Finder"
chflags nohidden ~/Library

# echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Show remaining battery time; hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

# echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

# echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

# echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Reset dock
killall Dock
