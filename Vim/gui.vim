
" Sheharyar's MacVim / gVim Configs
" #################################


set lines=42 columns=140                      " Set inital window size
set nowrap                                    " Don't wrap lines on gvim

autocmd VimEnter * NERDTreeTabsOpen
                                              " Load NerdTree (Tabs) on start
autocmd VimEnter * wincmd p
                                              " And then switch to startify


if spacevim_running                           " ## SpaceVim GUI Settings
  " Handle them in spacevim.vim

else                                          " ## Non-SpaceVim Settings
  colorscheme onedark                         " Use custom colorscheme
  set nocursorline                            " Don't highlight current line in gvim
  set showtabline=2                           " Always show tabline

  if has("gui_macvim")                        " #### MacVim Specific Settings
    set nofu                                  " Don't start MacVim in Fullscreen Mode
    set guifont=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete:h12

  else                                        " #### Other gVim Settings
    set clipboard=unnamedplus                 " Use '+' register for clipboard

    set guioptions-=m                         " Remove Menu bar
    set guioptions-=T                         " Remove Toolbar
    set guioptions+=L                         " Show left-hand and
    set guioptions+=r                         " right-hand scroll bars

    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
  endif
endif

