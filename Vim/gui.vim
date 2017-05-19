
" Sheharyar's MacVim / gVim Configs
" #################################


set lines=42 columns=140                      " Set inital window size
set nowrap                                    " Don't wrap lines on gvim


if spacevim_running                           " ## SpaceVim GUI Settings
  " Handle SpaceVim GUI in spacevim.vim
  set guifont=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete:h12

else                                          " ## Non-SpaceVim Settings
  colorscheme apprentice                      " Use custom colorscheme
  set nocursorline                            " Don't highlight current line in gvim

  if has("gui_macvim")                        " #### MacVim Specific Settings
    set nofu                                  " Don't start MacVim in Fullscreen Mode
    set guifont=Menlo\ for\ Powerline:h13

  else                                        " #### Other gVim Settings
    set clipboard=unnamedplus                 " Use '+' register for clipboard

    set guioptions-=m                         " Remove Menu bar
    set guioptions-=T                         " Remove Toolbar
    set guioptions+=L                         " Show left-hand and
    set guioptions+=r                         " right-hand scroll bars

    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
  endif
endif
