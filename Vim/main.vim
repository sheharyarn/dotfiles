
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




" Load Custom Plugin Manager
" --------------------------

set nocompatible

if filereadable(path_vim_plug)
  execute 'source' path_vim_plug

elseif filereadable(path_vim_dein)
  execute 'source' path_vim_dein

elseif filereadable(path_vim_vundle)
  execute 'source' path_vim_vundle
endif


" Load Custom Commands
" --------------------

execute 'source' path_vim_commands





nmap <Leader>t :NERDTreeFind<CR>
                                                " Show current file in NERDTree
nmap <Leader>r :NERDTreeRefreshRoot<CR>
                                                " Refresh NERDTree cache


set ttimeoutlen=50                              " recommended by airline
set laststatus=2                                " needed for airline to be visible

set updatetime=500                              " Time before vim writes to swap and changes
                                                " like gitgutter are visible

" UI
" --

                                                " but don't show them by default


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
nnoremap <Leader>e :ALEDetail<cr>
                                                " Manually fix file with \f and show
                                                " error details \e
nnoremap <Leader>w :ALENextWrap<cr>
nnoremap <Leader>W :ALEPreviousWrap<cr>
                                                " Map \w and \W to go to the next or
                                                " previous error




" Deoplete
" --------

let g:deoplete#enable_at_startup  = 1
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

map <Leader>\| :NERDTreeTabsToggle<CR>
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

let g:gh_open_command = 'fn() { echo "$@" | tr -d "\n" | pbcopy; }; fn '
                                                " Copy the links instead of opening them




" Content Writing
" ---------------

" vim
set nospell                                     " Disable spell-checking by default
set spelllang=en                                " Specify spellcheck language and file
set spellfile=$HOME/.dotfiles/Vim/spell/en.utf-8.add


" vim-pencil
let g:pencil#wrapModeDefault = 'hard'           " Use Hard wrap
let g:pencil#textwidth = 90                     " Wrap at this column width
let g:pencil#autoformat = 1                     " Auto format as you type
let g:airline_section_x = '%{PencilMode()}'     " Show Pencil mode in Airline


" goyo.vim
let g:goyo_width = 95




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






" Other
" -----
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


