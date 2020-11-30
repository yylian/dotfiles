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
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Make finder more explicit
chflags nohidden ~/Library
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Set hotkeys
defaults import com.apple.symbolichotkeys symlinks/com.apple.symbolichotkeys

# Reset dock
killall Dock
