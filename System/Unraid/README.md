Unraid Configs
==============

## Set Up - NAS

Make sure the following lines are added to your `/boot/config/go` file:

```bash
DOTFILES_PATH="/boot/config/dotfiles"

if [ -d "$DOTFILES_PATH" ]; then
  source "$DOTFILES_PATH/System/Unraid/boot.sh"
fi
```


## Set Up - Client

Symlink hidden shares:

```bash
ln -s ~/.dotfiles/System/Unraid/PsyNAS ~/PsyNAS
```
