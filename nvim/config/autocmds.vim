"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Filetype: Close location list
autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>

" Filetype: Conceal level
autocmd FileType markdown   setlocal conceallevel=0

" Filetype: Indenting and Tabs
autocmd FileType css        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType fortran    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType haskell    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html       setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType lisp       setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType lua        setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown   setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python     setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType tex        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4

" Filetype: Text width
autocmd FileType python     setlocal textwidth=79 colorcolumn=79
autocmd FileType tex        setlocal textwidth=79 colorcolumn=79

" Buffer: Determine filetype based on path
autocmd BufRead,BufNewFile *.cls setlocal filetype=tex
autocmd BufRead,BufNewFile *.nxc setlocal filetype=cpp
autocmd BufRead,BufNewFile *rc setlocal filetype=config

" autocmd BufRead,BufNewFile if empty(&filetype) | ~/.config/* setlocal filetype=config | endif
" autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/*/.config/* setlocal filetype=config | endif
" autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/bash/* setlocal filetype=zsh | endif
" autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/zsh/* setlocal filetype=zsh | endif

" Buffer: Disable continue comment on new line
autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" Miscellaneous: Auto close preview
autocmd InsertLeave * silent! pclose!

" Miscellaneous: Check up to date plugins
autocmd VimEnter * call CheckForUpdates()

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Disabling the cursor-line/column in unused windows/buffers.
augroup cursorline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal cursorline
  autocmd WinLeave,BufLeave * setlocal nocursorline
augroup END

