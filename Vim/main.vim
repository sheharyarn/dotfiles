
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
let g:path_vim_commands  = expand("~/.dotfiles/Vim/commands.vim")
let g:path_vim_plug      = expand("~/.dotfiles/Vim/plugin-tools/plug.vim")
let g:path_vim_dein      = expand("~/.dotfiles/Vim/plugin-tools/dein.vim")
let g:path_vim_vundle    = expand("~/.dotfiles/Vim/plugin-tools/vundle.vim")
let g:path_spacevim_core = expand("~/.SpaceVim/vimrc")

let g:spacevim_enabled   = 0
let g:spacevim_running   = 0




" Load SpaceVim / Custom Plugin Manager
" -------------------------------------

set nocompatible

if filereadable(path_spacevim_core) && spacevim_enabled
  execute 'source' path_spacevim_core
  let g:spacevim_running = 1

elseif filereadable(path_vim_plug)
  execute 'source' path_vim_plug

elseif filereadable(path_vim_dein)
  execute 'source' path_vim_dein

elseif filereadable(path_vim_vundle)
  execute 'source' path_vim_vundle
endif


" Load Custom Commands
" --------------------

execute 'source' path_vim_commands





" General Settings
" ----------------

filetype plugin indent on
syntax enable
set autoread                                    " reload files (no local changes only)
set history=1000                                " command line history
set shell=zsh                                   " Use Zsh for shell commands
set mouse=a                                     " Make mouse work with neovim




" Important Key Maps
" ------------------

let mapleader = '\'                             " Use backslash as the leader key

map <Enter>   o<ESC>
map <S-Enter> O<ESC>
                                                " Use Enter & Shift+Enter to create empty
                                                " lines above and below
vnoremap . :norm.<CR>
                                                " enable use of . in visual mode
" nnoremap daa 0D
                                                " Clear line without deleting it
inoremap <Leader>p <ESC>pa
                                                " Paste items in Insert mode

nmap <Leader>r :NERDTreeRefreshRoot<CR>
                                                " Refresh NERDTree cache

noremap <M-a> gg0vG$
imap    <M-a> <ESC><M-a>
                                                " Replicate Select-All with ⌘ + A




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
set background=dark                             " Set dark mode by default
set updatetime=500                              " Time before vim writes to swap and changes
                                                " like gitgutter are visible

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set nolist                                      " Use custom characters for whitespace
                                                " but don't show them by default

nnoremap <esc><esc> :noh<return>
set hlsearch                                    " Enable search highlights and
                                                " press ESC twice to clear

hi SignColumn ctermbg=none
hi LineNr     ctermbg=none ctermfg=darkgray
                                                " Make Gitgutter Transparent and
                                                " Do the same for Line Number columns

hi VertSplit ctermbg=NONE guibg=NONE
set fillchars+=vert:│                           " Disable existing VertSplit formatting and
                                                " use custom separator for vertical splits

autocmd VimEnter * PsyThemeMaterial             " Use my main theme on vim load
autocmd VimEnter * PsyHighlightWhitespace       " Apply red whitespace highlights when vim
autocmd ColorScheme * PsyHighlightWhitespace    " is started, the colorscheme is changed,
autocmd BufWinEnter * PsyHighlightWhitespace    " or a new buffer / window is opened




" UI Plugins
" ----------

let g:airline_powerline_fonts = 1               " Use Airline with Powerline fonts
let g:gitgutter_realtime      = 1               " Set Gitgutter to realtime
let g:gitgutter_eager         = 1               " and eager
let g:vim_markdown_conceal    = 0               " Don't conceal markdown links

let g:airline#extensions#tabline#enabled = 1    " Enable sexy tabline

let g:indentLine_color_gui = '#465366'          " Set indent line color
let g:indentLine_fileTypeExclude = ['help', 'startify', 'vim', 'markdown']
                                                " Don't show it on specific buffers




" fzf.vim
" -------

