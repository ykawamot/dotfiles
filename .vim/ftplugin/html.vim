inoremap ,h1 <h1></h1><Esc>4hi
inoremap ,h2 <h2></h2><Esc>4hi
inoremap ,h3 <h3></h3><Esc>4hi
inoremap ,h4 <h4></h4><Esc>4hi
inoremap ,h5 <h5></h5><Esc>4hi
inoremap ,h6 <h6></h6><Esc>4hi

inoremap ,br  <br /><CR><Esc>i
inoremap ,hr  <hr /><CR><Esc>i
inoremap ,a   <a href=""></a><Esc>5hi
inoremap ,img <img src="" alt="" /><Esc>10hi
 
inoremap ,div   <div><CR><CR></div><Esc>5hki
inoremap ,p     <p><CR><CR></p><Esc>3hki
inoremap ,pre   <pre><CR><CR></pre><Esc>5hki
inoremap ,span  <span><CR><CR></span><Esc>6hki
inoremap ,table <table><CR><CR></table><Esc>7hki
inoremap ,th    <th></th><Esc>4hi
inoremap ,tr    <tr></tr><Esc>4hi
inoremap ,td    <td></td><Esc>4hi

inoremap ,html
 \<!DOCTYPE HTML PUBLIC
 \ "-//W3C//DTD HTML 4.01//EN"
 \ "http://www.w3.org/TR/html4/strict.dtd"><CR>
 \<html lang="ja"><CR>
 \<head><CR>
 \<title></title><CR>
 \</head><CR>
 \<body><CR><CR>
 \</body><CR>
 \</html><Esc>2ki
