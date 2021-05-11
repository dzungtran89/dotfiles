
if has_key(plugs, 'ale')

  let g:ale_pattern_options = {'[^\.py]+$': {'ale_enabled': 0}}

  let g:ale_list_window_size = 5

  " Write this in your vimrc file
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0

  " You can disable this option too
  " if you don't want linters to run on opening a file
  let g:ale_lint_on_enter = 0

  " " keep gutter always show
  " let g:ale_sign_column_always = 1

  let g:ale_linters = {
        \   'python': ['flake8'],
        \}

  " " Fix Python files with autopep8 and ypf.
  " let b:ale_fixers = ['autopep8', 'yapf']

  " Disable warnings about trailing whitespace for Python files.
  let g:ale_warn_about_trailing_whitespace = 0

  nmap <silent> <C-up> <Plug>(ale_previous_wrap)
  nmap <silent> <C-down> <Plug>(ale_next_wrap)

endif
