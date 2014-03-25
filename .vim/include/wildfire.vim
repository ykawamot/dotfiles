NeoBundle 'gcmt/wildfire.vim'

"let g:wildfire_fuel_map = "<CR>"

augroup WildfireQuickFix
  autocmd!
  " Disable Wildfire inside help or quickfix buffers
  autocmd FileType help,qf silent! exec "nnoremap <buffer> " . g:wildfire_fuel_map . " " . g:wildfire_fuel_map
augroup END
