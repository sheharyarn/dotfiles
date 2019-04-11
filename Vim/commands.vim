
" Custom Vim Theme Commands
" -------------------------


" Material Theme
command PsyThemeMaterial
  \ colorscheme material
  \ | AirlineTheme material
  \ | let g:material_theme_style = 'default'
  \ | hi VertSplit guibg=#2c3a41 guifg=#2c3a41
  \ | set background=dark


" Smyck Theme
command PsyThemeSmyck
  \ colorscheme smyck
  \ | AirlineTheme minimalist
  \ | hi VertSplit guifg=#424242 guibg=#424242
  \ | set background=dark

