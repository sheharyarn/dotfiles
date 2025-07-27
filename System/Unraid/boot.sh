#!/bin/bash

# Unraid boot script
# ==================
#
# This file should be executed as part of `/boot/config/go`
# by adding these lines:
# 
# ```sh
# # Load dotfiles
# DOTFILES_PATH="/boot/config/dotfiles"
#
# if [ -d "$DOTFILES_PATH" ]; then
#   source "$DOTFILES_PATH/System/Unraid/boot.sh"
# fi
# ```


# Load dotfiles
# -------------

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
# ------------------

if [ ! -d "/unraid" ]; then
  mkdir -p /unraid

  ln -s /unraid       /root/unraid
  ln -s /mnt/user     /unraid/shares
  ln -s /mnt/disks    /unraid/disks
  ln -s /mnt/remotes  /unraid/remotes
fi
