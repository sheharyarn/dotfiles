#!/bin/bash

# Pre-Reqs
# - Make sure you have set up your ssh keys


# Add PPA Repositories
sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora


# Update
sudo apt-get update


# Install Stuff
sudo apt-get install -y zsh git git-core firefox vim-nox vim-gnome trash-cli


# Set up Zsh
sudo chsh -s $(which zsh) $(whoami)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Set up Dotfiles
git clone git@github.com:sheharyarn/dotfiles.git ~/.dotfiles
mv ~/.zshrc ~/.zshrc.old
ln -s ~/.dotfiles/Zsh/zshrc.symlink   ~/.zshrc
ln -s ~/.dotfiles/Zsh/Plugins         ~/.oh-my-zsh/custom/plugins


# Enable Workspaces
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2


# Do Other stuff manually

