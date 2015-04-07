Sublime Text 2 
==============

Once you've sourced Sublime Aliases and Installed Package Control manually, do this:

```bash
$ cdst2
$ cd Packages/User
$ del "Package Control.sublime-settings" "Preferences.sublime-settings" 
$ ln -s "$HOME/.dotfiles/Sublime/2/PackageControl.sublime-settings.symlink" "Package Control.sublime-settings"
$ ln -s "$HOME/.dotfiles/Sublime/2/Preferences.sublime-settings.symlink" "Preferences.sublime-settings"
$ ln -s "$HOME/.dotfiles/Sublime/2/sftp_servers" "sftp_servers"
```

Open Sublime, if it isn't open already. Press `⌘+Shift+P` and select 'Package Control: Updgrade all Packages'. Now restart sublime.
