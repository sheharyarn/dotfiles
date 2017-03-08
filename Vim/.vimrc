#!/usr/bin/vim

" sheharyar's .vimrc
" ##################


" Load my Vundle Plugins from my vundles.vim
"
if filereadable(expand("~/.dotfiles/Vim/vundles.vim"))
    source ~/.dotfiles/Vim/vundles.vim
endif




" General Settings
" ----------------

filetype plugin indent on
syntax on
set history=100                                 " command line history
set autoread                                    " reload files (no local changes only)




" Important Key Maps
" ------------------

let mapleader = '\'                             " Use backslash as the leader key

map <Enter>   o<ESC>
map <S-Enter> O<ESC>
                                                " Use Enter & Shift+Enter to create empty
                                                " lines above and below
vnoremap . :norm.<CR>
                                                " enable use of . in visual mode
nnoremap da 0D
                                                " Clear line without deleting it
inoremap <Leader>p <ESC>pa
                                                " Paste items in Insert mode

nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>
                                                " Refresh NerdTree and CtrlP caches

noremap  ,,, <ESC>:noh<cr>
noremap  ,,  <ESC>
inoremap ,,  <ESC>
inoremap jj  <ESC>
"inoremap <ESC> <NOP>
                                                " disable (avoid) ESC key and use alternate
                                                " sequences instead

noremap <C-a> gg0vG$
imap    <C-a> <ESC><C-a>
                                                " Replicate Select-All with Ctrl+A

noremap <Leader>W :w !sudo tee % > /dev/null
                                                " Write file using sudo by Leader + W

"noremap  <C-S-x> "+c
"noremap  <C-S-c> "+y
"noremap  <C-S-v> "+gP
"inoremap <C-S-v> <C-r><C-o>+
                                                "" Cut/Copy/Paste from clipboard using
                                                "" Ctrl+Shift and x/c/v




" UI
" --

set ruler                                       " show the cursor position all the time
set noshowcmd                                   " don't display incomplete commands
set cursorline                                  " underline the line i'm currently on
set nostartofline                               " don't jump to the start of line when scrolling
set report=0                                    " tell us about changes
set number                                      " line numbers
set ttimeoutlen=50                              " recommended by airline
set laststatus=2                                " needed for airline to be visible
set ignorecase                                  " ignore case when searching
set t_Co=256                                    " set terminal color mode to 256

let g:airline_theme           = 'bubblegum'     " Set my theme for Airline
let g:airline_powerline_fonts = 1               " Use the sexy fonts used in Powerline
let g:gitgutter_realtime      = 1               " Set Gitgutter to realtime
let g:gitgutter_eager         = 1               " and eager

hi SignColumn ctermbg=none
hi LineNr     ctermbg=none ctermfg=darkgray
                                                " Make Gitgutter Transparent and
                                                " Do the same for Line Number columns

set hlsearch
nnoremap <esc><esc> :noh<return>
                                                " Enable search highlights and
                                                " press ESC twice to clear


hi ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$\| \+\ze\t/

au ColorScheme * hi ExtraWhitespace ctermbg=darkred guibg=darkred
au BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/

                                                " Find trailing & before-tab spaces and
                                                " highlight them dark red - then do the
                                                " same for each buffer and colorscheme
                                                " in gui / macvim




" Syntastic
" ---------

set statusline+=%#warningmsg#                   " Recommended Syntastic Configurations
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0




" Netrw / NerdTree
" ----------------

let g:netrw_liststyle         = 3               " Use Tree-View mode in netrw
let NERDTreeShowHidden        = 1               " Show Hidden files in NerdTree

command E Ex                                    " Use :E instead of :Ex
map <C-t> :NERDTreeTabsToggle<CR>

                                                " Toggle NertTree (On all Tabs)




" Vim-Multiple-Cursors
" --------------------

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
                                                " Don't exit multi-cursor mode if
                                                " ESC pressed in insert/visual mode




" CtrlP.vim
" ---------

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
                                                " Show everything but files in .gitignore




" CloseTag
" --------

let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsx,*.es6"
                                                " Automatically close html tags in these files




" Splits and Tabs
" ---------------

set splitbelow                                  " Open Splits to the bottom
set splitright                                  " and right sides

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
                                                " Remap ctrl+direction to
                                                " move between splits

noremap  <Leader>= :tabnew<CR>
noremap  <Leader>[ :tabprev<CR>
noremap  <Leader>] :tabnext<CR>
inoremap <Leader>[ <ESC>:tabprev<CR>a
inoremap <Leader>] <ESC>:tabnext<CR>a
                                                " Create a new tab using Leader + =
                                                " and move between them using [ / ]

noremap <A-Left>  :-tabmove<cr>
noremap <A-Right> :+tabmove<cr>
                                                " Relocate tab position to the left
                                                " or right



" Text Formatting
" ---------------

set autoindent                                  " automatic indent new lines
set smartindent                                 " be smart about it
set tabstop=2                                   " 4 is awesome
set shiftwidth=2                                " for automatic indents
set expandtab                                   " expand tabs to spaces


vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv
                                                " Indent using Tab in visual
                                                " mode and stay in mode




" Fix Clipboard paste on OSX
" --------------------------

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
" -------

set nobackup                                    " do not keep backups after close
set backupdir=$HOME/.vim/backups                " store backups under ~/.vim/backup
set backupcopy=yes                              " keep attributes of original file
set directory=~/.vim/swap,~/tmp,.               " keep swp files under ~/.vim/swap
                                                " make sure that `swap` and `backups` dirs exist in ~/.vim




" Other
" -----

set backspace=indent,eol,start                  " Fix `Delete Key` issue on OSX with Vim 7.4+
set scrolloff=8                                 " Start scrolling when we're 8 lines away from margins
set wrap lbr                                    " Wrap lines without breaking words
let g:jsx_ext_required = 0                      " Allow JSX in normal JS files




" Vim vs. Macvim vs. gVim
" -----------------------

if has("gui_running")                           " ## GUI-Based Vim Settings
    colorscheme apprentice                      " Use custom colorscheme

    set lines=34 columns=110                    " Set inital window size
    set nocursorline                            " Don't highlight current line in gvim
    set nowrap                                  " Don't wrap lines on gvim


    if has("gui_macvim")                        " ## MacVim Specific Settings
      set fu                                    " Start MacVim in Fullscreen Mode
      set guifont=Menlo\ for\ Powerline:h13     " Use the Menlo Powerline Font

    else                                        " ## Other gVim Settings
      set clipboard=unnamedplus                 " Use '+' register for clipboard

      set guioptions-=m                         " Remove Menu bar
      set guioptions-=T                         " Remove Toolbar
      set guioptions+=L                         " Show left-hand and
      set guioptions+=r                         " right-hand scroll bars

      set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
    endif

else                                            " ## Non-GUI Vim
    set wrap                                    " Wrap lines on terminal vim
endif

