#!/bin/bash

# GIT FUNCTIONS
# =============

# avoid collisions with zsh git plugin
unalias gc 2>/dev/null
unalias gbda 2>/dev/null


# Fetch and checkout
gfco() { gfo "$@" && gco "$@" }


# Git log all commits (or PR commits) since specified tag
gl-since()     { gl "$1"..HEAD }
gl-since-prs() { gl-since "$@" | grep -i "#" }


# Commits - Either inline or in vim
gc() {
  if [[ $# -eq 0 ]] ; then
    git commit
  else
    git commit -m "$1"
  fi
}


# Tags with Annotations
gta() {
  if [[ $# -eq 1 ]] ; then
    git tag -a "$1"
  elif [[ $# -eq 2 ]]; then
    git tag -a "$1" -m "$2"
  else
    echo "invalid arguments"
    echo "usage: gta TAG_NAME [TAG_MESSAGE]"
    echo "examples:"
    echo "   gta v1.2"
    echo "   gta v0.4-beta.3 \"Added Feature X\""
  fi
}


# Delete all branches that match passed arg
gbda() {
  local branches="$(gb | grep -v '*' | grep -v master)"

  if [[ $# -eq 1 ]] ; then
    branches="$(echo $branches | grep -i "$1")"
  fi

  echo "This will delete these branches:\n"
  echo $branches
  echo -n "\nContinue? [Y/n]? "
  read yn

  case $yn in
    [Y]* )
      echo $branches | xargs git branch -D
      ;;

    * )
      echo "Delete cancelled"
      return 1
      ;;
  esac
}


# Generate content for .gitignore files
gi() {
  curl -fsSL "https://gitignore.io/api/$@"
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

    if [[ "$(get-platform)" == 'linux' ]]; then
      local date="date"
    elif [[ "$(get-platform)" == 'apple' ]]; then
      local date="gdate"
    fi

    if ($date -d "$1") &>/dev/null; then
      local gitdate=$($date -d "$1")
      GIT_AUTHOR_DATE="$gitdate" GIT_COMMITTER_DATE="$gitdate" git commit -m "$2"
    else
      gc-time
    fi
  fi
}

