#!/bin/bash

# OSX Defaults
# ============

# Set MacOS defaults just the way I like them.
# Some of it copied from the .dotfiles of:
# - @holman
# - @pburtchaell
# - @mathiasbynens



# Create the Locate database
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Turn the display off after 5 minutes. Sleep after 20 minutes
# on battery and 60 minutes when connected to power.
sudo pmset -b displaysleep 5 sleep 20
sudo pmset -c displaysleep 5 sleep 60

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

# Ask for password when waking up / lid is opened
defaults write com.apple.screensaver askForPassword -bool true

# but not if I open it back within 15 seconds
defaults write com.apple.screensaver askForPasswordDelay 15

# Use tab to change focus between buttons on dialogs, etc.
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

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

# Disable Smart Quotes and Dashes
defaults write -g NSAutomaticDashSubstitutionEnabled 0
defaults write -g NSAutomaticQuoteSubstitutionEnabled 0

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

