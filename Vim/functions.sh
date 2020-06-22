#!/bin/bash


# Vim Functions
# ============


# Open Vim
v() {
  if hash nvim 2>/dev/null; then
    nvim "$@"
  elif hash mvim 2>/dev/null; then
    mvim "$@" > /dev/null 2>&1  # disable all exceptions
  elif hash gvim 2>/dev/null; then
    gvim "$@"
  else
    vim "$@"
  fi
}


# Open vim in a specific directory
v-in() {
  if [[ $# -eq 1 ]] ; then
    cd "$1" && v && popd 1>/dev/null
  else
    echo "usage: v-in [DIRECTORY]"
    return 1
  fi
}
