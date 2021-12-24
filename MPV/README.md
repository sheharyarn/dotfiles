
[mpv](https://mpv.io/)
======================

> a free, open source, and cross-platform media player

## Installation

I recommend installation using `Homebrew Cask` instead of simple `Homebrew`. See [homebrew-mpv](https://github.com/mpv-player/homebrew-mpv).

```bash
brew install caskroom/cask/brew-cask    # install cask if you don't have it
brew cask install mpv                   # install mpv .app and binary
```

## Symlink Config Files

```bash
mkdir -p ~/.config
ln -s ~/.dotfiles/Others/MPV ~/.mpv
```


