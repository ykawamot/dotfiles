"
" neocomplcache
"

NeoBundleLazy 'Shougo/neocomplcache', {
\ 'autoload' : { 'insert' : 1 }
\ }

let s:bundle = neobundle#get('neocomplcache')
function! s:bundle.hooks.on_source(bundle)
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'  : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme'   : $HOME.'/.gosh_completions',
  \ }
endfunction

