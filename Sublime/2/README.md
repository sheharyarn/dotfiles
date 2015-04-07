Sublime Text 2 
==============

Once you've sourced Sublime Aliases and Installed Package Control manually, do this:

```bash
$ cdst2
$ cd Packages/User
$ del "Package Control.sublime-settings" "Preferences.sublime-settings" 
$ ln -s "~/.dotfiles/Sublime/2/PackageControl.sublime-settings.symlink" "Package Control.sublime-settings"
$ ln -s "~/.dotfiles/Sublime/2/Preferences.sublime-settings.symlink" "Preferences.sublime-settings"
$ ln -s "~/.dotfiles/Sublime/2/sftp_servers" "sftp_servers"
```

