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
