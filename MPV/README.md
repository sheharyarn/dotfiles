
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

To make it run automatically as a background process, symlink the plist:

```bash
ln -s ~/.dotfiles/MPV/jellyfin-mpv-shim.plist ~/Library/LaunchAgents
```

You can then enable or disable it:

```bash
# Enable
launchctl load -w ~/Library/LaunchAgents/jellyfin-mpv-shim.plist

# Disable
launchctl unload -w ~/Library/LaunchAgents/jellyfin-mpv-shim.plist
```
