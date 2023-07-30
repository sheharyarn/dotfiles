# console coloring for kool kids
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# if this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Set Dotfiles Location
# (Note this is not the original location, this is just a symlink)
export DOTFILES='/root/.dotfiles'

# impersonate a user
alias user="su -ls /bin/bash"

alias  l='ls -FG'
alias la='ls -FGalh'
alias ll='ls -FG1'

alias  v='vim'
alias vi='vim'

source "$DOTFILES/Git/aliases.sh"
source "$DOTFILES/Git/functions.sh"
