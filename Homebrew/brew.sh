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
brew tap caskroom/fonts
brew tap caskroom/versions


# Install binaries
# ----------------

brew install coreutils                      # Use GNU Tools
brew install gnu-sed
brew install git                            # : dotfiles/git
brew install nano                           # : dotfiles/nano
brew install curl --with-openssl
brew install wget
brew install httpie
brew install vim  --with-python3 --with-lua --with-override-system-vi
brew install macvim
brew install heroku-toolbelt
brew install tor
brew install torsocks
brew install safe-rm
brew install rmtrash
brew install tree
brew install unrar
brew install nginx
brew install mysql
brew install mongodb
brew install postgresql
brew install imagemagick
brew install archey
brew install fzf
brew install ripgrep
brew install z
brew install jq
brew install hub


#> External Binaries
brew install karan/karan/gitignore
brew install neovim/neovim/neovim --HEAD
brew install rogual/neovim-dot-app/neovim-dot-app --HEAD



# Install Apps
# ------------

#> Must apps
brew cask install 1password
brew cask install 1password-cli
brew cask install firefoxdeveloperedition
brew cask install iterm2
brew cask install google-chrome
brew cask install mpv                       # : dotfiles/osx/mpv
brew cask install utorrent
brew cask install skype
brew cask install jumpshare
brew cask install dropbox
brew cask install teamviewer
brew cask install android-file-transfer
brew cask install nosleep
brew cask install flash
brew cask install spotify

#> Dev Apps
brew cask install sublime-text              # : dotfiles/sublime/2
brew cask install atom
brew cask install java
brew cask install android-studio            # point it to your huge sdk folder
brew cask install android-platform-tools

#> Not that important
brew cask install flux
brew cask install little-snitch
brew cask install vlc
brew cask install couleurs
brew cask install tunnelbear
brew cask install rocket

#> Maybe
# brew cask install firefox
# brew cask install chromecast
# brew cask install ps3-media-server
# brew cask install lastfm
# brew cask install shiny-groove



# Quick Look Plugins
# ------------------

brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install qlimagesize
brew cask install suspicious-package
brew cask install provisionql
brew cask install qlcolorcode
brew cask install qlstephen



# Link Apps
# ---------

brew linkapps macvim



# Launchd Configuration
# ---------------------

brew services start tor
brew services start mysql
brew services start mongodb
brew services start postgresql



# Run Installers
# --------------

open /usr/local/Caskroom/utorrent/latest/uTorrent.app
open /usr/local/Caskroom/little-snitch/*/Little\ Snitch\ Installer.app

