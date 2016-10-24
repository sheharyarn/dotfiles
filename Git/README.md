
Git
===

## Installation

Make sure to install the latest git release:

```bash
$ brew install git
```

## Configuration

Load up my git configuration. It includes user.name and user.email defaults, my default global
`.gitignore` file and a few push settings:

```bash
$ ln -s ~/.dotfiles/Git/.gitconfig.global ~/.gitconfig
```

You should enter your own name and email:

```bash
git config --global user.name  "Your Name"
git config --global user.email "your@email.address"
```

Checkout [`joe`](https://github.com/karan/joe) to generate your code/platform specific `.gitignore` files.


### Aliases and Functions

If you're using my dotfiles (including my .zshrc), these will get automatically loaded, or you can load them manually by putting this in your shell-rc file:


```bash
source ~/.dotfiles/Git/aliases.sh
source ~/.dotfiles/Git/functions.sh
```

