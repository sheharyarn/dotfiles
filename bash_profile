#### Sheharyar Naseer's DotFiles ####
#####################################
## .bash_profile


## COLORS
##########

export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=exBxhxDxfxhxhxhxhxcxcx

export PS1_OLD=$PS1
export PS1="\[\033[1;97m\]\u:\[\033[0m\] \[\033[1;94m\]\w\[\033[0m\] \[\033[1;97m\]\$\[\033[0m\] "



## ALIASES
###########

alias l='ls -FG'
alias la='ls -FGal'

alias ~='cd ~'
alias ..='cd ..'
alias ....='cd ../../'

alias gs='git status'
alias gl='git log --oneline'
alias gla='git log'

alias subl='sublime'
