Vim
===

![Sheharyar's Vim Setup](https://i.imgur.com/I8RrJpa.png)


## Installation

Use Homebrew to upgrade `vim` as backup and `neovim` for main use:

```bash
brew install neovim
brew install vim
```


## Configuration

Once everything is installed, symlink vim configs:

```bash
# Main Neovim Setup
ln -s ~/.dotfiles/Vim ~/.config/nvim

# Core Vim configs for Vi/Vim and other Vim-based editors and plugins
ln -s ~/.dotfiles/Vim/core.vim ~/.vimrc

# Create directories used for swap, backup, etc.
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backups
```


## Install Plugins

I use [Packer](https://github.com/wbthomason/packer.nvim) for plugin management.

1. Start vim to automatically bootstrap Packer, and restart
2. Run `:PackerSync` to install all plugins


#### Language Server

[Elixir-LS](https://github.com/elixir-lsp/elixir-ls#building-and-running) and some other language servers require manual setup:

```
mkdir -p ~/.tools
git clone git@github.com:elixir-lsp/elixir-ls.git ~/.tools/elixir-ls
cd ~/.tools/elixir-ls
mix deps.get && mix compile
mix elixir_ls.release -o release
```



## Check Health

At this point, run `:checkhealth` to make sure required dependencies are installed and Vim is working correctly.

```bash
# Various language modules that usually need to be installed
pip3 install neovim
npm install -g neovim
```
