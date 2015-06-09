#!/usr/bin/vim

" sheharyar's .vimrc
" ------------------


" Load my Vundle Plugins from my vundles.vim
"
if filereadable(expand("~/.dotfiles/Vim/vundles.vim"))
    source ~/.dotfiles/Vim/vundles.vim 
endif



" General
"
filetype plugin indent on
syntax on
set history=100                                 " command line history
set autoread                                    " reload files (no local changes only)


" Moving
"
" imap <silent> <Down> <C-o> gj
" imap <silent> <Up>   <C-o> gk
" nmap <silent> <Down>       gj
" nmap <silent> <Up>         gk


" UI
"
set ruler                                       " show the cursor position all the time
set noshowcmd                                   " don't display incomplete commands
set cursorline                                  " underline the line i'm currently on
set nostartofline                               " don't jump to the start of line when scrolling
set report=0                                    " tell us about changes
set number                                      " line numbers
set ttimeoutlen=50                              " recommended by airline
set laststatus=2                                " needed for airline to be visible
set ignorecase                                  " ignore case when searching

let g:airline_theme           = 'bubblegum'     " Set my theme for Airline
let g:airline_powerline_fonts = 1               " Use the sexy fonts used in Powerline
let g:gitgutter_realtime      = 1               " Set Gitgutter to realtime 
let g:gitgutter_eager         = 1               " and eager

hi SignColumn ctermbg=none                      " Make Gitgutter Transparent
hi LineNr     ctermbg=none ctermfg=darkgray     " Do the same for Line Number columns


" Netrw / NerdTree
"
let g:netrw_liststyle         = 3               " Use Tree-View mode in netrw
let NERDTreeShowHidden        = 1               " Show Hidden files in NerdTree
map <C-t> :NERDTreeToggle<CR>


" Splits
"
set splitbelow                                  " Open Splits to the bottom
set splitright                                  " and right sides

nnoremap <C-J> <C-W><C-J>                       " Remap ctrl+direction to
nnoremap <C-K> <C-W><C-K>                       " move between splits
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Text Formatting
"
set autoindent                                  " automatic indent new lines
set smartindent                                 " be smart about it
set tabstop=4                                   " 4 is awesome
set shiftwidth=4                                " for automatic indents
set expandtab                                   " expand tabs to spaces


" Fix Clipboard paste on OSX
"
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif



" Backups
"
set nobackup                                    " do not keep backups after close
set backupdir=$HOME/.vim/backups                " store backups under ~/.vim/backup
set backupcopy=yes                              " keep attributes of original file
set directory=~/.vim/swap,~/tmp,.               " keep swp files under ~/.vim/swap
                                                " make sure that `swap` and `backups` dirs exist in ~/.vim


" Other
"
set backspace=indent,eol,start                  " Fix `Delete Key` issue on OSX with Vim 7.4+
set scrolloff=8                                 " Start scrolling when we're 8 lines away from margins
set wrap lbr                                    " Wrap lines without breaking words


" Vim vs. gVim
"
if has("gui_running")                           " ## gVim Specific Settings
    colorscheme slate                           " Use the Slate colorscheme
    set guifont=Menlo\ for\ Powerline:h13       " Use the Menlo Powerline Font
    set fu                                      " Start MacVim in Fullscreen Mode
    set lines=34 columns=110                    " Set inital window size
    set nocursorline                            " Don't highlight current line in gvim
    set nowrap                                  " Don't wrap lines on gvim

else                                            " ## Non-GUI Vim
    set wrap                                    " Wrap lines on terminal vim
endif

