" VUNDLE SETTINGS
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'bling/vim-bufferline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wfxr/minimap.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

filetype plugin indent on    " required
" bufferline
let g:bufferline_rotate = 0
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
set tabstop=2
set shiftwidth=2
set statusline=[%f]\ [%3l:%3L]\ [%Y]\ %m
set hlsearch
set listchars=tab:\ \ ┊
set list

"    \ let &statusline='%{bufferline#refresh_status()}[%F] [%3l:%3L] [%Y]  <|> '
"let g:bufferline_echo = 0
"  autocmd VimEnter *
"    \ let &statusline='[%3l:%3L] [%Y]  <|> %-.20{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()

" custom macros
"nnoremap ,i :set number<CR>:term<CR><c-w>j:resize 35<CR>:NERDTree<CR><c-w>l<c-w>j
nnoremap ,i :set number<CR>:NERDTree<CR><c-w><c-w>:Minimap<CR>
"nnoremap ,l <c-w><c-w>:q<CR>exit<CR>
nnoremap ,l <c-w><c-w><c-w><c-w>:q<CR>:MinimapClose<CR>
nnoremap ,v ggVG"*y
autocmd BufWritePre * :%s/\s\+$//e

" filetype dependent
autocmd FileType cpp          nnoremap <buffer> ,c :!g++-12 % -O2 -Wall -lm<CR>
autocmd FileType cpp          nnoremap <buffer> ,r :!./a.out<CR>
autocmd FileType cpp          set listchars=tab:\ \ ┊
autocmd FileType cpp          set list
autocmd FileType cpp          set tabstop=2
autocmd FileType cpp          set shiftwidth=2
autocmd FileType python       nnoremap <buffer> ,r :!python3 %<CR>

" COC
