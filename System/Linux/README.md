Linux
=====

> Linux-specific system scripts

## Ubuntu Setup script

__IMPORTANT:__ Make sure you've set up your SSH Keys first!

To set up basic tools and apps on a fresh Ubuntu installation, run this:

```bash
bash -c "$(curl -fsSL https://raw.github.com/sheharyarn/dotfiles/master/System/Linux/ubuntu-setup.sh)"
```

This sets up:

 - Zsh and Oh-My-Zsh
 - My Zsh configurations
 - Git and Git configurations
 - Trash-cli
 - Firefox Developer Edition
 - Vim and gVim (with Python Support)
 - Ubuntu Workspaces
 - Dotfiles directory in home


You still need to set up and configure the rest of the dotfiles and apps manually.

