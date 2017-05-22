
" Sheharyar's SpaceVim configuration
" ##################################


" Initial Settings
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1



" Load Layers
" -----------

call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('tools#screensaver')

call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#javascript')



" Configure SpaceVim
" ------------------

if has("gui_running")                               " Different Colorschemes for GUI / Terminal
  let g:spacevim_colorscheme = 'onedark'            "'gruvbox'
else
  let g:spacevim_colorscheme = 'one-dark'
  let g:spacevim_enable_guicolors = 0
endif


                                                    " External Plugins to use
let g:spacevim_custom_plugins = [
  \ ['jistr/vim-nerdtree-tabs'],
  \ ['vim-airline/vim-airline'],
  \ ['vim-airline/vim-airline-themes'],
  \
  \ ]


let g:spacevim_disabled_plugins = []                " SpaceVim Plugins to disable
let g:spacevim_filemanager = 'NerdTree'             " Use NERD instead of VimFiler


let g:spacevim_enable_tabline_filetype_icon = 1     " Set SpaceVim Icons / Symbols
let g:spacevim_enable_os_fileformat_icon    = 1
let g:spacevim_buffer_index_type            = 3
let g:spacevim_warning_symbol               = '!'
let g:spacevim_error_symbol                 = 'x'


if has('python3')
  let g:ctrlp_map = ''
  nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
