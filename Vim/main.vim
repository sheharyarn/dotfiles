
" Sheharyar's Vim Configs
" #######################

let g:startify_custom_header = [
  \ '',
  \ '',
  \ '        ____               _          _    __ _',
  \ '       / __ \ _____ __  __( )_____   | |  / /(_)____ ___',
  \ '      / /_/ // ___// / / /|// ___/   | | / // // __ `__ \',
  \ '     / ____/(__  )/ /_/ /  (__  )    | |/ // // / / / / /',
  \ '    /_/    /____/ \__, /  /____/     |___//_//_/ /_/ /_/',
  \ '                 /____/',
  \ '',
  \ '',
  \ "    Sheharyar's Customized Vim",
  \ '',
  \ '    Dotfiles: https://github.com/sheharyarn/dotfiles',
  \ '',
  \ '',
  \ ]


let g:path_vim_gui       = expand("~/.dotfiles/Vim/gui.vim")
let g:path_vim_dein      = expand("~/.dotfiles/Vim/dein.vim")
let g:path_vim_vundles   = expand("~/.dotfiles/Vim/vundles.vim")
let g:path_spacevim_core = expand("~/.SpaceVim/vimrc")

let g:spacevim_enabled   = 0
let g:spacevim_running   = 0




" Load SpaceVim / Custom Plugin Manager
" -------------------------------------

if filereadable(path_spacevim_core) && spacevim_enabled
  execute 'source' path_spacevim_core
  let g:spacevim_running = 1

elseif filereadable(path_vim_dein)
  execute 'source' path_vim_dein

elseif filereadable(path_vim_vundles)
  execute 'source' path_vim_vundles
endif




" General Settings
" ----------------

filetype plugin indent on
syntax enable
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
                                                " alternate ESC maps

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
set number                                      " show line numbers
set norelativenumber                            " but not in relative mode
set ttimeoutlen=50                              " recommended by airline
set laststatus=2                                " needed for airline to be visible
set ignorecase                                  " ignore case when searching
set t_Co=256                                    " set terminal color mode to 256

let g:airline_theme           = 'tomorrow'      " Set my theme for Airline
let g:airline_powerline_fonts = 1               " Use the sexy fonts used in Powerline
let g:gitgutter_realtime      = 1               " Set Gitgutter to realtime
let g:gitgutter_eager         = 1               " and eager
let g:vim_markdown_conceal    = 0               " Don't conceal markdown links

let g:airline#extensions#tabline#enabled = 1    " Enable sexy tabline

let g:indentLine_color_gui = '#465366'          " Set indent line color
let g:indentLine_fileTypeExclude = ['help', 'startify']
                                                " Don't show it on specific buffers

hi SignColumn ctermbg=none
hi LineNr     ctermbg=none ctermfg=darkgray
                                                " Make Gitgutter Transparent and
                                                " Do the same for Line Number columns

hi VertSplit ctermbg=NONE guibg=NONE
set fillchars+=vert:│
                                                " Set custom separator for vertical splits

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set nolist
                                                " Use custom characters for whitespace
                                                " but don't show them by default


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




" NeoComplete
" -----------

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
                                                " Recommended NeoComplete mapping to
                                                " smoothly go to the next line from a
                                                " completion popup




" Netrw / NerdTree
" ----------------

command E Ex                                    " Use :E instead of :Ex

let g:netrw_liststyle  = 3                      " Use Tree-View mode in netrw
let NERDTreeShowHidden = 1                      " Show Hidden files in NerdTree
let NERDTreeWinPos     = "left"                 " Always open NerdTree on the left

map <C-t> :NERDTreeTabsToggle<CR>
                                                " Toggle NerdTree (On all Tabs)




" NerdCommenter
" -------------

let g:NERDSpaceDelims     = 1                   " Add spaces after comment symbol
let g:NERDCompactSexyComs = 1                   " Compact pretty multi-line comments
let g:NERDDefaultAlign    = 'left'              " Don't indent comments like code




" Vim-Multiple-Cursors
" --------------------

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
                                                " Don't exit multi-cursor mode if
                                                " ESC pressed in insert/visual mode

function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
                                                " Don't invoke NeoComplete in
                                                " multi-cursor mode




" CtrlP.vim
" ---------

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
                                                " Show everything but files in .gitignore




" CloseTag
" --------

let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsx,*.es6,*.erb,*.eex"
                                                " Automatically close html tags in these files




" Startify
" --------

let g:startify_files_number = 5                 " No. of files to show
let g:startify_list_order = [
      \ ['', '   Recent Project Files:'],
      \ 'dir',
      \ ['', '   Recent Files:'],
      \ 'files',
      \ ['', '   Sessions:'],
      \ 'sessions',
      \ ['', '   Bookmarks:'],
      \ 'bookmarks',
\ ]
                                                " Items show in Startify




" Splits and Tabs
" ---------------

set splitbelow                                  " Open Splits to the bottom
set splitright                                  " and right sides

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


noremap  <Leader>= :tabnew<CR>
noremap  <Leader>[ :tabprev<CR>
noremap  <Leader>] :tabnext<CR>
inoremap <Leader>[ <ESC>:tabprev<CR>a
inoremap <Leader>] <ESC>:tabnext<CR>a
                                                " Create a new tab using Leader + =
                                                " and move between them using [ / ]

noremap <M-Left>  :tabmove-<cr>
noremap <M-Right> :tabmove+<cr>
                                                " Relocate tab position to left/right
                                                " using Meta (Alt) key



" Text Formatting
" ---------------

set autoindent                                  " automatic indent new lines
set smartindent                                 " be smart about it
set tabstop=2                                   " 4 is awesome
set shiftwidth=2                                " for automatic indents
set expandtab                                   " expand tabs to spaces


nmap     <Tab>   v<Tab><Esc>
nmap     <S-Tab> v<S-Tab><Esc>
vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv
                                                " Indent using Tab in visual and
                                                " normal modes




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
set scrolloff=3                                 " Start scrolling when we're 3 lines away from margins
set wrap lbr                                    " Wrap lines without breaking words
let g:jsx_ext_required = 0                      " Allow JSX in normal JS files




" Set Initial Screen
" ------------------

function! PsyVimStart() abort
  if exists(':Startify') == 2                   " If Startify is available
    if isdirectory(bufname(1))                  " and a directory was opened in Vim
      bwipeout! 1                               " then clear buffer contents and
      Startify                                  " show the startify screen
    endif
  endif
endfunction

autocmd VimEnter * call PsyVimStart()           " Call function when vim starts




" Vim vs. gVim
" ------------

if has("gui_running") || exists("neovim_dot_app")
  execute 'source' path_vim_gui
else
  set wrap                                      " Wrap lines on terminal vim
endif


