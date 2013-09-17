"trying
syntax on "set syntax highlighting on
set nu "set line numbering on
"set wrap
set hlsearch
set lines=50 columns=84 "set size of window
set colorcolumn=80 "set visible margin at 80th column
set scrolloff=999 "set cursor to always be at the middle of the window

"Copy and paste command mappings
nmap <C-V> "+gP                     "paste for normal mode"
imap <C-V> <ESC><C-V>a              "paste for insert mode
vmap <C-C> "+y                      "copy for view mode

" Cycling through buffers mapping
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" COLOR HIGHLIGHTING ======================================================
"let b:did_ftplugin = 1
"set term=ansi

" Color specifications. Change them as you would like.
" For groups used in standard language definitions

"comments 
hi Comment	term=none	ctermfg=gray	guifg=#7F8085
"stuff between double quotes (not single)
hi Constant	term=underline	ctermfg=cyan	guifg=#F608B8
" stataFunc
hi Identifier	term=underline	ctermfg=green	guifg=#F33409
"if, while, etc 
hi Statement	term=bold	ctermfg=white	guifg=#F33409
"stataCommand
hi PreProc	term=underline	ctermfg=magenta	guifg=#F33409
hi Type		term=underline	ctermfg=white	guifg=Black
hi Special	term=bold	ctermfg=blue	guifg=#2006F4
hi Nontext	term=bold	ctermfg=red	guifg=green
hi Todo         term=bold       ctermfg=Red     guifg=#2006F4
"background
hi Normal	guifg=Black	guibg=White
hi Normal	ctermfg=darkgreen

" specific groups for stata
hi stataMacro term=none	ctermfg=Black guifg=#007F7F

hi Comment      cterm=none	gui=none
hi Constant     cterm=bold	gui=none
hi Identifier   cterm=none	gui=none
hi Statement    cterm=bold	gui=none
hi PreProc      cterm=bold	gui=none
hi Type         cterm=bold	gui=none
hi Special      cterm=bold	gui=none
hi NonText	cterm=bold	gui=none

"==============================================================
" SET VUNDLE, A BUNDLE(PLUGIN) MANAGER

 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'bling/vim-airline'
 Bundle 'bling/vim-bufferline'
 Bundle 'scrooloose/nerdtree'
 Bundle 'vim-scripts/WhatsMissing.vim'
 Bundle 'vim-scripts/TaskList.vim'
 

 filetype plugin indent on     " required!

"
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
