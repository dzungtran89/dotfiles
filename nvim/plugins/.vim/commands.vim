" "" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
" augroup vimrc-sync-fromstart
"   autocmd!
"   " autocmd BufEnter * :syntax sync maxlines=200
"   autocmd BufEnter * :syntax sync fromstart
" augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Clar registers {{{1
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), " ") | endfor

" Copy search matches {{{1
command! -register CopyMatches call CopyMatches(<q-reg>)

" fzf {{{1
if PlugLoaded('fzf.vim')
    command! -bang -nargs=? -complete=dir LocateFiles
        \ call fzf#run(fzf#wrap({
        \     'source': 'locate --database=./.locate.db <q-args>',
        \     'options': '-m' },
        \   <bang>0))

    command! -bang -nargs=* -complete=dir SmartFiles
        \ call SmartFiles(<q-args>)

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, &columns > 120 ?
        \ fzf#vim#with_preview() : {}, <bang>0)

    command! -bang -nargs=? -complete=dir Buffers
        \ call fzf#vim#buffers(<q-args>, &columns > 120 ?
        \ fzf#vim#with_preview() : {}, <bang>0)
endif
