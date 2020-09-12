
if has_key(plugs, 'ale')

  let g:ale_list_window_size = 5
  " let g:ale_python_flake8_executable = 'flake8'
  " let g:ale_python_flake8_use_global = 1

  " Check Python files with flake8 and pylint.
  let b:ale_linters = ['flake8', 'pylint']
  " Fix Python files with autopep8 and yapf.
  let b:ale_fixers = ['autopep8', 'yapf']
  " Disable warnings about trailing whitespace for Python files.
  let b:ale_warn_about_trailing_whitespace = 0

endif
