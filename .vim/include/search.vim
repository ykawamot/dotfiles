"
" search.vim
"

set ignorecase  " 大文字小文字を区別しない
set smartcase   " 大文字が含まれている場合は区別して検索する
set wrapscan    " 最後まで検索したら先頭へ戻る
set hlsearch    " 検索文字列をハイライト
set incsearch   " インクリメンタルサーチ

" 検索ハイライト消去
" Link: http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
