if PlugLoaded('fzf.vim')
  function! s:get_git_root()
    let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
    return v:shell_error ? '' : root
  endfunction

  function! SmartFiles(...)
    let root = s:get_git_root()
    if empty(root)
      execute ":FilesMru"
    else
      execute ":ProjectMru"
    endif
  endfunction

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

  " " -- nnoremap <Leader>es"     :LocateFiles .<CR> 
  " nnoremap <Leader>b       :Buffers<CR> 
  " nnoremap <Leader>ef      :FZF -m<CR> 
  " nnoremap <Leader>eF      :Files %:h<CR> 
  " nnoremap <Leader>eg      :GFiles --cached --others --exclude-standard<CR> 
  " nnoremap <Leader>eh      :History<CR> 
  " nnoremap <Leader>el      :Lines<CR> 
  " nnoremap <Leader>ea      :Ag!<CR> 
  " nnoremap <Leader>er      :Rg!<CR> 
  " nnoremap <Leader>em      :Marks<CR> 
  " nnoremap <Leader>et      :Tags<CR> 
  " nnoremap <Leader>ec      :Commands<CR> 
  " nnoremap <Leader>es      :Filetypes<CR> 
  " nnoremap <Leader>,       :SmartFiles<CR> 
  " nnoremap <localleader>bl :BLines<CR> 
  " nnoremap gl"             :Rg<CR> 
endif

