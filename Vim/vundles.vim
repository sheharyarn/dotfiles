
" Load my Vundle Plugins

filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'bling/vim-airline'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'wakatime/vim-wakatime'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'kien/ctrlp.vim'
    Plugin 'Valloric/MatchTagAlways'
    Plugin 'terryma/vim-multiple-cursors'

    " Syntax Highlighting Plugins
    Plugin 'slim-template/vim-slim'
    Plugin 'kchmck/vim-coffee-script'
call vundle#end()


