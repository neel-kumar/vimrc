" VUNDLE SETTINGS
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required Plugin 'VundleVim/Vundle.vim'
"Otros plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'preservim/nerdtree'
Plugin 'valloric/youcompleteme'
call vundle#end()            " required
filetype plugin indent on    " required
"ycm config
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] }

" general settings
set wildmenu
syntax on
"set termguicolors
colorscheme iceberg
set autoindent
set laststatus=2
set ttimeout ttimeoutlen=50
set tabstop=4

"status bar
set statusline=
set statusline+=\ [ 
set statusline+=\ %F 
set statusline+=\ ][
set statusline+=\ %l
set statusline+=\:%L
set statusline+=\ ][
set statusline+=\ %Y
set statusline+=\ ]

" custom macros
nnoremap ,ide :term<CR><c-w><c-w>:resize 35<CR>:NERDTree<CR><c-w><c-w><c-w><c-w>

" filetype dependent
autocmd FileType cpp          nnoremap <buffer> ,com :!g++-12 %<CR>
autocmd FileType cpp          nnoremap <buffer> ,run :!./a.out<CR>
autocmd FileType python       nnoremap <buffer> ,run :!python3 %<CR>
