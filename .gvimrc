set guifont=Consolas\ 13 "unix setup
" set guifont=Consolas:h13 "windows setup
" set guifont=Courier\ 10\ Pitch\ 13
set encoding=utf-8

au BufNewFile * set ff=unix
au BufRead    * set ff=unix
" --------------------------------------------------------------------
"  Maximize gvim windows when open gvim
if has('win32')      
    au GUIEnter * simalt ~x  
else      
    au GUIEnter * call MaximizeWindow()  
endif   
  
function! MaximizeWindow()      
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz  
endfunction  
" --------------------------------------------------------------------
