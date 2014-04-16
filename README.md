sheharyarn's dotfiles
=====================

Inspired by [Ryan Bates's](https://github.com/ryanb/dotfiles) and [Zach Holfman's](https://github.com/holman/dotfiles) Dotfiles. For more information check out [Github Does Dotfiles](http://dotfiles.github.io/) and [Dotfiles are meant to be Forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

# To Install:

```
git clone https://github.com/sheharyarn/dotfiles ~/.dotfiles

echo "source ~/.dotfiles/Bash/bash_profile" >> ~/.bash_profile

ln -s ~/.dotfiles/Ruby/irbrc ~/.irbrc 
ln -s ~/.dotfiles/Ruby/gemrc ~/.gemrc 
```

# To Uninstall:

Remove the 'source' line from your bash_profile, and unlink the files

```
unlink ~/.irbrc
unlink ~/.gemrc

rm -rf ~/.dotfiles
```