
function! ClearSyntax()
  if &ft ==? "python"
    match Comment /#.*$/
  elseif &ft ==? "html"
    match Comment /<!--\_.\{-}-->/
  elseif &ft ==? "xml"
    match Comment /<!--\_.\{-}-->/
  elseif &ft ==? "vim"
    match Comment /".*$/
  endif

  syntax off
endfunction

" command! ClearSyntax :call ClearSyntax()

autocmd!
autocmd VimEnter,BufEnter * call ClearSyntax()

