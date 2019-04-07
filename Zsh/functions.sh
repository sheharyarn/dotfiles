#!/bin/bash

# FUNCTIONS
# =========


# Get current Platform
get-platform() {
  case "$(uname -s)" in
     Darwin)
       echo 'apple'
       ;;

     Linux)
       echo 'linux'
       ;;

     CYGWIN*|MINGW32*|MSYS*)
       echo 'windows'
       ;;

     *)
       echo 'unknown'
       exit 1
       ;;
   esac
}


# Pretty Print JSON Curl Responses
# Need to have jq installed
jcurl() {
  curl -s "$@" | jq .
}

# List all of current user's processes
myps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


# Find CPU and Memory Hogs
cpuhogs() { ps wwaxr -o pid,stat,%cpu,time,command | head -10 ;}
memhogs() { ps wwaxm -o pid,stat,vsize,rss,time,command | head -10; }


# Search for matching files and directories in the current tree
search() {
  if [[ $# -eq 0 ]] ; then
    echo "no arguments provided"
    echo "usage: search string"
    echo ""
  else
    rg --files $RG_DEFAULT_ARGS | rg -i "$@"
  fi
}


# Search for text within files in current tree
search-in() {
  if [[ $# -eq 0 ]] ; then
    echo "no search expression provided"
    echo "usage: search-in 'some string'"
    echo ""
  else
    rg $RG_DEFAULT_ARGS -i "$@"
  fi
}


# Mass Search-and-Replace in current tree
# Need to have gnused installed on OSX
search-replace() {
  if [[ $# -eq 0 ]] ; then
    echo "no replace regex provided"
    echo "usage: search-replace 's/match_regex/replace_regex/g'"
    echo ""

  else
    if [[ "$(get-platform)" == "linux" ]]; then
      local sed="sed"
    elif [[ "$(get-platform)" == "apple" ]]; then
      local sed="gsed"
    fi

    if [[ "$1" =~ ^s/.+/.+/g$ ]] ; then
      rg --files $RG_DEFAULT_ARGS | xargs $sed -i "$1"
    else
      echo "provide a valid match and replace regex"
      echo "usage: search_replace 's/match_regex/replace_regex/g'"
      echo ""
    fi
  fi
}


# Move files to trash
# Need to have either trash-put or rmtrash installed on the system
del() {
  if hash trash-put 2>/dev/null; then
    trash-put "$@"
  elif hash rmtrash 2>/dev/null; then
    rmtrash "$@"
  else
    echo "Did not find 'trash-cli' or 'rmtrash'"
    exit 1
  fi
}


# Search processes
psx() {
  ps aux | grep -i "$@" | grep -v grep
}


# Kill all processes that match string
psxkill() {
  psx "$@" | awk '{ print $2 }' | xargs kill
}


# Do cool stuff with the edit command
edit() {
    if [[ $# -eq 0 ]] ; then
        eval "$EDITOR ."
    else
        eval "$EDITOR $1"
    fi
}

# Use $ as a function
function $ {
    eval "$@"
}


# Extract all archives with a single command
extract () {
  if [ $# -eq 1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Disposable File Hosting - http://transfer.sh/
transfer() {
    # check arguments
    if [ $# -eq 0 ];
    then
        echo "No arguments specified. Usage:\ntransfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )

    # upload stdin or file
    file=$1

    if tty -s;
    then
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi

        if [ -d $file ];
        then
            # zip directory and transfer
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        fi
      else
        # transfer pipe
        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi

    # cat output link
    cat $tmpfile

    # cleanup
    rm -f $tmpfile
}

