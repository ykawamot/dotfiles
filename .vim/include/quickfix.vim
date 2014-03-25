" quickfixを自動で開く
" http://webtech-walker.com/archive/2009/09/29213156.html
augroup QuickFixAutoOpen
  autocmd!
  autocmd QuickFixCmdPost make,grep,grepadd,vimgrep,vimgrepadd call OpenModifiableQF()

  function! OpenModifiableQF()
    if len(getqflist()) != 0
      copen
      " quickfix: 編集許可と折り返し表示無効
      " Link: http://d.hatena.ne.jp/ryochack/20110609/1307639604
      set modifiable
      set nowrap
    endif
  endfunction
augroup END

" Windowが1つになったらquickfixを閉じる
augroup QuickFixAutoClose
  autocmd!
  autocmd WinEnter * call s:QuickFixBufDelete()

  function! s:QuickFixBufDelete()
    if winnr('$') == 1
      for bf in range(1, bufnr('$'))
        if getbufvar(bf, '&buftype') == 'quickfix'
          execute 'bdelete! ' . bf
          break
        endif
      endfor
    endif
  endfunction
augroup END
