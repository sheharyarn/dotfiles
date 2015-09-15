#!/bin/bash

# ALIASES
# #######

# List
alias  l='ls -FG'
alias la='ls -FGalh'
alias ll='ls -FG1'

# Brew Binaries
alias trash='rmtrash'
alias   del='rmtrash'

# Directories
alias dotfiles="cd ~/.dotfiles"
alias     code="cd ~/code"
alias     crap="cd ~/crap"

# Random
alias zshrc='vi ~/.zshrc' 
alias reload!='source ~/.zshrc'
alias myip="ifconfig en0 inet | grep inet"
alias fsize='du -hs'
alias dsize='du -h -d 1'

# Applications
alias vsc='open -a "Visual Studio Code"'



# Variables
# #########

export EDITOR='subl'
export zshrc='$HOME/.zshrc'


