
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
  call dein#add('Yggdroot/indentLine')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')


  " Nerd Plugins
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('Xuyuanp/nerdtree-git-plugin')


  " Features
  call dein#add('tpope/vim-surround')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('terryma/vim-multiple-cursors')


  " Others
  call dein#add('wakatime/vim-wakatime')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-repeat')
  call dein#add('mhinz/vim-startify')


  " Vim vs NeoVim
  if has("nvim")
    call dein#add('Shougo/deoplete.vim')
  else
    call dein#add('Shougo/neocomplete.vim')
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

