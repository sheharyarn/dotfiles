Unraid Configs
==============

## Set Up

Make sure the following lines are added to your `/boot/config/go` file:

```bash
DOTFILES_PATH="/boot/config/dotfiles"

if [ -d "$DOTFILES_PATH" ]; then
  source "$DOTFILES_PATH/System/Unraid/boot.sh"
fi
```

