" ==================== Settings ==================== "
" Define and reset augroup used in vimrc
augroup vimrc
  autocmd!
augroup END

" ���̷� {{{1
syntax on
filetype on
filetype indent on
filetype plugin on
set nocompatible
"set mouse=a

" ���ִ�Ϣ {{{1
set tabstop=4       " ���֤�ɽ������4ʸ���ˤ���
set shiftwidth=4    " cindent��autoindent������������륿�֤���(tabstop ��·���Ƥ������ɤ�)
set softtabstop=4   " tabstop���Ѥ����˶���ˤ�äƸ����ܤ�tabstop���Ѥ���
set expandtab       " ���֤������Ʊ�����ζ���������
set smarttab        " ��Ƭ�ǥ��֤����Ϥ����shiftwidth���Ѥ�����

" �ե����� {{{1
set autoread    " ¾�ǽ񤭴�����줿�鼫ư���ɤ�ľ��
set noswapfile  " ����åץե�������ʤ�
set hidden      " �Խ���Ǥ�¾�Υե�����򳫤���褦�ˤ���

" ������� {{{1
set autoindent
set nosmartindent
set backspace=indent,eol,start  " �Хå����ڡ����Ǿä���褦��
set formatoptions-=or   " �����ȹԤǲ��Ԥ��Ƥ⼫ưŪ�˥����ȵ����Ĥ��ʤ�
set formatoptions+=mM   " ���ܸ�Ԥ�Ϣ�뤹��ݤ˶�����������ʤ�

" ���� {{{1
set ignorecase  " ��ʸ����ʸ������̤��ʤ�
set smartcase   " ��ʸ�����ޤޤ�Ƥ�����϶��̤��Ƹ�������
set wrapscan    " �Ǹ�ޤǸ�����������Ƭ�����
set hlsearch    " ����ʸ�����ϥ��饤��
set incsearch   " ���󥯥��󥿥륵����

" ���ơ������饤�� {{{1
set laststatus=2    " ���ơ������饤�����ɽ��
set statusline=%<%f\ %m%r%h%w%y
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
set statusline+=%=%l/%L,%v%8P

" ɽ���� {{{1
set number              " ���ֹ�ɽ��
set showmatch           " �б������̤�ɽ��
set matchtime=2         " �б������̤�ɽ������(�����5)
set showcmd             " ������Υ��ޥ�ɤ�ɽ��
set list                " ���֤����ʸ����ɽ������
set listchars=tab:\ \   " ���֤κ�ü�˥��������ɽ������
set listchars+=trail:\  " ������Ⱦ�ѥ��ڡ�����ɽ������
set scrolloff=5         " �����������;�����
set showmode            " ���ߤΥ⡼�ɤ�ɽ��
set modeline            " �⡼�ɥ饤���ͭ���ˤ���
set shortmess+=I        " ��ư���Υ�å�������ɽ�����ʤ�
set textwidth=0         " Ĺ���ԤǤ���Ԥ��ʤ�
" set display=uhex      " ^C�ʤɤ�<xx>�η�����16�ʿ�ɽ������
set foldmethod=marker   " fold�μ�������

" ����¾���� {{{1
set nrformats-=octal            " 8�ʿ���̵���ˤ��� (C-a, C-x�ʤɤ˱ƶ�����)
set fileformat=unix             " ���ԥ����ɤλ���
set fileformats=unix,dos,mac    " ���ԥ����ɤμ�ưǧ��
set wildmenu                    " �䴰�����ɽ������
set wildmode=list:longest       " ���Ƥθ�������󤷡����̤����Ĺ��ʸ����ޤ��䴰����
set wildignore=*.o,*.so         " �䴰���䤫���������ե�����

" �������� {{{1
"set background=dark    " �����ߥʥ���طʿ������(�ޤ���light)
highlight LineNr     ctermfg=darkyellow
highlight NonText    ctermfg=darkgrey
highlight Folded     ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey

" ���ѥ��ڡ�����ɽ�� {{{2
" Link: http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color
function! ZenkakuSpace()
  " ZenkakuSpace�򥫥顼�ե���������ꤹ��ʤ鼡�ιԤϺ��
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue
  "���ѥ��ڡ���������Ū��ɽ�����롣
  silent! match ZenkakuSpace /��/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

" �����ޥåԥ� {{{1
" �ޤ��֤��ԤǤ���̤ΤȤ���˰�ư����
nnoremap j gj
nnoremap k gk
nnoremap * g*
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap n nzz
nnoremap N Nzz
" <Tab>�ǲ����ڤ��ؤ��Ǥ��褦�ˤ���
nnoremap <Tab> <C-w>w
" ���դ������䴰
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
" vimrc��¨�¤˳���
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
" yw�Ǥ��Υ���������֤ˤ���ñ���쥸�������ɲ�
nnoremap yw :let @"=expand('<cword>')<CR>

" String convert to Numeric Character Reference 
" Link: http://www.vim.org/scripts/script.php?script_id=1646
vnoremap <silent> sn :Str2NumChar<CR>
vnoremap <silent> sh :Str2HexLiteral<CR>

" html ���������� {{{2
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

" quickfix��ư�ǳ��� {{{1
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

" ����ġ������ {{{1
augroup vimrc
  set complete+=k     " ����ե����뤫���ñ�����
  autocmd FileType c      set dictionary+=$VIMRUNTIME/syntax/c.vim
  autocmd FileType cpp    set dictionary+=$VIMRUNTIME/syntax/cpp.vim
  autocmd FileType html   set dictionary+=$VIMRUNTIME/syntax/html.vim
  autocmd FileType perl   set dictionary+=$VIMRUNTIME/syntax/perl.vim
  autocmd FileType php    set dictionary+=$VIMRUNTIME/syntax/php.vim
  autocmd FileType python set dictionary+=$VIMRUNTIME/syntax/python.vim
  autocmd FileType sql    set dictionary+=$VIMRUNTIME/syntax/sql.vim
  autocmd FileType vim    set dictionary+=$VIMRUNTIME/syntax/vim.vim
augroup END

" shebang �եե�������¸���˼¹Ը��¤��ղ� {{{1
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

" grep �� ack ��Ȥ� {{{1
" http://blog.blueblack.net/item_160
" http://d.hatena.ne.jp/secondlife/20080311/1205205348
set grepprg=ack\ -a

" XML���Ĥ��������䴰���� {{{1
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

" .vimrc ��¸���˺��ɤ߹��� {{{1
augroup vimrc
  autocmd BufWritePost $HOME/.vimrc source $HOME/.vimrc
augroup END

" ����λ������������Ԥ˰�ư {{{1
augroup vimrc
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   execute "normal g`\"" |
  \ endif
augroup END

" �ƥ�ץ졼�ȥե����� {{{1
augroup SkeletonAu
  autocmd!
  autocmd BufNewFile *.html 0r $HOME/.vim/templates/skel.html
  "autocmd BufNewFile *.pl   0r $HOME/.vim/templates/skel.pl
  "autocmd BufNewFile *.xml  0r $HOME/.vim/templates/skel.xml
augroup END

" �����������Υ��󥳡��ǥ��󥰻��� {{{1
augroup vimrc
  autocmd BufNewFile *.html setlocal fileencoding=utf-8
  autocmd BufNewFile *.py   setlocal fileencoding=utf-8
  autocmd BufNewFile *.xml  setlocal fileencoding=utf-8
augroup END

" vim�ץ饰����δ���(vim-pathogen) {{{1
" link: http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#runtime_append_all_bundles()
