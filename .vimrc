" init
augroup MyAutoCmd
  autocmd!
augroup END

let mapleader = ","

filetype off
filetype plugin indent off

" NeoBundle周りを自動化する
" Link: http://qiita.com/td2sk/items/2299a5518f58ffbfc5cf
if has('vim_starting')
  " NeoBundleが未取得なら、git clone を呼び出す
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "Install neobundle..."
    call system("git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

let g:neobundle_default_git_protocol = 'https'
let g:neobundle#default_options = {
\ '_' : {
\   'focus' : 1000,
\   'verbose' : 1,
\   },
\ }
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
runtime! include/*.vim
call neobundle#end()

" vim-plug
" Link: http://qiita.com/jiminko/items/f4b337ab41db751388f7
if has('vim_starting')
  set runtimepath+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  endif
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug', {
  \ 'dir' : '~/.vim/plugged/vim-plug/autoload',
  \ }
runtime! plugged-in/*.vim
call plug#end()

execute printf('%s %s', 'colorscheme', g:apply_colorscheme)

filetype plugin indent on

" ファイル {{{1
set autoread    " 他で書き換えられたら自動で読み直す
set noswapfile  " スワップファイル作らない
set hidden      " 編集中でも他のファイルを開けるようにする

" 入力補助 {{{1
set backspace=indent,eol,start  " バックスペースで消せるように
set formatoptions-=or   " コメント行で改行しても自動的にコメント記号をつけない
set formatoptions+=mM   " 日本語行を連結する際に空白を挿入しない

" 表示系 {{{1
set scrolloff=5         " スクロール時の余白確保
set modeline            " モードラインを有効にする
set modelines=5
set vb t_vb=

" その他設定 {{{1
set nrformats-=octal            " 8進数を無効にする (C-a, C-xなどに影響する)
set fileformat=unix             " 改行コードの指定
set fileformats=unix,dos,mac    " 改行コードの自動認識
set wildmenu                    " 補完候補を表示する
set wildmode=list:longest       " 全ての候補を羅列し、共通する最長の文字列まで補完する
set wildignore=*.o,*.so,*.swp,*.gz,*.tgz,*.zip,*.pyc  " 補完候補から除外するファイル
set wildignore+=*/.hg/*,*/.svn/*,*/CVS/*
"set wildignore+=*/.git/*       " If you ignore .git, vim-fugitive will not work.

" キーマッピング {{{1
" 日付の入力補完
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
" ywでそのカーソル位置にある単語をレジスタに追加
nnoremap yw :let @"=expand('<cword>')<CR>

" String convert to Numeric Character Reference 
" Link: http://www.vim.org/scripts/script.php?script_id=1646
vnoremap <silent> sn :Str2NumChar<CR>
vnoremap <silent> sh :Str2HexLiteral<CR>

" html エスケープ {{{2
" Link: http://liosk.blog103.fc2.com/blog-entry-187.html
vnoremap <silent> <Leader>e "xx:call <SID>EscapeXml('x')<CR>"xP

function! s:EscapeXml(regname)
  let x = getreg(a:regname)
  let x = substitute(x, '&', '\&amp;',  'g')
  let x = substitute(x, '<', '\&lt;',   'g')
  let x = substitute(x, '>', '\&gt;',   'g')
  let x = substitute(x, "'", '\&apos;', 'g')
  let x = substitute(x, '"', '\&quot;', 'g')
  call setreg(a:regname, x)
endfunction

" Syntax Complete {{{1
" Link: http://vim.wikia.com/wiki/User:Tonymec/syntaxcomplete.vim
if exists("s:loaded_syntaxcomplete")
  finish
endif
let s:loaded_syntaxcomplete = 1

if has("autocmd") && exists("+omnifunc")
  augroup syntaxcomplete
    autocmd!
    autocmd Filetype *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
  augroup END
endif

" 辞書ツール指定 {{{1
augroup MyAutoCmd
  set complete+=k     " 辞書ファイルからの単語補間
  autocmd FileType c      set dictionary+=$VIMRUNTIME/syntax/c.vim
  autocmd FileType cpp    set dictionary+=$VIMRUNTIME/syntax/cpp.vim
  autocmd FileType html   set dictionary+=$VIMRUNTIME/syntax/html.vim
  autocmd FileType perl   set dictionary+=$VIMRUNTIME/syntax/perl.vim
  autocmd FileType php    set dictionary+=$VIMRUNTIME/syntax/php.vim
  autocmd FileType python set dictionary+=$VIMRUNTIME/syntax/python.vim
  autocmd FileType sql    set dictionary+=$VIMRUNTIME/syntax/sql.vim
  autocmd FileType vim    set dictionary+=$VIMRUNTIME/syntax/vim.vim
augroup END

" grep で ack を使う {{{1
" http://blog.blueblack.net/item_160
" http://d.hatena.ne.jp/secondlife/20080311/1205205348
if executable('ack')
  set grepprg=ack
endif

" XMLの閉じタグを補完する {{{1
" http://vim-users.jp/2009/06/hack22/
augroup XMLCompletion
  autocmd!
  autocmd Filetype xml   inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html  inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype xhtml inoremap <buffer> </ </<C-x><C-o>
augroup END

" 前回終了したカーソル行に移動 {{{1
augroup MyAutoCmd
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   execute "normal g`\"" |
  \ endif
augroup END

" テンプレートファイル {{{1
augroup SkeletonAu
  autocmd!
  autocmd BufNewFile *.html 0r $HOME/.vim/templates/skel.html
  "autocmd BufNewFile *.pl   0r $HOME/.vim/templates/skel.pl
  "autocmd BufNewFile *.xml  0r $HOME/.vim/templates/skel.xml
augroup END

" クリップボードからの貼り付け時に自動インデントを無効にする {{{1
" Link: http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html#Bracketed
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function! XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" 挿入モードでの ESC キーを押した後の待ちを無くす "{{{1
" Link: http://ttssh2.sourceforge.jp/manual/ja/usage/tips/vim.html#AppESC
let &t_SI .= "\e[?7727h"
let &t_EI .= "\e[?7727l"
inoremap <special> <Esc>O[ <Esc>

" 現在のファイルのフルパスを挿入する {{{1
" Link: http://d.hatena.ne.jp/ykmbpp/20091128/1259411850
inoremap <Leader>path <C-R>=expand('%:p')<CR>

" 括弧までを消したり置き換えたりする{{{1
" Link: http://vim-users.jp/2011/04/hack214/
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

" eregex.vim 用キーマッピング "{{{1
" Link: https://github.com/othree/eregex.vim
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

" color and highlight test "{{{1
" Link: http://d.hatena.ne.jp/connvoi_tyou/20080306
"cnoremap ct source $VIMRUNTIME/syntax/colortest.vim
"cnoremap ht source $VIMRUNTIME/syntax/hitest.vim
nnoremap <silent> :ct :source $VIMRUNTIME/syntax/colortest.vim<CR>
nnoremap <silent> :ht :source $VIMRUNTIME/syntax/hitest.vim<CR>

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
