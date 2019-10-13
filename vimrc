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
set rnu
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:nmap <c-j> <c-w>j
:nmap <c-k> <c-w>k
:nmap <c-l> <c-w>l
:nmap <c-h> <c-w>h
:autocmd FileType cpp nmap <F3> Gvgg:py3f ~/.vim/clang-format.py<CR>
:autocmd FileType cpp imap <F3> <Esc>Gvgg:py3f ~/.vim/clang-format.py<CR>i
:autocmd FileType json nmap <F3> :call FormatJsonOnSave()<CR>
:autocmd FileType json imap <F3> <Esc>:call FormatJsonOnSave()<CR>i
:autocmd FileType rust nmap <F3> :RustFmt<CR>
:autocmd FileType rust imap <F3> <Esc>:RustFmt<CR>i
:autocmd FileType go nmap <F3> :GoImports<CR>
:autocmd FileType go imap <F3> <Esc>:GoImports<CR>i
:nmap <F2> <C-P><C-\>w
:nmap > >>
:nmap < <<
inoremap {<Enter> {<Enter>}<Esc>O
inoremap </ </<C-X><C-O>
" Open the header/cpp of the current file
:autocmd FileType cpp nnoremap <expr> <F4> (expand('%:e')=="h") ? '<Esc>:e %:r.cpp<Enter>' : '<Esc>:e %:r.h<Enter>'
set fileformats=dos
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = '*.o'
let g:ctrlp_custom_ignore = '*.obj'
let g:ctrlp_clear_cache_on_exit = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:rustfmt_autosave = 1

let g:go_fmt_command = "goimports"

function! FormatJsonOnSave()
  %!python3 -m json.tool
endfunction
function! FormatCppOnSave()
  let l:formatdiff = 1
  py3f ~/.vim/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call FormatCppOnSave()
autocmd BufWritePre *.json call FormatJsonOnSave()
execute pathogen#infect()
