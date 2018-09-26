Node.js
=======

> Use ~[NVM](https://github.com/creationix/nvm)~ [ASDF](https://github.com/asdf-vm/asdf) ffs!


## Installation

Follow the installation instructions in the [`asdf-nodejs`](https://github.com/asdf-vm/asdf-nodejs) README.


## Setup

Symlink the `.npmrc` dotfile:

```bash
$ ln -s ~/.dotfiles/Node.js/npmrc.symlink ~/.npmrc
```


## Node Dev Tools

Run this script once to install different npm based developer tools:

```bash
$ source ~/.dotfiles/Node.js/node-dev-tools.sh
```

## Aliases

If you're using my dotfiles (including my .zshrc), these will get automatically loaded,
or you can load them manually by putting this in your `~/.zshrc`:

```bash
source ~/.dotfiles/Node.js/aliases.sh
```

