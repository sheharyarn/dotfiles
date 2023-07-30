#!/bin/bash

# Unraid boot script
# ------------------

# This file should be executed as part of /boot/config/go


# Load dotfiles
DOTFILES_PATH="/boot/config/dotfiles"

if [ -d "$DOTFILES_PATH" ]; then
  # Remove old artifacts
  rm -rf /root/.bash_profile
  rm -rf /root/.dotfiles

  # Create fresh links
  ln -s $DOTFILES_PATH /root/.dotfiles
  ln -s /root/.dotfiles/System/Unraid/.bash_profile /root/.bash_profile
fi

# Create Share Links
if [ ! -d "/unraid" ]; then
  mkdir -p /unraid

  ln -s /unraid      /root/unraid
  ln -s /mnt/shares  /unraid/shares
  ln -s /mnt/disks   /unraid/disks
  ln -s /mnt/remotes /unraid/remotes
fi

# Set Git Config
git config --global user.name "Sheharyar Naseer"
git config --global user.email "hello@sheharyar.me"
