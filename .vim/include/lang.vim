"
" Lang setting
"

" cpp
NeoBundleLazy "vim-jp/cpp-vim", { 'autoload' : { 'filetypes' : [ 'cpp' ] } }

" go
NeoBundleLazy 'fatih/vim-go', { 'autoload' : { 'filetypes' : [ 'go' ] } }
let s:bundle = neobundle#get('vim-go')
function! s:bundle.hooks.on_source(bundle)
  let g:go_fmt_autosave = 0
endfunction

" javascript
NeoBundleLazy 'pangloss/vim-javascript', {'autoload' : { 'filetypes' : [ 'javascript' ] } }

