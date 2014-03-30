" .vimrcや.gvimrcを変更すると、自動的に変更が反映されるようにする
" Link: http://vim-users.jp/2009/09/hack74/
augroup VimrcAutoReload
  autocmd!
  if !has('gui_running') && !has('win32') || has('win64')
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  else
    autocmd BufWritePost $MYVIMRC source $MYVIMRC |
    \ if has('gui_running') | source $MYGVIMRC
    autocmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
  endif
augroup END
