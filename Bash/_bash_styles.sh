# STYLING & COLORS
# ################


## LSCOLORS
#> http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#> http://apple.stackexchange.com/questions/100297/changing-terminal-color

export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=exBxhxDxfxhxhxhxhxcxcx


## Prompt Style/Colors
#> http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt/
#> http://www.kirsle.net/wizards/ps1.html

export PS1_OLD=$PS1
export PS1="\[\033[1;97m\]\u: \[\033[1;94m\]\w \[\033[1;97m\]\$\[\033[0m\] "
