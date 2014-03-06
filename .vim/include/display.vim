"
" 表示関連
"

set number        " 行番号表示
set showcmd       " 入力中のコマンドを表示
set showmode      " 現在のモードを表示
set shortmess+=I  " 起動時のメッセージを表示しない
set textwidth=0   " 自動改行する文字数(0なら自動改行しない)
"set display=uhex " ^Cなどを<xx>の形式で16進数表示する

set showmatch   " 対応する括弧を表示
set matchtime=2 " 対応する括弧の表示時間(初期値5)

set list                " タブや改行文字を表示する
set listchars=tab:\ \   " タブの左端にカーソルを表示する
set listchars+=trail:\  " 行末の半角スペースを表示する

" 全角スペースを表示
" Link: http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color
if has('syntax')
  function! ZenkakuSpace()
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue
    " 全角スペースを明示的に表示する。
    silent! match ZenkakuSpace /　/
  endfunction

  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif
