Vim
===

![Sheharyar's Vim Setup](http://i.imgur.com/kv6O42J.jpg)

[_See all dotfiles_](https://github.com/sheharyarn/dotfiles)


## Installation

### Upgrade Vim

The default `vim` by Apple sucks balls, so we're going to upgrade to the latest Vim.
First, switch over to the system `ruby` if you're using `rvm`:

```bash
rvm use system
```

Use Homebrew to install `vim`:

```bash
brew install vim --override-system-vim
```

### Install MacVim

```bash
brew install  macvim
brew linkapps macvim
```

### Install [NeoVim](http://neovim.io/)

Let's take advantage of the Dark Features

```bash
# Install NeoVim
brew install neovim/neovim/neovim

# And the python modules (or use pip2 / pip3)
pip install neovim
```

You can also install the unofficial GUIs ([VimR](https://github.com/qvacua/vimr) /
[neovim-dot-app](https://github.com/rogual/neovim-dot-app)):

```bash
brew install rogual/neovim-dot-app/neovim-dot-app --HEAD
brew linkapps neovim-dot-app
```

### Install [SpaceVim](https://github.com/SpaceVim/SpaceVim)

Finally [install Spacevim](https://github.com/SpaceVim/SpaceVim#install) to come over to
the Dark Side :wink: :

```bash
curl -sLf https://spacevim.org/install.sh | bash -s -- -h
```

<br>


## Configuration

Once everything is installed, symlink the vim dotfiles and create the required directories:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
mkdir -p ~/.vim/swap ~/.vim/backups ~/.config/nvim ~/.SpaceVim.d/

ln -s ~/.dotfiles/Vim/.vimrc        ~/.vimrc
ln -s ~/.dotfiles/Vim/colors        ~/.vim/colors
ln -s ~/.dotfiles/Vim/spacevim.vim  ~/.SpaceVim.d/init.vim

ln -s ~/.vimrc ~/.config/nvim/init.vim
```

<br>


## Plugins

Spacevim uses its own plugin management system, but when not using it,
[Vundle](https://github.com/gmarik/Vundle.vim) is the way to go:

1. First install vundle to your `.vim` bundle:

    ```bash
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```

2. Make sure your `vimrc` dotfiles are set up

3. Install plugins using `vundle`:

    ```bash
    vim +PluginInstall +qall
    ```

<br>


### Plugins that require extra work:

 - [**Airline**](https://github.com/bling/vim-airline/)

    If you are using `vim-airline`, you need to use fonts that have been patched for powerline in your terminal. Here are a few patched fonts that I use in my OSX [Terminal Themes](https://github.com/sheharyarn/dotfiles/tree/master/OSX/Terminal):

      - [Menlo for Powerline](https://github.com/abertsch/Menlo-for-Powerline)
      - [Powerline Patched Font-Pack](https://github.com/powerline/fonts/)
      - [Nerd Patched Font-Pack](https://github.com/ryanoasis/nerd-fonts) for extra symbols

    If you don't find your desired font patched with the Powerline Icons, [you'll have to patch it manually](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher).

 - [**You Complete Me**](https://github.com/Valloric/YouCompleteMe)

    YCM requires Vim v7.3.584 or greater; [On OSX, You can do this](http://stackoverflow.com/a/14511970/1533054). It has a compiled component as well. You'll need to set it up for it to work properly. [Installation instructions found here](http://valloric.github.io/YouCompleteMe/).
