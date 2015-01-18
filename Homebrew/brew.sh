#!/bin/bash

## Homebrew Set-up Script
## ======================


# Uncomment this if you don't have Homebrew installed
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"



# Set up important taps
# ---------------------

brew tap caskroom/cask
brew tap homebrew/dupes



# Install binaries
# ----------------

brew install git
brew install wget
brew install node
brew install nano
brew install vim
brew install heroku-toolbelt
brew install brew-cask



# Install Apps
# ------------

#> Must apps
brew cask install firefox
brew cask install google-chrome
brew cask install vlc
brew cask install mpv                       # see dotfiles/osx/mpv
brew cask install skype
brew cask install jumpshare                 # fuck dropbox

#> Dev Apps
brew cask install sublime-text2             # see dotfiles/sublime/2
brew cask install atom
brew cask install android-file-transfer
brew cask install android-studio

#> Not that important
brew cask install couleurs
brew cask install chromecast
brew cask install lastfm




