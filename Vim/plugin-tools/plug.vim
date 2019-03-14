
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


  " Completion (using Deoplete)
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif


  " Syntax + Linting + Highlightinh
  Plug 'w0rp/ale'
  Plug 'sheerun/vim-polyglot'                 " Language packs (Syntax, etc.)
  Plug 'alvan/vim-closetag'                   " Auto-close xhtml tags


  " UI + Start Screen
  Plug 'Yggdroot/indentLine'                  " Show indent lines
  Plug 'mhinz/vim-startify'                   " Custom Start Screen for Vim


  " Git
  Plug 'tpope/vim-fugitive'                   " Git Tools for Vim
  Plug 'airblade/vim-gitgutter'               " Show git changes in gutter
  Plug 'Xuyuanp/nerdtree-git-plugin'          " Show changed files in NERDTree


  " Features
  Plug 'tpope/vim-surround'                   " Surround Features (Brackets, Quotes, Tags)
  Plug 'scrooloose/nerdcommenter'             " Comment Management
  " Plug 'terryma/vim-multiple-cursors'         " Edit multiple lines at once


  " Others
  Plug 'tpope/vim-repeat'                     " Dot Repeat enabler for plugins
  Plug 'wakatime/vim-wakatime'                " Wakatime plugin
  Plug 'vim-scripts/BufOnly.vim'              " Delete all buffers except the open one

call plug#end()
