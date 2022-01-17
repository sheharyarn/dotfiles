
" CORE VIM CONFIGS
" ================

" These are the essential settings written in pure vimscript that
" should run on every vim-based editor.



" General Settings
" ----------------

filetype plugin indent on
syntax enable

set autoread                                    " Reload files (no local changes only)
set autoindent                                  " Automatically indent new lines
set smartindent                                 " Be smart about it
set tabstop=2                                   " 2 is awesome
set shiftwidth=2                                " For automatic indents
set expandtab                                   " Expand tabs to spaces
set backspace=indent,eol,start                  " Fix `Delete Key` issue on OSX with Vim 7.4+

set history=1000                                " Command line history
set shell=zsh                                   " Use Zsh for shell commands
set mouse=a                                     " Make mouse work with neovim
set foldmethod=manual                           " Manually fold parts of code



" Backups
" -------
" (Make sure that `swap` and `backups` dirs exist in ~/.vim)

set nobackup                                    " Do not keep backups after close
set backupdir=$HOME/.vim/backups                " Store backups under ~/.vim/backup
set backupcopy=yes                              " Keep attributes of original file
set directory=~/.vim/swap,~/tmp,.               " Keep swp files under ~/.vim/swap



" UI
" --

set nowrap                                      " Do not wrap lines by default
set wrap lbr                                    " If wrapping, do it without breaking words
set ruler                                       " Show the cursor position all the time
set noshowcmd                                   " Don't display incomplete commands
set cursorline                                  " Underline the line i'm currently on
set nostartofline                               " Don't jump to the start of line when scrolling
set report=0                                    " Tell us about changes
set ignorecase                                  " Ignore case when searching
set number                                      " Show line numbers
set norelativenumber                            " > but not in relative mode
set t_Co=256                                    " Set terminal color mode to 256
set background=dark                             " Set dark mode by default
set hlsearch                                    " Enable search highlights

set fillchars=eob:\                             " Hide ~ for empty lines after the file ends
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set nolist                                      " Use custom characters for whitespace

set scrolloff=3                                 " Start scrolling when we're 3 lines away from margins

set splitbelow                                  " Open Splits to the bottom
set splitright                                  " and right sides




" Important Key Maps
" ------------------

let mapleader = '\'                             " Use backslash as the leader key

vnoremap . :norm.<CR>
                                                " Clear line without deleting it
inoremap <Leader>p <ESC>pa
                                                " Paste items in Insert mode
noremap <M-a> gg0vG$
imap    <M-a> <ESC><M-a>
                                                " Replicate Select-All with ⌘ + A
nnoremap <esc><esc> :noh<return>
                                                " Press ESC twice to clear search highlights
vnoremap <M-c> "+y
                                                " Fix Clipboard copy on MacOS
                                                " (Make sure iTerm sends `⌘+C` escape code)
map <Enter>   o<ESC>
map <S-Enter> O<ESC>
                                                " Use Enter & Shift+Enter to create empty
                                                " lines above and below
nmap     <Tab>   v<Tab><Esc>
nmap     <S-Tab> v<S-Tab><Esc>
vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv
                                                " Indent using Tab in visual and
                                                " normal modes
noremap  <Leader>= :tabnew<CR>
noremap  <Leader>[ :tabprev<CR>
noremap  <Leader>] :tabnext<CR>
inoremap <Leader>[ <ESC>:tabprev<CR>a
inoremap <Leader>] <ESC>:tabnext<CR>a
                                                " Create a new tab using Leader + =
                                                " and move between them using [ / ]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <C-S-Left>  <C-H>
nmap <C-S-Down>  <C-J>
nmap <C-S-Up>    <C-K>
nmap <C-S-Right> <C-L>
                                                " Remap ctrl + direction keys to
                                                " move between splits
"nnoremap <C-S-H> <C-W><S-H>
"nnoremap <C-S-J> <C-W><S-J>
"nnoremap <C-S-K> <C-W><S-K>
"nnoremap <C-S-L> <C-W><S-L>
                                                " Use ctrl + shift + direction keys
                                                " change split positions
" function! PsyVimSetMaps() abort
"   noremap <A-Left>  :tabmove-<cr>
"   noremap <A-Right> :tabmove+<cr>
" endfunction
" autocmd VimEnter * call PsyVimSetMaps()         " Relocate tab position to left/right
"                                                 " using Meta (Alt) key


" Custom Filetypes
" ----------------

autocmd BufEnter *.slimlive :setlocal filetype=slim
                                                " Phoenix LiveView with SLIM templates

