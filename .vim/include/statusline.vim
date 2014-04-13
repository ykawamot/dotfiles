"
" ステータスライン関連
"

" ステータスラインを常に表示
set laststatus=2

"set statusline=%<%f\ %m%r%h%w%y
"set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
"set statusline+=%=%l/%L,%v%8P

NeoBundle 'itchyny/lightline.vim'

let g:lightline = {
\ 'colorscheme' : 'wombat',
\ 'component' : {
\   'readonly' : '%{&readonly?"⭤":""}',
\   },
\ 'separator' : { 'left': '⮀', 'right': '⮂' },
\ 'subseparator' : { 'left': '⮁', 'right': '⮃' },
\ }

