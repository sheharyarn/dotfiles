VIM - [sheharyar's dotfiles](https://github.com/sheharyarn/dotfiles)
====================================================================

![Vim Configuration Screenshot](http://i.imgur.com/WSkHxAz.png)

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

4. If you are using `vim-airline`, it's better if you use [Powerline Patched Fonts](https://github.com/powerline/fonts/) for your terminal theme since they look so much better. I've placed some OSX Terminal Themes with the Patched Fonts [here](https://github.com/sheharyarn/dotfiles/tree/master/OSX/Terminal).

5. If you don't find your desired font patched with the Powerline Icons, [you'll have to patch it manually](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher).




