
" syntax match potionComment "\v#.*$"
" highlight link potionComment Comment

function! ClearSyntax()

  if index(['zsh', 'sh', 'python', 'yaml', 'yml', 'conf'], &ft) >= 0
    match Comment /^[ \t:]*#.*$/

  elseif index(['html', 'xml'], &ft) >= 0
    match Comment /<!--\_.\{-}-->/

  elseif &ft ==? "vim"
    match Comment /^[ \t:]*".*$/

  elseif index(['rust', 'dart'], &ft) >= 0
    match Comment /^[ \t:]*\/\/.*$/

  elseif index(['javascript', 'js'], &ft) >= 0
    match Comment /\/\*\_.\{-}\*\//

  elseif index(['plsql', 'sql'], &ft) >= 0
    match Comment /\/\*\_.\{-}\*\//

  endif

  syntax off

endfunction

" autocmd!
au VimEnter,BufEnter * call ClearSyntax()

" syntax on for markdown files
" au BufEnter *.md set syntax=on
