Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplete'
Bundle 'mattn/jscomplete-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'guileen/vim-node-dict'
Bundle 'maksimr/vim-jsbeautify'

let g:syntastic_javascript_checkers = ['jshint']
let g:jscomplete_use = ['dom', 'moz']
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