let g:fzf_layout = { 'down': '~20%' }           " Open fzf at bottom with max width of 20%
nnoremap <C-p> :Files<Cr>
                                                " Map Ctrl+P to fzf




" ALE + Linting
" -------------

let g:ale_enabled = 1
let g:airline#extensions#ale#enabled = 1        " Connect ALE to Airline
let g:ale_lint_on_text_changed = 'never'        " Don't lint while editing but
let g:ale_lint_on_save = 1                      " do it on save and
let g:ale_lint_on_enter = 1                     " when a file is opened

let g:ale_elixir_elixir_ls_release =
  \ expand('~/.elixir-ls/release')

let g:ale_linters = {
  \ 'elixir': ['elixir-ls', 'credo'],
\}

let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'elixir': ['mix_format'],
\}

nnoremap gd :ALEGoToDefinitionInVSplit<cr>
nnoremap gD :ALEGoToDefinitionInTab<cr>
                                                " Open function definition in split or
                                                " a new tab
nnoremap <Leader>f :ALEFix<cr>
nnoremap <Leader>e :ALEToggle<cr>
                                                " Manually fix file with \f and toggle
                                                " ALE with \e
nnoremap <Leader>w :ALENextWrap<cr>
nnoremap <Leader>W :ALEPreviousWrap<cr>
                                                " Map \w and \W to go to the next or
                                                " previous error




" Deoplete
" --------

let g:deoplete#enable_at_startup  = 1
let g:deoplete#enable_smart_case  = 1           " Consider case during completions
let g:deoplete#enable_auto_select = 0           " Don't autoselect first option

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
                                                " Go through completions using TAB

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
                                                " Recommended Deoplete mapping to
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




" CloseTag
" --------

let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsx,*.es6,*.erb,*.eex"
                                                " Automatically close html tags in these files




" vim-gh-line
" -----------

let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
                                                " Copy the links instead of opening them




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




" External file changes
" ---------------------

set autoread                                    " Trigger autoread on file changes

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() != 'c' | checktime | endif        " Trigger when cursor stops moving,
                                                " buffer changes or gains focus

autocmd FileChangedShellPost *
  \ echohl WarningMsg |
  \ echo 'File changed on disk. Buffer reloaded.'
  \ | echohl None                               " Notify user if auto changes




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

function! PsyVimSetMaps() abort
  noremap <A-Left>  :tabmove-<cr>
  noremap <A-Right> :tabmove+<cr>
endfunction
autocmd VimEnter * call PsyVimSetMaps()         " Relocate tab position to left/right
                                                " using Meta (Alt) key




" Text Formatting
" ---------------

set autoindent                                  " automatic indent new lines
set smartindent                                 " be smart about it
set tabstop=2                                   " 2 is awesome
set shiftwidth=2                                " for automatic indents
set expandtab                                   " expand tabs to spaces


nmap     <Tab>   v<Tab><Esc>
nmap     <S-Tab> v<S-Tab><Esc>
vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv
                                                " Indent using Tab in visual and
                                                " normal modes




" Fix Clipboard copy on OSX
" -------------------------

vnoremap <M-c> "+y
                                                " First make sure iTerm sends ⌘ C
                                                " escape code




" Fix Clipboard paste on OSX
" --------------------------

" if &term =~ "xterm.*"
"     let &t_ti = &t_ti . "\e[?2004h"
"     let &t_te = "\e[?2004l" . &t_te
"     function XTermPasteBegin(ret)
"         set pastetoggle=<Esc>[201~
"         set paste
"         return a:ret
"     endfunction
"     map <expr> <Esc>[200~ XTermPasteBegin("i")
"     imap <expr> <Esc>[200~ XTermPasteBegin("")
"     cmap <Esc>[200~ <nop>
"     cmap <Esc>[201~ <nop>
" endif




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




" Feature Specific Options
" ------------------------

if has("gui_running") || exists("neovim_dot_app")
  execute 'source' path_vim_gui
else
  set nowrap
endif


if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


if has("termguicolors")
  set termguicolors
endif


