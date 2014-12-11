# ALIASES
# #######

# List
alias l='ls -FG'
alias la='ls -FGal'

# CD
alias ~='cd ~'
alias .='cd .'
alias ..='cd ..'
alias ....='cd ../../'

# Git
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'
#alias gl='git log --oneline'
alias gl="git log --graph --pretty=format:'%C(red)%h - %Creset%s'"  ## https://coderwall.com/p/euwpig/a-better-git-log
alias gac='git add -A && git commit -m'
alias gla='git log'
alias gpull='git pull origin'
alias gitcount='git rev-list HEAD --count'
alias gpdeploy='gp && cap production deploy'

# iA Writer
alias md='open -a "iA Writer Pro"'

# Sublime
alias subl='sublime'
alias edit='sublime'

# Ruby / Rails
alias rs='rails s'
alias rc='rails c'
alias rg='rails g'

# Random
alias refresh="source ~/.bash_profile"
alias myip="ifconfig en0 inet | grep inet"
alias fsize='du -hs'
alias dsize='du -h -d 1'
