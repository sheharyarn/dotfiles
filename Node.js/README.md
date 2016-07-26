Node.js
=======

> Use [NVM](https://github.com/creationix/nvm) ffs!


## Installation

Head over to the [NVM Installation Section](https://github.com/creationix/nvm#install-script)
for the installation script.


## Setup

Symlink the `.npmrc` and `.nvmrc` dotfiles:

```bash
$ ln -s ~/.dotfiles/Node.js/npmrc.symlink ~/.npmrc
$ ln -s ~/.dotfiles/Node.js/nvmrc.symlink ~/.nvmrc
```

Finally install the latest release of node:

```bash
$ nvm install
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

