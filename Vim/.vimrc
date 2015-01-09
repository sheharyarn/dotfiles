" sheharyar's .vimrc
" ------------------


" Load Vundle Plugins
"
filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'airblade/vim-gitgutter'
call vundle#end()


" General
"
filetype plugin indent on
syntax on
set history=100 		" command line history
set autoread 			" reload files (no local changes only)


" UI
"
set ruler 			" show the cursor position all the time
set noshowcmd 			" don't display incomplete commands
set nostartofline 		" don't jump to the start of line when scrolling
set report=0 			" tell us about changes
set number 			" line numbers


" Highlights
"
hi SignColumn ctermbg=none
hi LineNr     ctermbg=none ctermfg=darkgray
