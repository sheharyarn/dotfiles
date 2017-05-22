
" Load my Dein plugins

let g:path_dein_root   = expand("~/.vim/dein")
let g:path_dein_script = expand("~/.vim/dein/repos/github.com/Shougo/dein.vim")

set nocompatible
exe 'set runtimepath+=' . path_dein_script


if dein#load_state(path_dein_root)
  call dein#begin(path_dein_root)

  " Let dein manage dein
  call dein#add(path_dein_root)


  " UI Plugins
  call dein#add('Yggdroot/indentLine')                  " Show indent lines
  call dein#add('airblade/vim-gitgutter')               " Show git changes in gutter
  call dein#add('vim-airline/vim-airline')              " Sexy status line
  call dein#add('vim-airline/vim-airline-themes')       " Sexy status line themes


  " Nerd Plugins
  call dein#add('scrooloose/nerdtree')                  " Project tree sidebar
  call dein#add('scrooloose/nerdcommenter')             " Comment Management
  call dein#add('jistr/vim-nerdtree-tabs')              " Keep NERD same across multiple tabs
  call dein#add('Xuyuanp/nerdtree-git-plugin')          " Show changed files in NERDTree


  " Features
  call dein#add('tpope/vim-surround')                   " Surround Features (Brackets, Quotes, Tags)
  call dein#add('ctrlpvim/ctrlp.vim')                   " Fuzzy finder for projects
  call dein#add('terryma/vim-multiple-cursors')         " Edit multiple lines at once
  call dein#add('sheerun/vim-polyglot')                 " Language packs (Syntax, etc.)


  " Others
  call dein#add('wakatime/vim-wakatime')                " Wakatime plugin
  call dein#add('tpope/vim-fugitive')                   " Git Tools for Vim
  call dein#add('tpope/vim-repeat')                     " Dot Repeat enabler for plugins
  call dein#add('mhinz/vim-startify')                   " Custom Start Screen for Vim


  " Vim vs NeoVim
  if has('nvim')
    call dein#add('Shougo/deoplete.nvim')               " Dark Completion Plugin (Neovim only)
  else
    call dein#add('Shougo/neocomplete.vim')             " Fast Completion Plugin
  endif


  " Color Schemes
  call dein#add('rakr/vim-one')
  call dein#add('morhetz/gruvbox')
  call dein#add('joshdick/onedark.vim')
  call dein#add('romainl/Apprentice')
  call dein#add('KeitaNakamura/neodark.vim')


  " Finally save dein settings
  call dein#end()
  call dein#save_state()
endif


" Install uninstalled plugins on startup
if dein#check_install()
  call dein#install()
endif

