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
  local branches="$(gb | grep -v '*' | grep -v master | grep -v main)"

  if [[ $# -eq 1 ]] ; then
    branches="$(echo $branches | grep -i "$1")"
  fi

  echo "This will delete these branches:\n"
  echo $branches
  echo -n "\nContinue? [Y/n]: "
  read yn

  case $yn in
    [Y]* )
      echo ""
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


# Change author of all commits that match a specific email
# https://github.com/newren/git-filter-repo
# https://stackoverflow.com/a/61368365/1533054
git-update-author() {
  if ! command -v git-filter-repo >/dev/null ; then
    echo "Program 'git-filter-repo' not installed"
    return 1
  fi

  if [[ (-z "$OLD_EMAIL") || (-z "$NEW_EMAIL") || (-z "$NEW_NAME") ]] ; then
    echo "A required env variable was not set: \$OLD_EMAIL, \$NEW_EMAIL, \$NEW_NAME"
    return 1
  fi

  echo "This will modify Git history, and can potentially corrupt it. It is IMPORTANT that you first clone your repo before running this.\n"
  echo -n "\nContinue? [Y/n]: "
  read yn

  case $yn in
    [Y]* )
      git filter-repo --force --commit-callback "
        old_email = b'$OLD_EMAIL'
        new_email = b'$NEW_EMAIL'
        new_name  = b'$NEW_NAME'

        if commit.committer_email == old_email :
          commit.committer_name  = new_name
          commit.committer_email = new_email

        if commit.author_email == old_email :
          commit.author_name  = new_name
          commit.author_email = new_email
      "
      ;;

    * )
      echo "Git author update cancelled"
      return 1
      ;;
  esac
}


