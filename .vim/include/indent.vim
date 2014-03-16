"
" タブ・インデント関連
"

set autoindent      " 改行時に前の行のインデントを継続する
set cindent         " C言語スタイルのインデント

set tabstop=4       " タブの表示幅
set shiftwidth=4    " 自動インデント時に挿入されるタブの幅(tabstop と揃えておくと良い)
set softtabstop=4   " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set expandtab       " タブの代わりに同じ幅の空白を入れる
set smarttab        " 行頭でタブを入力するとshiftwidthが用いられる

augroup SetTabStop
  autocmd!
  autocmd FileType css        setlocal sw=2 sts=2 ts=2
  autocmd FileType html       setlocal sw=2 sts=2 ts=2
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2
  autocmd FileType xml        setlocal sw=2 sts=2 ts=2
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2
augroup END

" Link: https://github.com/nathanaelkane/vim-indent-guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" vim起動時にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1
" 自動カラーを無効にする
let g:indent_guides_auto_colors = 0
" ガイドの幅
let g:indent_guides_guide_size = 1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level = 2
" インデントのガイドカラー
hi IndentGuidesOdd  ctermbg=darkgray
hi IndentGuidesEven ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray

