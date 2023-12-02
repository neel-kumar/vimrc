filetype off                  " required

call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-bufferline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify', {'branch': 'center'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/DoxygenToolkit.vim'
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
set termguicolors
colorscheme zenburn
hi Normal guibg=NONE ctermbg=NONE
set autoindent
set laststatus=2
set ttimeout ttimeoutlen=50
set tabstop=4
set shiftwidth=4
set statusline=[%F]\ [%3l:%3L]\ [%Y]\ %m
set hlsearch
"set listchars=tab:\ \ ┊
"set list
set ttymouse=sgr
syn match cType "\<[a-zA-Z_][a-zA-Z0-9_]*_[ft]\>"

set number
highlight LineNr ctermfg=grey
let mapleader = "," " map leader to comma

"    \ let &statusline='%{bufferline#refresh_status()}[%F] [%3l:%3L] [%Y]  <|> '
"let g:bufferline_echo = 0
"  autocmd VimEnter *
"    \ let &statusline='[%3l:%3L] [%Y]  <|> %-.20{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()


" custom macros
"nnoremap <leader>i :set number<CR>:term<CR><c-w>j:resize 35<CR>:NERDTree<CR><c-w>l<c-w>j
nmap <leader>t :!echo %; cat % \| grep -v cerr \| pbcopy <CR>
nmap <leader>e :e .<CR>
nmap <leader>d :Dox<CR>
autocmd BufWritePre * :%s/\s\+$//e
nmap <leader>e :e .<CR>
map j gj
map k gk
nmap <leader>i :vs<CR><c-w>l:n o.txt<CR><c-w>h60<c-w>><c-w>l:sp in.txt<CR><c-w>h

" filetype dependent
autocmd FileType cpp          nnoremap <buffer> <leader>c :!g++-13 % -O2 -Wall -lm; echo -e "\033[1;31m"<CR>
autocmd FileType cpp          nnoremap <buffer> <leader>r :!echo -e "\033[1;32m"; ./a.out < in.txt<CR>
autocmd FileType python       nnoremap <buffer> <leader>r :!python3 %<CR>
autocmd FileType javascript   nnoremap <buffer> <leader>r :!node %<CR>
autocmd FileType java         nnoremap <buffer> <leader>r :!java %<CR>
autocmd FileType java         nnoremap <buffer> <leader>c :!javac %<CR>
autocmd FileType java         nnoremap <buffer> <leader>c :!javac %<CR>
autocmd FileType vue         nnoremap <buffer> <leader>r :!npm run dev<CR>

" STARTUP SCREEN???
" goal: list *temp.* files in directory
call system(': > ./.temps')
call system('ls *temp.* > ./.temps')
let s:lines = readfile(glob('./.temps'))
let s:lines_startify = [{'V': glob('~/.vimrc')}]
let cnt = 65
for i in s:lines
    call add(s:lines_startify, {toupper(nr2char(cnt)): i})
    let cnt = cnt+1
endfor

let g:startify_bookmarks = s:lines_startify
let g:startify_lists = [{'type': 'bookmarks', 'header': [' ===> TEMPLATES:']}]
let s:header_list = readfile(glob('~/.header.txt'))
let g:startify_custom_header =
      \ startify#center(s:header_list)
