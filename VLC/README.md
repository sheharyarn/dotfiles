
VLC
===

> My first love


## vlcrc

For OSX:

```bash
ln -s ~/.dotfiles/Others/VLC/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc
```

For others, [see this](http://superuser.com/a/599305/214953).


### Important Note

When updating preferences, VLC doesn't modify the existing `vlcrc`, instead it deletes the last and creates a new one. So our symlinked `vlcrc` is of no use. You'll have to manually move the updates preferences config to your dotfiles:

```bash
mv -v ~/Library/Preferences/org.videolan.vlc/vlcrc ~/.dotfiles/Others/VLC/vlcrc
ln -s ~/.dotfiles/Others/VLC/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc
```

I'm trying to come up with a better solution, but for now you'll have to make do with this.


