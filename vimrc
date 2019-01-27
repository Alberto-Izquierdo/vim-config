syntax enable
set background=dark "dark/light"
set cindent
set smartindent
set autoindent expandtab tabstop=4 shiftwidth=4
set ignorecase
"set guioptions -=m
colorscheme gruvbox
set number
execute pathogen#infect()
set guifont=Consolas:h8:cANSI
inoremap {<Enter> {<Enter>}<Esc>O
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:nmap <c-j> <c-w>j
:nmap <c-k> <c-w>k
:nmap <c-l> <c-w>l
:nmap <c-h> <c-w>h
:nmap <F3> Gvgg:pyf ~/.vim/clang-format.py<CR>
:imap <F3> <Esc>Gvgg:pyf ~/.vim/clang-format.py<CR>i
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = '*.o'
let g:ctrlp_custom_ignore = '*.obj'
" para cerrar llaves html
inoremap </ </<C-X><C-O>

nnoremap <expr> <F4> (expand('%:e')=="h") ? '<Esc>:e %:r.cpp<Enter>' : '<Esc>:e %:r.h<Enter>'

" para crear las llaves al pulsar intro, sólo activar con html
" inoremap <Enter></ <Enter><Backspace></<C-X><C-O>

set fileformats=dos
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Nerdtree plugin
"Plugin 'https://github.com/scrooloose/nerdtree'
" colorscheme bastante majo
"Plugin 'https://github.com/morhetz/gruvbox'
" syntastic: comprueba el código
"Plugin 'https://github.com/scrooloose/syntastic'
"Plugin 'https://github.com/Raimondi/delimitMate'
" YouCompleteMe: autocompletado
" Plugin 'https://github.com/Valloric/YouCompleteMe'
" base16: colorscheme
"Plugin 'https://github.com/chriskempson/base16-vim'
" top bar
"Plugin 'https://github.com/bling/vim-airline'
" Haxe plugin
"Plugin 'https://github.com/jdonaldson/vaxe'
" Ruby plugin
"Plugin 'https://github.com/vim-ruby/vim-ruby'
"Plugin 'flazz/vim-colorschemes'
" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/.vim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
