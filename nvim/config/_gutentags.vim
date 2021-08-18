if PlugLoaded('vim-gutentags')

  " set tags+=./.git/tags
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_project_root = ['.git', 'package.json']
  " let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

  command! -nargs=0 GutentagsClearCache call
        \ system('rm ' . g:gutentags_cache_dir . '/*')

  let g:gutentags_generate_on_new = 0
  let g:gutentags_generate_on_missing = 0
  let g:gutentags_generate_on_write = 0
  let g:gutentags_generate_on_empty_buffer = 0

  let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ '--languages=python',
      \ ]

  let g:gutentags_ctags_exclude = [
        \ '*.git', '*.svg', '*.hg',
        \ '*/tests/*',
        \ 'build',
        \ 'dist',
        \ '*sites/*/files/*',
        \ 'bin',
        \ 'node_modules',
        \ 'bower_components',
        \ 'cache',
        \ 'compiled',
        \ 'docs',
        \ 'example',
        \ 'bundle',
        \ 'vendor',
        \ '*.md',
        \ '*-lock.json',
        \ '*.lock',
        \ '*bundle*.js',
        \ '*build*.js',
        \ '.*rc*',
        \ '*.json',
        \ '*.min.*',
        \ '*.map',
        \ '*.bak',
        \ '*.zip',
        \ '*.pyc',
        \ '*.class',
        \ '*.sln',
        \ '*.Master',
        \ '*.csproj',
        \ '*.tmp',
        \ '*.csproj.user',
        \ '*.cache',
        \ '*.pdb',
        \ 'tags*',
        \ 'cscope.*',
        \ '*.css',
        \ '*.less',
        \ '*.scss',
        \ '*.exe', '*.dll',
        \ '*.mp3', '*.ogg', '*.flac',
        \ '*.swp', '*.swo',
        \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
        \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
        \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
        \ 'log',
        \ 'venv',
        \ 'git'
        \ ]

  " autocmd BufWritePost *.py,*.js silent! !ctags . &
  if PlugLoaded('gutentags_plus')
    " change focus to quickfix window after search (optional).
    let g:gutentags_plus_switch = 1
  endif

endif

