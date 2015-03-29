VIM - [sheharyar's dotfiles](https://github.com/sheharyarn/dotfiles)
====================================================================

![Vim Configuration Screenshot](http://i.imgur.com/WSkHxAz.png)

## Upgrade Vim

The default `vim` by Apple sucks balls, so we're going to upgrade to the latest Vim. 
First, switch over to the system `ruby` if you're using `rvm`:

```bash
rvm use system
```

Use Homebrew to install `vim`:

```bash
brew install vim --override-system-vim
```

## Setting up Plugins

I use [Vundle](https://github.com/gmarik/Vundle.vim) for Plugin Management, and I recommend that you do the same.

1. First install vundle to your `.vim` bundle:

    ```bash
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```

2. Set up your `.vimrc` or start by symlinking mine:

    ```bash
    ln -s ~/.dotfiles/Vim/.vimrc ~/.vimrc
    ```

3. Install plugins using `vundle`:

    ```bash
    vim +PluginInstall +qall
    ```

## Plugins that require extra work

#### [Airline](https://github.com/bling/vim-airline/)

If you are using `vim-airline`, it's better if you use [Powerline Patched Fonts](https://github.com/powerline/fonts/) for your terminal theme since they look so much better. I've placed some OSX Terminal Themes with the Patched Fonts [here](https://github.com/sheharyarn/dotfiles/tree/master/OSX/Terminal).

If you don't find your desired font patched with the Powerline Icons, [you'll have to patch it manually](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher).

#### [You Complete Me](https://github.com/Valloric/YouCompleteMe)

> YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim.

YCM requires Vim v7.3.584 or greater; [On OSX, You can do this](http://stackoverflow.com/a/14511970/1533054). It has a compiled component as well. You'll need to set it up for it to work properly. [Installation instructions found here](http://valloric.github.io/YouCompleteMe/).


