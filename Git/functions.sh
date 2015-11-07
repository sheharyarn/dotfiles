#!/bin/bash

# GIT FUNCTIONS
# =============

unalias gc     # avoid collision with zsh git plugin

gc() {
    if [[ $# -eq 0 ]] ; then
        git commit
    else
        git commit -m "$1"
    fi
}

