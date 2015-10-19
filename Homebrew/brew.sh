#!/bin/bash

## Homebrew Set-up Script
## ======================


# Uncomment this if you don't have Homebrew installed
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# If you haven't already install zsh, then you need to die
# brew install zsh - see dotfiles/zsh


# Set up important taps
# ---------------------

brew tap homebrew/dupes
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions


# Install binaries
# ----------------

brew install git                            # : dotfiles/git
brew install wget
brew install node
brew install nano                           # : dotfiles/nano
brew install curl --with-openssl
brew install vim --override-system-vim      # : dotfiles/vim
brew install macvim
brew install heroku-toolbelt
brew install brew-cask
brew install tor
brew install torsocks
brew install safe-rm
brew install rmtrash
brew install tree
brew install unrar
brew install archey

#> External Binaries
brew install karan/karan/gitignore
brew install neovim/neovim/neovim --HEAD
brew install rogual/neovim-dot-app/neovim-dot-app --HEAD



# Install Apps
# ------------

#> Must apps
brew cask install firefoxdeveloperedition
brew cask install google-chrome
brew cask install vlc
brew cask install mpv                       # : dotfiles/osx/mpv
brew cask install utorrent
brew cask install skype
brew cask install jumpshare                 # fuck dropbox
brew cask install teamviewer
brew cask install android-file-transfer
brew cask install nosleep

#> Dev Apps
brew cask install sublime-text              # : dotfiles/sublime/2
brew cask install atom
brew cask install android-studio            # point it to your huge sdk folder
brew cask install java
brew cask install postgres

#> Not that important
brew cask install couleurs
brew cask install tunnelbear

#> Maybe
# brew cask install firefox
# brew cask install chromecast
# brew cask install ps3-media-server
# brew cask install lastfm
# brew cask install shiny-groove



# Link Apps
# ---------

brew linkapps macvim

