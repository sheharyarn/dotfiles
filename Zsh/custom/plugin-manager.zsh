# Script to manage custom  Plugins and Themes


# Local Functions
# ---------------

__zshcustom_error() {
  echo "$@"
  echo "usage:"
  echo "  zsh-custom add plugin git@someurl.com:user/plugin.git"
  echo "  zsh-custom add theme git@someurl.com:user/theme.git"
  echo "  zsh-custom update plugin git@someurl.com:user/plugin.git"
  echo "  zsh-custom update theme git@someurl.com:user/theme.git"
  echo ""
}




# Public API
# ----------

zsh-custom() {
  # Check No. of Arguments
  if [[ $# -ne 3 ]] ; then
    __zshcustom_error "arguments missing"
    return 1
  fi

  # Define Arguments
  local arg_mode=$1
  local arg_type=$2
  local arg_url=$3

  # Check Mode
  if   [[ "$arg_mode" == "add"    ]] ; then ; local mode="add"  ; local result="Committed new"
  elif [[ "$arg_mode" == "update" ]] ; then ; local mode="pull" ; local result="Updated"
  else
    __zshcustom_error "invalid mode specified"
    return 1
  fi

  # Check Plugin Type
  if   [[ "$arg_type" == "plugin" ]] ; then ; local dirpath="Zsh/custom/plugins"
  elif [[ "$arg_type" == "theme"  ]] ; then ; local dirpath="Zsh/custom/themes"
  else
    __zshcustom_error "invalid type specified"
    return 1
  fi

  # Check Git URL and perform operation
  if [[ "$arg_url" =~ ^git@.+\..+\:.+/.+\.git$ ]] ; then
    local dirname=$(basename $arg_url .git)
    local fullpath="$dirpath/$dirname"
    local message="Zsh Subtree ($arg_mode $arg_type): $dirname \n\n Path: $fullpath \n Repo: $2"
    git -C $DOTFILES subtree $mode --prefix "$fullpath" "$arg_url" master --squash -m $message

    echo ""
    echo "> $result Subtree in Repo!"
    echo "> If it's a theme, remember to symlink it to the folder"
    echo ""
  else
    __zshcustom_error "invalid git url specified"
    return 1
  fi
}



