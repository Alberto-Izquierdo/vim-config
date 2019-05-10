syntax enable
set background=dark "dark/light"
set cindent
set smartindent
set autoindent expandtab tabstop=4 shiftwidth=4
set ignorecase
colorscheme gruvbox
set number
set guifont=Consolas:h8:cANSI
set relativenumber
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:nmap <c-j> <c-w>j
:nmap <c-k> <c-w>k
:nmap <c-l> <c-w>l
:nmap <c-h> <c-w>h
:nmap <F3> Gvgg:pyf ~/.vim/clang-format.py<CR>
:imap <F3> <Esc>Gvgg:pyf ~/.vim/clang-format.py<CR>i
:nmap > >>
:nmap < <<
inoremap {<Enter> {<Enter>}<Esc>O
inoremap </ </<C-X><C-O>
" Open the header/cpp of the current file
nnoremap <expr> <F4> (expand('%:e')=="h") ? '<Esc>:e %:r.cpp<Enter>' : '<Esc>:e %:r.h<Enter>'
set fileformats=dos
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = '*.o'
let g:ctrlp_custom_ignore = '*.obj'
let g:ctrlp_clear_cache_on_exit = 0

function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/.vim/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
execute pathogen#infect()
