" Custom Vim Theme Commands
" -------------------------
"
" Reference:
" http://andrewradev.com/2011/08/06/making-vim-pretty-with-custom-colors/


" Material Theme
command PsyThemeMaterial
  \ colorscheme material
  \ | set background=dark
  \ | AirlineTheme material
  \ | let g:material_theme_style = 'default'
  \ | hi VertSplit guibg=#2c3a41 guifg=#2c3a41


" Smyck Theme
command PsyThemeSmyck
  \ colorscheme smyck
  \ | set background=dark
  \ | AirlineTheme minimalist
  \ | hi VertSplit guifg=#424242 guibg=#424242

