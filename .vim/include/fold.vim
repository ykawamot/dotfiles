"
" Fold関連
"

set foldmethod=marker
set fillchars=vert:\|   " fold時にハイフンで埋めない

" Syntax folding 
" Link: http://stackoverflow.com/questions/4789605/how-do-i-enable-automatic-folds-in-vim
let javaScript_fold = 1
let perl_fold = 1
"let php_folding = 1
let r_syntax_folding=1
"let ruby_fold = 1
let sh_fold_enabled = 1
let vimsyn_folding = 'af'
let xml_syntax_folding = 1

augroup MySyntaxFold
  autocmd!
  autocmd FileType ruby setlocal foldmethod=syntax
augroup END

" foldCC
" Link: http://leafcage.hateblo.jp/entry/2013/04/24/053113
NeoBundle 'LeafCage/foldCC'
let g:foldCCtext_enable_autofdc_adjuster = 1 " faldcolumnを自動調節
set foldtext=foldCC#foldtext()

nnoremap <silent>zc :<C-u>call <SID>smart_foldcloser()<CR>
function! s:smart_foldcloser() "{{{
  if foldlevel('.') == 0
    norm! zM
    return
  endif

  let foldc_lnum = foldclosed('.')
  norm! zc
  if foldc_lnum == -1
    return
  endif

  if foldclosed('.') != foldc_lnum
    return
  endif
  norm! zM
endfunction
"}}}

nnoremap z[ :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap z] :<C-u>call <SID>put_foldmarker(1)<CR>
function! s:put_foldmarker(foldclose_p) "{{{
  let crrstr = getline('.')
  let padding = crrstr=='' ? '' : crrstr=~'\s$' ? '' : ' '
  let [cms_start, cms_end] = ['', '']
  let outside_a_comment_p = synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
  if outside_a_comment_p
    let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cms_end = matchstr(&cms,'\V%s\zs\.\+')
  endif
  let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
  exe 'norm! A'. padding. cms_start. fmr. cms_end
endfunction
"}}}

