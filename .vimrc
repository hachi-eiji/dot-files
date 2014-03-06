set nocompatible               " be iMproved
filetype off                   " required!

set number
set tabstop=2
set shiftwidth=2
set autoindent
set clipboard+=unnamed
set antialias
set backupdir=/tmp
set directory=/tmp
syntax on
set t_Co=256

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'nanotech/jellybeans.vim'
Bundle 'gmarik/vundle'
Bundle 'kana/vim-fakeclip'
Bundle 'pangloss/vim-javascript'
Bundle 'JavaScript-syntax'
Bundle 'mru.vim'
Bundle 'taglist.vim'
" markdown
Bundle 'tpope/vim-markdown'
Bundle 't9md/vim-choosewin'
Bundle 'itchyny/lightline.vim'

" if you want to use overlay feature
let g:choosewin_overlay_enable          = 1
" overlay font broke on mutibyte buffer?
let g:choosewin_overlay_clear_multibyte = 1
nmap ; <Plug>(choosewin)

if filereadable(expand('~/.vimrc.lightline'))
	  source ~/.vimrc.lightline
endif

colorscheme jellybeans

filetype plugin indent on
set imdisable
