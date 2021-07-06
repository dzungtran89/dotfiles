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

endif

