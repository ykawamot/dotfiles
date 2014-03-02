" shebang 付ファイル保存時に実行権限を付加
" Link: http://d.hatena.ne.jp/spiritloose/20060519/1147970872
augroup AutoExecMod
  autocmd!
  autocmd BufWritePost * :call AddExecMod()
augroup END

function! AddExecMod()
  let line = getline(1)
  if strpart(line, 0, 2) == "#!"
    call system("chmod +x ". expand("%"))
  endif
endfunction
