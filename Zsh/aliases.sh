#!/bin/bash

# ALIASES
# #######

# List
alias  l='ls -FG'
alias la='ls -FGalh'
alias ll='ls -FG1'

# Directories
alias dotfiles="cd $dotfiles"
alias     code="cd ~/code"
alias     crap="cd ~/crap"

# Random
alias zshrc="$EDITOR $zshrc"
alias reload!="source $zshrc"
alias myip='ifconfig en0 inet | grep inet'
alias fsize='du -hs'
alias dsize='du -h -d 1'

# Applications
alias vsc='open -a "Visual Studio Code"'

# Make sudo work with aliases
alias sudo='sudo '

