
[mpv](https://mpv.io/)
======================

> a free, open source, and cross-platform media player


## Installation

```bash
brew install mpv
brew install --cask mpv
```


## Symlink Config Files

```bash
ln -s ~/.dotfiles/MPV ~/.mpv
```


## Jellyfin Shim

To use with Jellyfin, first install the shim [from here](https://github.com/jellyfin/jellyfin-mpv-shim). Then link the config:

```bash
ln -s ~/.dotfiles/MPV ~/Library/Application\ Support/jellyfin-mpv-shim
```
