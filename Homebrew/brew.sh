#!/bin/bash

## Homebrew Set-up Script
## ======================


# First make sure Homebrew is installed from: https://brew.sh


# Set up important taps
# ---------------------

brew tap homebrew/cask-fonts
#brew tap homebrew/cask-versions


# Install binaries
# ----------------

brew install zsh
brew install coreutils
brew install gnu-sed
brew install git
brew install git-filter-repo
brew install svn
brew install gpg
brew install nano
brew install curl
brew install wget
brew install asdf
brew install watch
brew install httpie
brew install vifm
brew install tor
brew install torsocks
brew install safe-rm
brew install trash-cli
brew install tree
brew install unrar
brew install nginx
brew install mysql
brew install mongodb/brew/mongodb-community
brew install postgresql
brew install imagemagick
brew install archey
brew install fzf
brew install fd
brew install ripgrep
brew install python
brew install z
brew install jq
brew install hub
brew install duti
brew install k9s
brew install docker-compose
brew install tailscale


#> Vim
# brew install vim
# brew install neovim



# Install Apps
# ------------

#> Must apps
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask firefox-developer-edition
brew install --cask google-chrome
brew install --cask zoom
brew install --cask mpv
brew install --cask jellyfin-media-player
brew install --cask dropbox
brew install --cask android-file-transfer
brew install --cask little-snitch
brew install --cask tuxera-ntfs
brew install --cask rocket
brew install --cask spotify
brew install --cask unclutter
brew install --cask tailscale

#> Dev Apps
brew install --cask iterm2
brew install --cask postico
brew install --cask insomnia
brew install --cask visual-studio-code
brew install --cask java
brew install --cask android-studio
brew install --cask android-platform-tools
brew install --cask docker

#> Not that important

#> Maybe
# brew install --cask jumpshare
# brew install --cask teamviewer
# brew install --cask flux
# brew install --cask tunnelbear
# brew install --cask videostream
# brew install --cask vlc
# brew install --cask firefox
# brew install --cask chromecast
# brew install --cask ps3-media-server
# brew install --cask lastfm
# brew install --cask sublime-text              # : dotfiles/sublime/2
# brew install --cask atom
# brew install --cask skype
# brew install --cask nosleep
# brew install --cask flash
# brew install --cask utorrent
# brew install --cask couleurs
# brew install --cask kap


# Quick Look Plugins
# ------------------

# brew cask install qlmarkdown
# brew cask install quicklook-json
# brew cask install quicklook-csv
# brew cask install qlimagesize
# brew cask install suspicious-package
# brew cask install provisionql
# brew cask install qlcolorcode
# brew cask install qlstephen



# Link Apps
# ---------

# brew linkapps macvim



# Launchd Configuration
# ---------------------

# brew services start tor
# brew services start mysql
# brew services start mongodb
# brew services start postgresql



# Run Installers
# --------------

# open /usr/local/Caskroom/little-snitch/*/Little\ Snitch\ Installer.app

