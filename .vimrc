filetype off                   " required!

let mapleader = ","
set number
syntax on
set t_Co=256
set antialias

" tab setting
set expandtab
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

"tag
set tags=tags

" オムニ補完のプレビューを無効にする
set completeopt=menuone

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
" pythonなどでインデントがわかりやすいようにしたい
if expand("%:t") =~ ".*\.py"
  set cursorcolumn
endif

hi clear CursorLine
highlight CursorLine ctermbg=black guibg=black

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'hachi-eiji/jellybeans.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'gmarik/vundle'
Bundle 'kana/vim-fakeclip'
Bundle 'mru.vim'
" markdown
Bundle 'tpope/vim-markdown'
Bundle 't9md/vim-choosewin'
Bundle 'itchyny/lightline.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'tpope/vim-endwise'
Bundle 'rizzatti/dash.vim'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/twilight'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kannokanno/previm'
Bundle 'opsplorer'
Bundle 'editorconfig/editorconfig-vim'
" 補完
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
" git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'Shougo/neosnippet'
Bundle 'hachi-eiji/neosnippet-snippets'
Bundle 'jiangmiao/auto-pairs'
Bundle 'vim-ruby/vim-ruby'
Bundle 'elixir-lang/vim-elixir'
Bundle 'mattreduce/vim-mix'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'glidenote/memolist.vim'
Bundle 'fuenor/qfixgrep'

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

if filereadable(expand('~/.vimrc_js'))
  source ~/.vimrc_js
endif

if filereadable(expand('~/.vimrc_go'))
  source ~/.vimrc_go
endif

" split window right side
let g:netrw_altv = 1
set splitright

let g:previm_open_cmd = 'open -a "Google Chrome"'
nnoremap <silent> gp :PrevimOpen<CR>
" tagbar
nmap <F12> :TagbarToggle<CR>
nnoremap <silent> <C-L> :noh<C-L><CR>

" editorconfig
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

colorscheme jellybeans

au BufNewFile,BufRead *.md :set filetype=markdown
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir

" neosnippet key mapping
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:.,nbsp:%

" ctrp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|gif|png|jpeg|jpg|pdf|mp3)$'
  \ }

" memo
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
let g:memolist_qfixgrep = 1

"qfixgrep
" QuickFixウィンドウでもプレビューや絞り込みを有効化
let QFixWin_EnableMode = 1
" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 1

filetype plugin indent on
set imdisable


