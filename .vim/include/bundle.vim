"
" Bundle plugins
"

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mhinz/vim-hugefile'
NeoBundle 'othree/eregex.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tejr/vim-tmux'
"NeoBundle 'thinca/vim-quickrun' => quickrun.vim
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-scripts/EnhCommentify.vim'
NeoBundle 'vim-scripts/str2numchar.vim'
NeoBundle 'vim-scripts/sudo.vim'
"NeoBundle 'vim-scripts/QuickBuf'
NeoBundle 't-cyrill/QuickBuf'
NeoBundle 'osyo-manga/vim-over'
cnoremap <silent> <Leader>o OverCommandLine<CR>

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'windows' : 'make -f make_mingw32.mak',
\   'cygwin'  : 'make -f make_cygwin.mak',
\   'mac'     : 'make -f make_mac.mak',
\   'unix'    : 'make -f make_unix.mak',
\   },
\ }

" Link: http://mattn.kaoriya.net/software/vim/20140327140734.htm
NeoBundleLazy 'mattn/emoji-vim', {
\ 'autoload' : { 'commands' : [ 'Emoji' ] },
\ }

NeoBundleLazy 'Shougo/unite.vim' , {
\ 'autoload' : { 'commands' : [ 'Unite' ] }
\ }
let s:bundle = neobundle#get('unite.vim')
function! s:bundle.hooks.on_source(bundle)
  " write unite.vim setting here.
endfunction

NeoBundleLazy 'Shougo/vimfiler', {
\ 'autoload' : { 'commands' : [
\   'VimFiler',          'VimFilerClose',  'VimFilerCurrentDir', 'VimFilerExplorer', 'VimFilerSplit',
\   'VimFilerBufferDir', 'VimFilerCreate', 'VimFilerDouble',     'VimFilerSimple',   'VimFilerTab',
\   ]},
\ 'depends': [ 'Shougo/unite.vim' ],
\ }
let s:bundle = neobundle#get('vimfiler')
function! s:bundle.hooks.on_source(bundle)
  " write vimfiler setting here.
endfunction

NeoBundleLazy 'Shougo/vimshell', {
\ 'autoload' : { 'commands' : [
\   'VimShell',          'VimShellCurrentDir',  'VimShellPop',        'VimShellTab',
\   'VimShellBufferDir', 'VimShellExecute',     'VimShellSendBuffer', 'VimShellTerminal',
\   'VimShellCreate',    'VimShellInteractive', 'VimShellSendString',
\   ]},
\ 'depends': [ 'Shougo/vimproc' ],
\ }
let s:bundle = neobundle#get('vimshell')
function! s:bundle.hooks.on_source(bundle)
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_prompt =  '$ '
endfunction

