" ==================== Settings ==================== "
" Define and reset augroup used in vimrc {{{1
augroup vimrc
  autocmd!
augroup END

" 全般系 {{{1
syntax on
filetype on
filetype indent on
filetype plugin on
set nocompatible
set encoding=utf-8
"set mouse=a
let mapleader = ","

" タブ関連 {{{1
set tabstop=4       " タブの表示幅を4文字にする
set shiftwidth=4    " cindentやautoindent時に挿入されるタブの幅(tabstop と揃えておくと良い)
set softtabstop=4   " tabstopを変えずに空白によって見た目のtabstopを変える
set expandtab       " タブの代わりに同じ幅の空白を入れる
set smarttab        " 行頭でタブを入力するとshiftwidthが用いられる

" ファイル {{{1
set autoread    " 他で書き換えられたら自動で読み直す
set noswapfile  " スワップファイル作らない
set hidden      " 編集中でも他のファイルを開けるようにする

" 入力補助 {{{1
set autoindent
set nosmartindent
set backspace=indent,eol,start  " バックスペースで消せるように
set formatoptions-=or   " コメント行で改行しても自動的にコメント記号をつけない
set formatoptions+=mM   " 日本語行を連結する際に空白を挿入しない

" 検索 {{{1
set ignorecase  " 大文字小文字を区別しない
set smartcase   " 大文字が含まれている場合は区別して検索する
set wrapscan    " 最後まで検索したら先頭へ戻る
set hlsearch    " 検索文字列をハイライト
set incsearch   " インクリメンタルサーチ

" ステータスライン {{{1
set laststatus=2    " ステータスラインを常に表示
set statusline=%<%f\ %m%r%h%w%y
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
set statusline+=%=%l/%L,%v%8P

" 表示系 {{{1
set number              " 行番号表示
set showmatch           " 対応する括弧を表示
set matchtime=2         " 対応する括弧の表示時間(初期値5)
set showcmd             " 入力中のコマンドを表示
set list                " タブや改行文字を表示する
set listchars=tab:\ \   " タブの左端にカーソルを表示する
set listchars+=trail:\  " 行末の半角スペースを表示する
set scrolloff=5         " スクロール時の余白確保
set showmode            " 現在のモードを表示
set modeline            " モードラインを有効にする
set shortmess+=I        " 起動時のメッセージを表示しない
set textwidth=0         " 長い行でも自動改行をしない
" set display=uhex      " ^Cなどを<xx>の形式で16進数表示する
set foldmethod=marker   " foldの種類を指定
set fillchars=vert:\|   " fold時にハイフンで埋めない

" その他設定 {{{1
set nrformats-=octal            " 8進数を無効にする (C-a, C-xなどに影響する)
set fileformat=unix             " 改行コードの指定
set fileformats=unix,dos,mac    " 改行コードの自動認識
set wildmenu                    " 補完候補を表示する
set wildmode=list:longest       " 全ての候補を羅列し、共通する最長の文字列まで補完する
set wildignore=*.o,*.so         " 補完候補から除外するファイル

" 色の設定 {{{1
"set background=dark    " ターミナルの背景色を指定(またはlight)
highlight Comment    ctermfg=lightblue
highlight Directory  ctermfg=lightblue
highlight Folded     ctermfg=lightblue
highlight NonText    ctermfg=darkgrey
highlight SpecialKey cterm=underline ctermfg=darkgrey

" 全角スペースを表示 {{{2
" Link: http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color
function! ZenkakuSpace()
  " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue
  "全角スペースを明示的に表示する。
  silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

" キーマッピング {{{1
" 折り返し行でも画面のとおりに移動する
nnoremap j gj
nnoremap k gk
nnoremap * g*
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap n nzz
nnoremap N Nzz
" <Tab>で画面切り替えできようにする
nnoremap <Tab> <C-w>w
" 日付の入力補完
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
" vimrcを即座に開く
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
" ywでそのカーソル位置にある単語をレジスタに追加
nnoremap yw :let @"=expand('<cword>')<CR>
" 行を連結したときのスペースを除去
nnoremap J Jx

" String convert to Numeric Character Reference 
" Link: http://www.vim.org/scripts/script.php?script_id=1646
vnoremap <silent> sn :Str2NumChar<CR>
vnoremap <silent> sh :Str2HexLiteral<CR>

" html エスケープ {{{2
" Link: http://liosk.blog103.fc2.com/blog-entry-187.html
vnoremap <Leader>e "xx:call <SID>EscapeXml('x')<CR>"xP

function! s:EscapeXml(regname)
  let x = getreg(a:regname)
  let x = substitute(x, '&', '\&amp;',  'g')
  let x = substitute(x, '<', '\&lt;',   'g')
  let x = substitute(x, '>', '\&gt;',   'g')
  let x = substitute(x, "'", '\&apos;', 'g')
  let x = substitute(x, '"', '\&quot;', 'g')
  call setreg(a:regname, x)
endfunction

" quickfixを自動で開く {{{1
" http://webtech-walker.com/archive/2009/09/29213156.html
augroup vimrc
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep 
  \ if len(getqflist()) != 0 | 
  \   copen | 
  \ endif
augroup END

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
augroup vimrc
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

" shebang 付ファイル保存時に実行権限を付加 {{{1
" Link: http://d.hatena.ne.jp/spiritloose/20060519/1147970872
augroup vimrc
  autocmd BufWritePost * :call AddExecmod()
augroup END

function! AddExecmod()
  let line = getline(1)
  if strpart(line, 0, 2) == "#!"
    call system("chmod +x ". expand("%"))
  endif
endfunction

" QuickBuf {{{1
" Very small, clean but quick and POWERFUL buffer manager!
" http://www.vim.org/scripts/script.php?script_id=1910
" http://nanasi.jp/articles/vim/qbuf_vim.html
let g:qb_hotkey="<F4>"

" grep で ack を使う {{{1
" http://blog.blueblack.net/item_160
" http://d.hatena.ne.jp/secondlife/20080311/1205205348
set grepprg=ack\ -a

" XMLの閉じタグを補完する {{{1
" http://vim-users.jp/2009/06/hack22/
augroup XMLCompletion
  autocmd!
  autocmd Filetype xml   inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html  inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype xhtml inoremap <buffer> </ </<C-x><C-o>
augroup END

" Stntax highlight {{{1
let perl_fold = 1
"let perl_fold_blocks = 1
"let php_folding=1
let php_htmlInStrings = 1
let php_sql_query = 1
let python_highlight_all = 1
let ruby_fold = 1

" .vimrc 保存時に再読み込み {{{1
augroup vimrc
  autocmd BufWritePost $HOME/.vimrc source $HOME/.vimrc
augroup END

" 前回終了したカーソル行に移動 {{{1
augroup vimrc
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

" 新規作成時のエンコーディング指定 {{{1
augroup vimrc
  autocmd BufNewFile *.html setlocal fileencoding=utf-8
  autocmd BufNewFile *.py   setlocal fileencoding=utf-8
  autocmd BufNewFile *.xml  setlocal fileencoding=utf-8
augroup END

" vimプラグインの管理(vim-pathogen) {{{1
" Link: http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" 検索ハイライト消去 {{{1
" Link: http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

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

