
" Sheharyar's SpaceVim configuration
" ##################################


" Initial Settings
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 0



" Load Layers
" -----------

call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('tools#screensaver')

call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#javascript')



" Configure SpaceVim
" ------------------

if has("gui_running")                         " Different Colorschemes for GUI / Terminal
  let g:spacevim_colorscheme = 'onedark'      "'gruvbox'
else
  let g:spacevim_colorscheme = 'one-dark'
  let g:spacevim_enable_guicolors = 0
endif


let g:deoplete#auto_complete_delay = 150

let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1

let g:spacevim_error_symbol = 'x'
let g:spacevim_warning_symbol = '!'
let g:spacevim_statusline_separator = 'arrow'

let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
let g:spacevim_buffer_index_type = 3
let g:spacevim_filemanager = 'NerdTree'
let g:spacevim_disabled_plugins = []
let g:spacevim_custom_plugins = [['jistr/vim-nerdtree-tabs']]


if has('python3')
  let g:ctrlp_map = ''
  nnoremap <silent> <C-p> :Denite file_rec<CR>
endif


