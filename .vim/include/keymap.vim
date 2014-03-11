"
" キーマップ関連
"

" 折り返し行でも画面のとおりに移動する
nnoremap j gj
nnoremap k gk
nnoremap * g*
nnoremap <Down> gj
nnoremap <Up>   gk

" 検索時に画面の中央に表示する
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

" <Tab>で画面切り替えできようにする
nnoremap <Tab> <C-w>w

" 画面切り替え
" Link: http://www.vimbits.com/bits/10
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" visualモードで連続インデントする
" Link: http://www.vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" root権限で強制的に保存する
" Link: http://www.vimbits.com/bits/45
cmap w!! w !sudo tee % > /dev/null

" Yの動作をA,C,Dのようにする
" Link: http://www.vimbits.com/bits/11
map Y y$
