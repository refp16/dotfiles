"------------------------- Miscellaneous -------------------------------------

set title "show complete file path at the top of the window
set nu "set line numbering on
"set wrap
set hlsearch
set lines=50 columns=84 "set size of window
set colorcolumn=80 "set visible margin at 80th column
set scrolloff=999 "set cursor to always be at the middle of the window

"Copy and paste command mappings
"nmap <C-V> "+gP                     "paste for normal mode"
"imap <C-V> <ESC><C-V>a              "paste for insert mode
"vmap <C-C> "+y                      "copy for view mode

" Cycling through buffers mapping
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"------------------------ Syntax highlighting --------------------------------

syntax on "set syntax highlighting on

" Set background depending on whether using gvim or terminal
if has('gui_running')
  set background=light
else
  set background=dark" 
endif

" Use specific color schemes depending on file type. From
" http://stackoverflow.com/questions/15153381/why-is-my-vim-colorscheme-changing-when-i-change-buffers/15153602#15153602"
" The file types (ft) are those shown by Vim when executing :set filetype?
:autocmd BufEnter,FileType *
\   if &ft ==# 'ruby' || &ft ==# 'markdown' | colorscheme solarized |
\   elseif &ft ==? 'stata' | colorscheme codeschool |
\   else | colorscheme default |
\   endif


"--------------------- (Un)commenting blocks of code -------------------------

" Works in normal and visual mode
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '

" comment
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>

" uncomment
noremap <silent> ,uc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


"------------------- Vundle, a bundle (plugin) manager -----------------------

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
 Bundle 'tpope/vim-markdown'
 Bundle 'bling/vim-airline'
 Bundle 'bling/vim-bufferline'
 Bundle 'scrooloose/nerdtree'
 Bundle 'vim-scripts/WhatsMissing.vim'
 Bundle 'vim-scripts/TaskList.vim'
 Bundle 'tpope/vim-markdown'
 Bundle 'vim-scripts/CSApprox'

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
