" 挿入モードで矢印キーを打つとA, B, C, Dとならないように
" Link: http://d.hatena.ne.jp/itchyny/20130624/1372059268

let g:neocomplcache_enable_insert_char_pre = 1

inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-d> <Del>
inoremap <C-x> <Del>
inoremap <C-h> <BS>
inoremap <Up> <Up>
inoremap <C-_> <ESC>ugi
inoremap <C-\> <ESC>ugi
nnoremap OA gi<Up>
nnoremap OB gi<Down>
nnoremap OC gi<Right>
nnoremap OD gi<Left>
nnoremap OF gi<End>
nnoremap OH gi<Home>
nnoremap [3~ gi<Del>
nnoremap [5~ gi<PageUp>
nnoremap [6~ gi<PageDown>
