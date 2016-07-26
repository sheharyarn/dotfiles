
Git - [sheharyar's dotfiles](https://github.com/sheharyarn/dotfiles)
====================================================================

## Installation

Make sure to install the latest git release:

```bash
$ brew install git
```

## Configuration

Set up some basic stuff:

```bash
git config --global user.name  "Sheharyar Naseer"
git config --global user.email "hello@sheharyar.me"

git config --global push.default simple
```

I also use the awesome command-line utility [`joe`](https://github.com/karan/joe) to generate `.gitignore` files for me. But for OSX and Sublime temp files that I've to add to my `.gitignore` everytime, a better option is to use a Global Gitignore:

```bash
git config --global core.excludesfile ~/.dotfiles/Git/.gitignore.global
```

