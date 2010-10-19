" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup FileTypeDetect
  autocmd!
  autocmd BufRead,BufNewFile *.tt  setfiletype html
  autocmd BufRead,BufNewFile *.cgi setfiletype perl
  autocmd BufRead,BufNewFile *.t   setfiletype perl
  autocmd BufRead,BufNewFile *.inc setfiletype php
augroup END
