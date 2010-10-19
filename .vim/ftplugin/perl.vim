let perl_fold = 1
let perl_fold_blocks = 1

" Vimでカーソル下のPerlモジュールを開く
" http://d.hatena.ne.jp/spiritloose/20060817/1155808744
setlocal isfname-=-

nnoremap <C-n> <ESC>:!perl -cw %<CR>
nnoremap <C-e> <ESC>:!perl %<CR>
