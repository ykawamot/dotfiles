"===================================================
" Plugin: open-browser.vim 
" Link:   https://github.com/tyru/open-browser.vim
" Note:   [nv]noremap does not work
"===================================================

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)
