NeoBundle 'thinca/vim-quickrun'

let g:quickrun_config = {
\ '_': {
\   'split'  : '',
\   'runner' : 'vimproc',
\   'hook/time/enable' : '1',
\   'outputter/buffer/split' : 'botright 8sp',
\   },
\ }

let g:quickrun_config.perl = {
\ 'command' : 'perl',
\ 'cmdopt'  : '-MCarp=verbose',
\ }
