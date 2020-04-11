
" Load my Vim-Plug Plugins

let g:path_vim_plug_root = expand("~/.vim/plugged")

call plug#begin(path_vim_plug_root)

  " Powerline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


  " Project Tree & File Lookup
  Plug 'scrooloose/nerdtree'                  " Project tree sidebar
  Plug 'jistr/vim-nerdtree-tabs'              " Keep NERD same across multiple tabs
  Plug '/usr/local/opt/fzf'                   " FZF fuzzy finder
  Plug 'junegunn/fzf.vim'                     " FZF vim wrapper


  " Denite
  if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/denite.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif


  " Completion (using Deoplete)
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif


  " Deoplete Language Packs
  Plug 'slashmili/alchemist.vim'              " Elixir
  Plug 'carlitux/deoplete-ternjs'             " Javascript
  Plug 'Shougo/neco-vim'                      " VimL
  Plug 'deoplete-plugins/deoplete-zsh'        " Zsh
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
                                              " Typescript


  " Syntax + Linting + Highlightinh
  Plug 'dense-analysis/ale'
  Plug 'sheerun/vim-polyglot'                 " Language packs (Syntax, etc.)
  Plug 'alvan/vim-closetag'                   " Auto-close xhtml tags


  " UI + Start Screen
  Plug 'Yggdroot/indentLine'                  " Show indent lines
  Plug 'mhinz/vim-startify'                   " Custom Start Screen for Vim


  " Git
  Plug 'tpope/vim-fugitive'                   " Git Tools for Vim
  Plug 'airblade/vim-gitgutter'               " Show git changes in gutter
  Plug 'Xuyuanp/nerdtree-git-plugin'          " Show changed files in NERDTree
  Plug 'ruanyl/vim-gh-line'                   " Github blob/blame link shortcuts


  " Features
  Plug 'tpope/vim-surround'                   " Surround Features (Brackets, Quotes, Tags)
  Plug 'scrooloose/nerdcommenter'             " Comment Management
  " Plug 'terryma/vim-multiple-cursors'         " Edit multiple lines at once


  " Others
  Plug 'tpope/vim-repeat'                     " Dot Repeat enabler for plugins
  Plug 'wakatime/vim-wakatime'                " Wakatime plugin
  Plug 'vim-scripts/BufOnly.vim'              " Delete all buffers except the open one

  " Color Schemes
  Plug 'kaicataldo/material.vim', {'commit': '5aabe47'}
  Plug 'sonph/onehalf'
  Plug 'rakr/vim-one'
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'romainl/Apprentice'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'brendonrapp/smyck-vim'

call plug#end()
