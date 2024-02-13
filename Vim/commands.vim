" Custom Vim Commands
" ###################
"
" Reference:
" http://andrewradev.com/2011/08/06/making-vim-pretty-with-custom-colors/




" HELPERS
" -------

" Ignore accidental upcase when quitting/writing
command W w
command Q q

" Create directory for opened file
command Mkdir !mkdir -p %:p:h

" Copy relative and absolute file paths
command FilePath     !ls %   | tr -d '\n' | pbcopy
command FilePathFull !ls %:p | tr -d '\n' | pbcopy

" Replace buffer with formatted json
command FormatJSON %!jq .

" Mass Search current word
command RgWord norm :noh<CR>yiw*:Rg <C-R>"<CR>

" Enable/Disable Writing tools
command WriteMode    set spell   | Goyo  | Limelight  | Pencil
command WriteModeOff set nospell | Goyo! | Limelight! | NoPencil

" Update Plugins
command UpdatePlugins
  \ PlugUpdate | PlugSnapshot! ~/.dotfiles/Vim/plugin-tools/plug.snapshot




" THEMES
" ------

" Highlight Extra Whitespace
command PsyHighlightWhitespace
  \ hi ExtraWhitespace ctermbg=darkred guibg=darkred
  \ | match ExtraWhitespace /\s\+$\| \+\ze\t/


" Default Dark/Light Theme
command ThemeDark  lua Psy.Themes.dark()
command ThemeLight lua Psy.Themes.light()

