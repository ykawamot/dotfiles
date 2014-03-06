"
" タブ・インデント関連
"

set autoindent      " 改行時に前の行のインデントを継続する
set smartindent     " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
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
  autocmd FileType python     setlocal sw=2 sts=2 ts=2
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2
augroup END

