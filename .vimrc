filetype off                   " required!

set number
syntax on
set t_Co=256
set antialias

" tab setting
set expandtab
set tabstop=2
set shiftwidth=2

" indent
set smartindent
set autoindent
set showmatch " 対応括弧を強調
set smarttab  " 新しい行を作った時に自動インデント

" backup
set clipboard+=unnamed
set backupdir=/tmp
set directory=/tmp
set undodir=/tmp

" search
set ignorecase " 大文字小文字は区別しない
set smartcase " 検索文字列に大文字が含まれてる時は区別
set incsearch
set wrapscan

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'hachi-eiji/jellybeans.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'gmarik/vundle'
Bundle 'kana/vim-fakeclip'
Bundle 'JavaScript-syntax'
Bundle 'mru.vim'
Bundle 'taglist.vim'
" markdown
Bundle 'tpope/vim-markdown'
Bundle 't9md/vim-choosewin'
Bundle 'itchyny/lightline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
"Bundle 'Shougo/neocomplete.vim'
Bundle 'tpope/vim-endwise'
Bundle 'fatih/vim-go'
Bundle 'rizzatti/dash.vim'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/twilight'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kannokanno/previm'
Bundle 'opsplorer'

" if you want to use overlay feature
let g:choosewin_overlay_enable          = 1
" overlay font broke on mutibyte buffer?
let g:choosewin_overlay_clear_multibyte = 1
nmap ; <Plug>(choosewin)
let g:neocomplete#enable_at_startup = 1

if filereadable(expand('~/.vimrc.lightline'))
  set laststatus=2
  source ~/.vimrc.lightline
endif
if filereadable(expand('~/.vimrc.unite'))
  source ~/.vimrc.unite
endif

if filereadable(expand('~/.vimrc_js'))
  source ~/.vimrc_js
endif

let g:previm_open_cmd = 'open -a "Google Chrome"'
nnoremap <silent> gp :PrevimOpen<CR>


colorscheme jellybeans

filetype plugin indent on
set imdisable
