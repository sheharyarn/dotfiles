#!/bin/bash

# FUNCTIONS
# =========

# List all of current user's processes
myps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


# Find CPU and Memory Hogs
cpuhogs() { ps wwaxr -o pid,stat,%cpu,time,command | head -10 ;}
memhogs() { ps wwaxm -o pid,stat,vsize,rss,time,command | head -10; }


# Search for matching files and directories in the current dir
search() {
    if [[ $# -eq 0 ]] ; then
        echo "no arguments provided"
        echo "usage: search string [string2 string3 ...]"
        echo ""
    else
        for i in "$@"; do
            find . -iname "*$i*" -d | sed 's/^..//' | grep -i --color "$i"
            echo ""
        done
    fi
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
    local cm=""
    for i in "$@"; do
        cm="$cm $i"
    done

    eval "$cm"
}


# Extract all archives with a single command
extract () {
  if [ -f $1 ] ; then
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

# Get Word Freqeuncy of Files
function wordfrequency() {
  awk '
     BEGIN { FS="[^a-zA-Z]+" } {
         for (i=1; i<=NF; i++) {
             word = tolower($i)
             words[word]++
         }
     }
     END {
         for (w in words)
              printf("%3d %s\n", words[w], w)
     } ' | sort -rn
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

