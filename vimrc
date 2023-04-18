" VUNDLE SETTINGS
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required Plugin 'VundleVim/Vundle.vim'
" Otros plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'preservim/nerdtree'
Plugin 'bling/vim-bufferline'
Plugin 'valloric/youcompleteme'
call vundle#end()            " required
filetype plugin indent on    " required
" bufferline
let g:bufferline_rotate = 2
" ycm
"set completeopt-=preview
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] }

" general settings
set showcmd
set wildmenu
syntax on
"set termguicolors
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
set autoindent
set laststatus=2
set ttimeout ttimeoutlen=50
set tabstop=4
set shiftwidth=4
set list
set listchars=tab:\ \ ┊

" status bar +buffers
let g:bufferline_echo = 0
  autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}[%F] [%l:%L] [%Y]  <|> '
    \ .bufferline#get_status_string()

" custom macros
nnoremap ,i :set number<CR>:term<CR><c-w>j:resize 35<CR>:NERDTree<CR><c-w>l<c-w>j
nnoremap ,l <c-w><c-w>:q<CR>exit<CR>

" filetype dependent
autocmd FileType cpp          nnoremap <buffer> ,c :!g++-12 %<CR>
autocmd FileType cpp          nnoremap <buffer> ,r :!./a.out<CR>
autocmd FileType python       nnoremap <buffer> ,r :!python3 %<CR>
