filetype off                   " required!

let mapleader = "\<Space>"
set number
syntax on
set t_Co=256
set antialias
set ambiwidth=double

""" ignored files in vimgrep
let s:ignore_list  = ',.git/**,.svn/**,obj/**'
let s:ignore_list .= ',tags,GTAGS,GRTAGS,GPATH'
let s:ignore_list .= ',*.o,*.obj,*.exe,*.dll,*.bin,*.so,*.a,*.out,*.jar,*.pak'
let s:ignore_list .= ',*.zip,*gz,*.xz,*.bz2,*.7z,*.lha,*.lzh,*.deb,*.rpm,*.iso'
let s:ignore_list .= ',*.pdf,*.png,*.jp*,*.gif,*.bmp,*.mp*'
let s:ignore_list .= ',*.od*,*.doc*,*.xls*,*.ppt*'
let s:ignore_list .= ',bundle/**,vendor/bundle/**,node_modules/**,*.cache,*.log'

if exists('+wildignore')
  autocmd QuickFixCmdPre  * execute 'setlocal wildignore+=' . s:ignore_list
  autocmd QuickFixCmdPost * execute 'setlocal wildignore-=' . s:ignore_list
endif

" tab setting
set expandtab
set shiftwidth=2

" indent
set smartindent
set autoindent
set showmatch " 対応括弧を強調
set smarttab  " 新しい行を作った時に自動インデント
set formatoptions=q

set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" ペーストで右にならない
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"
    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

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

" ターミナルがおそい対策
set lazyredraw
set ttyfast

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
Bundle 'tpope/vim-endwise'
Bundle 'rizzatti/dash.vim'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/twilight'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kannokanno/previm'
Bundle 'editorconfig/editorconfig-vim'
" 補完
Bundle 'w0rp/ale'
Bundle 'majutsushi/tagbar'
" git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'Shougo/neosnippet'
Bundle 'hachi-eiji/neosnippet-snippets'
Bundle 'jiangmiao/auto-pairs'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'nixprime/cpsm'
Bundle 'glidenote/memolist.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'Chiel92/vim-autoformat'
Bundle 'tpope/vim-bundler'
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/vimproc.vim'
Bundle 'tpope/vim-rails'
Bundle 'kshenoy/vim-signature'
"末尾の全角と半角の空白文字を赤くハイライト
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'mattn/emmet-vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'Quramy/tsuquyomi'
Bundle 'nazo/pt.vim'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
" Rspec
Bundle 'tpope/vim-dispatch'
Bundle 'thoughtbot/vim-rspec'
" bookmark
Bundle 'MattesGroeger/vim-bookmarks'
Bundle 'burnettk/vim-angular'

" if you want to use overlay feature
let g:choosewin_overlay_enable          = 1
" overlay font broke on mutibyte buffer?
let g:choosewin_overlay_clear_multibyte = 1
nmap ; <Plug>(choosewin)


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

if filereadable(expand('~/.vimrc_neocomplete'))
  source ~/.vimrc_neocomplete
endif

" split window right side
let g:netrw_altv = 1
set splitright

let g:previm_open_cmd = 'open'
nnoremap <silent> gp :PrevimOpen<CR>
" tagbar
nmap <F12> :TagbarToggle<CR>
nnoremap <silent> <C-L> :noh<C-L><CR>

" editorconfig
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

colorscheme jellybeans

au BufNewFile,BufRead *.md :set filetype=markdown
au BufRead,BufNewFile *.rb let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}
au BufNewFile,BufRead *.ts :set filetype=typescript

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
nnoremap <silent> <C-o> :let g:cpsm_match_empty_query = 0<CR>:CtrlPMRU<CR>
nnoremap <silent> <C-p> :let g:cpsm_match_empty_query = 1<CR>:CtrlP<CR>
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v([\/]\.(git|hg|svn)$|[\/]bundle$|[\/]node_modules$)',
  \ 'file': '\v\.(exe|so|dll|gif|png|jpeg|jpg|pdf|mp3|cache)$'
  \ }
let g:ctrlp_clear_cache_on_exit = 0

" memo
let g:memolist_memo_suffix = "md"
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

" dash
nmap <silent> <leader>d <Plug>DashSearch

set conceallevel=0
let g:vim_json_syntax_conceal=0

" w0rp/ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_statusline_format = ['E:%d', 'W:%d', '']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" quick-run
let g:quickrun_config = {'_': {
      \'runner' : 'vimproc',
      \'runner/vimproc/updatetime' : 60,
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }}

" autoformat
noremap <F3> :Autoformat<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
let vim_tags_ctags_binary= "/Applications/MacVim.app/Contents/MacOS/ctags"

" typescriptのimport時にsingleで
let g:tsuquyomi_single_quote_import=1
let g:tsuquyomi_disable_default_mappings = 1
au FileType typescript nmap <Leader>b <Plug>(TsuquyomiGoBack)
au FileType typescript nmap <F7> <Plug>(TsuquyomiReferences)
au FileType typescript noremap <F4> :TsuImport<CR>

filetype plugin indent on
set imdisable
