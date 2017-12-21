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

# Edit .zshrc file
alias zshrc="$EDITOR $zshrc"

# Lock Screen
alias lockscreen='pmset displaysleepnow'

# Reload settings or hardware
alias reload!="source $zshrc"
alias reload="echo 'Use \"reload!\" instead'"
alias reload-wifi='sudo iwlist wlp3s0 scan'
alias reload-audio='sudo killall coreaudiod'
alias reload-touchbar="sudo pkill TouchBarServer && sudo killall ControlStrip && sudo pkill NowPlayingTouchUI"

# Networking
alias sshproxy='echo "Starting proxy server on port 5555..."; ssh -qTnN -D 5555'
alias pubip='curl icanhazip.com'
alias myip="ifconfig | grep inet | grep -vE '(inet6|127.0.0.1)' | awk '{print $2}' | awk -F ':' '{print $2}'"

# Random
alias fsize='du -hs'
alias dsize='du -h -d 1'

# Applications
alias vsc='open -a "Visual Studio Code"'

# Deluge Terminal Shortcuts
alias deluge-list="deluge-console info --sort=state | grep -E 'Name:.*$|$' --color=always | less -R"
alias deluge-pause="deluge-console pause '*'"
alias deluge-resume="deluge-console resume '*'"

# Make sudo work with aliases
alias sudo='sudo '

