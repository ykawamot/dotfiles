"
" エンコード関連
"

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings& fileencodings+=utf-8,euc-jp,cp932,iso-2022-jp

augroup SetFileEncoding
  autocmd!
  autocmd FileType cvs setlocal fileencoding=euc-jp
augroup END
