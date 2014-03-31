"===================================================
" Plugin: open-browser.vim
" Link:   https://github.com/tyru/open-browser.vim
" Note:   [nv]noremap does not work
"===================================================

NeoBundleLazy 'tyru/open-browser.vim', {
\ 'autoload' : {
\   'functions' : [ 'OpenBrowser' ],
\   'commands'  : [ 'OpenBrowser', 'OpenBrowserSearch' ],
\   'mappings'  : [ '<Plug>(openbrowser-smart-search)' ],
\   },
\ }

let s:bundle = neobundle#get('open-browser.vim')
function! s:bundle.hooks.on_source(bundle)
  " disable netrw's gx mapping.
  let g:netrw_nogx = 1
endfunction
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)

