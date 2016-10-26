#!/bin/bash

# GIT FUNCTIONS
# =============

unalias gc     # avoid collision with zsh git plugin


# Commits - Either inline or in vim
gc() {
    if [[ $# -eq 0 ]] ; then
        git commit
    else
        git commit -m "$1"
    fi
}


# Commits in a specific instance in time
# See: http://stackoverflow.com/a/3896112/1533054
gc-time() {
    if [[ $# -ne 2 ]] ; then
        echo "invalid arguments"
        echo "usage: gc-time DATETIME COMMIT_MESSAGE"
        echo "examples:"
        echo "   gc-time \"5 days ago\" \"Commit 5 days in the past\""
        echo "   gc-time \"4 hours\" \"Commit 4 hours in the future\""
        echo "   gc-time \"Fri Jul 26 19:32:10 2013 -0400\" \"Commit in specific instance in time\""
        echo ""
    else
        if (date -d "$1") &>/dev/null; then
            local gitdate=$(date -d "$1")
            GIT_AUTHOR_DATE="$gitdate" GIT_COMMITTER_DATE="$gitdate" git commit -m "$2"
        else
            gc-time
        fi
    fi
}

