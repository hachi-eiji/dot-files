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

filetype plugin indent on
set imdisable
