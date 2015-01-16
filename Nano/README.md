
Nano - [sheharyar's dotfiles](https://github.com/sheharyarn/dotfiles)
=====================================================================

I haven't customized my Nano much, except for enabling Syntax Highlighting. If you're on OSX, it's recommended to install Nano separately:

```bash
brew tap homebrew/dupes
brew install nano
```

### .nanorc

Nano that comes with OSX or homebrew, doesn't have support for Syntax Highlighting for many Programming Languages. That's why I make use of __[scopatz' .nanorc syntax files](https://github.com/scopatz/nanorc)__. You can add/remove files according to your requirements in `nanorc.symlink`.

To use, just symlink it with your system `.nanorc`:

```bash
rm ~/.nanorc    # delete it if it's already there
ln -s ~/.dotfiles/Nano/nanorc.symlink ~/.nanorc
```

