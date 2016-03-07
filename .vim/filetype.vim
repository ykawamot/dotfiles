" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup FileTypeDetect
  autocmd!
  autocmd BufNewFile,BufRead *.sql  setfiletype mysql
  autocmd BufNewFile,BufRead *.cgi  setfiletype perl
  autocmd BufNewFile,BufRead *.psgi setfiletype perl
  autocmd BufNewFile,BufRead *.t    setfiletype perl
  autocmd BufNewFile,BufRead *.inc  setfiletype php
  autocmd BufNewFile,BufRead *.tt   setfiletype tt2html

  autocmd BufNewFile,BufRead cpanfile setfiletype perl
  autocmd BufNewFile,BufRead Gemfile  setfiletype ruby
augroup END
