#!/bin/bash

# GIT ALIASES
# ===========

alias         g='git'


# Status and Information
alias        gb='git branch'
alias        gs='git status'
alias       gss='git status -s'

alias        gd='git diff'
alias       gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias        gl='git log --decorate --color         --oneline'
alias       glg='git log --decorate --color --graph --oneline'
alias      glga='git log --decorate --color --graph --oneline        --all'
alias       gla='git log --decorate --color --graph'
alias      glaa='git log --decorate --color --graph           --stat --all'

  # gl="git log --graph --pretty=format:'%C(red)%h - %Creset%s'"
  ## https://coderwall.com/p/euwpig/a-better-git-log


# Staging and Commiting
alias        ga='git add'
alias        gu='git add -u'
alias       gaa='git add -A'
alias       guc='gu  && gc'
alias       gac='gaa && gc'

  # gc moved to functions.sh


# Branches and Remotes
alias        gm='git merge'
alias       gco='git checkout'
alias        gr='git remote'
alias       grv='gr -v'
alias       gra='gr add'


# Pushing, Pulling and Deploying
alias        gp='git push'
alias       gpp='git push origin $(current_branch)'
alias     gpull='git pull origin $(current_branch)'
alias     gpdep='gpdeploy'
alias     gpher='gpheroku'
alias  gpdeploy='gp && cap production deploy'
alias  gpheroku='gp && gp heroku master'


# Others
alias       grb='git rebase -i'
alias       grt='gitroot'
alias   gitroot='cd $(git rev-parse --show-toplevel || echo ".")'
alias  gitcount='git rev-list HEAD --count'
alias   gsearch='gitsearch'
alias gitsearch='gla -p -S'
alias gitconfig='less -P "(END)" $(git rev-parse --show-toplevel)/.git/config'


