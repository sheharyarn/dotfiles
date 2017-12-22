#!/usr/bin/env bash

# Just load Aliases and Functions
# (only for Bash)

export dotfiles=$HOME/.dotfiles
export DOTFILES=$dotfiles

if [[ -n $BASH ]] ; then
  # If BASH
  my_aliases=($DOTFILES/**/aliases.sh)
  my_functions=($DOTFILES/**/functions.sh)

  for f in ${my_aliases[@]};   do source $f; done
  for f in ${my_functions[@]}; do source $f; done


elif [[ -n $ZSH_NAME ]] ; then
  # If ZSH
  typeset -U my_aliases
  typeset -U my_functions
  my_aliases=($DOTFILES/**/aliases.sh)
  my_functions=($DOTFILES/**/functions.sh)
  my_files=($my_aliases $my_functions)

  for file in ${my_files}; do
    source $file
  done
fi

