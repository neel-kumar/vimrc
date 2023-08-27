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
Plug 'mhinz/vim-startify'
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
"colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
set autoindent
set laststatus=2
set ttimeout ttimeoutlen=50
set tabstop=4
set shiftwidth=4
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
nnoremap ,l :MinimapClose<CR>:NERDTreeClose<CR>
nnoremap ,v ggVG"*y
autocmd BufWritePre * :%s/\s\+$//e

" filetype dependent
autocmd FileType cpp          nnoremap <buffer> ,c :!g++ % -O2 -Wall -lm; echo -e "\033[1;31m"<CR>
autocmd FileType cpp          nnoremap <buffer> ,r :!echo -e "\033[1;32m"; ./a.out<CR>
autocmd FileType cpp          set listchars=tab:\ \ ┊
autocmd FileType cpp          set list
autocmd FileType python       nnoremap <buffer> ,r :!python3 %<CR>
autocmd FileType javascript   nnoremap <buffer> ,r :!node %<CR>

" STARTUP SCREEN???
" goal: list *temp.* files in directory
call system(': > temps.txt')
call system('ls *temp.* > temps.txt')
let s:lines = readfile('temps.txt')
let s:lines_startify = []
let cnt = 0
for i in s:lines
	call add(s:lines_startify, {cnt: i})
	let cnt = cnt+1
endfor
let g:startify_bookmarks = s:lines_startify
let g:startify_lists = [{'type': 'bookmarks', 'header': [' ===> TEMPLATES:']}]

let s:header_list = readfile(glob('~/header.txt'))
let g:startify_custom_header = s:header_list
