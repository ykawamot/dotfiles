" 全角スペース可視化
" Ref: http://d.hatena.ne.jp/thinca/20160214/1455415240
let g:zenspace#default_mode = 'on'

Plug 'thinca/vim-zenspace'

augroup vimrc-highlight
  autocmd!
  autocmd ColorScheme * highlight ZenSpace cterm=underline ctermfg=lightblue
augroup END
