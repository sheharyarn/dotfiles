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
alias fsize='du -hs'
alias dsize='du -h -d 1'
alias pubip='curl icanhazip.com'
alias wifi-reload='sudo iwlist wlp3s0 scan'
alias myip="ifconfig | grep inet | grep -vE '(inet6|127.0.0.1)' | awk '{print $2}' | awk -F ':' '{print $2}'"
#alias myip='ifconfig en0 inet | grep inet'

# Applications
alias vsc='open -a "Visual Studio Code"'

# Deluge Terminal Shortcuts
alias deluge-list="deluge-console info --sort=state | grep -E 'Name:.*$|$' --color=always | less -R"
alias deluge-pause="deluge-console pause '*'"
alias deluge-resume="deluge-console resume '*'"

# Make sudo work with aliases
alias sudo='sudo '

