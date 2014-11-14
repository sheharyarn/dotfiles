sheharyarn's dotfiles
=====================

Inspired by [Ryan Bates'](https://github.com/ryanb/dotfiles) and [Zach Holfman's](https://github.com/holman/dotfiles) Dotfiles. For more information check out [Github Does Dotfiles](http://dotfiles.github.io/) and [Dotfiles are meant to be Forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

![Screenshot](http://i.imgur.com/b6v3e8g.png)

### To Install:

```
git clone https://github.com/sheharyarn/dotfiles ~/.dotfiles

echo "source ~/.dotfiles/Bash/bash_profile" >> ~/.bash_profile

ln -s ~/.dotfiles/Ruby/irbrc ~/.irbrc 
ln -s ~/.dotfiles/Ruby/gemrc ~/.gemrc 
```

### To Uninstall:

```
# Unlink ruby dotfiles
unlink ~/.irbrc
unlink ~/.gemrc

# Remove reference to the .bash_profile
grep -v "~/.dotfiles/Bash/bash_profile" ~/.bash_profile > bashtemp
mv bashtemp ~/.bash_profile

# Delete the dotfiles
rm -rf ~/.dotfiles
```