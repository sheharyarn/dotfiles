#!/bin/bash

# OSX Defaults
# ============

# Set shit the way I like it.
# Some of it copied from the .dotfiles of:
#     @holman
#     @pburtchaell
#     @mathiasbynens




# Create the Locate database
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Always show Hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Hide Icons on Desktop
defaults write com.apple.finder CreateDesktop -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set Sidebar Icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the OSX Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Disable Screensaver (Set to 'never')
defaults -currentHost write com.apple.screensaver idleTime 0

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


# Restart Finder and other Services
killall Finder
killall Dock


# Ask the User to Reboot
sleep 1

echo "Success! All OS X defaults are set."
echo
echo "Some changes will not take effect until you reboot your machine."

function reboot() {
  read -p "Do you want to reboot your machine now (yes/no)? " choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer!" && return;;
  esac
}

if [[ "Yes" == $(reboot) ]]
then
    echo "Rebooting."
    sudo reboot
    exit 0
else
    echo "No reboot. </3 Exiting..."
    exit 1
fi

