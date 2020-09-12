" vim: set ft=vim fdm=marker:

if has_key(plugs, 'lightline.vim')

  let g:lightline = {
        \ 'colorscheme': 'nord',
        \ 'active': {
        \   'left': [
        \       [ 'mode', 'paste' ],
        \       [ 'readonly', 'filename', 'modified', 'method' ]
        \   ],
        \ },
        \ 'component_function': {
        \   'method'    : 'NearestMethodOrFunction',
        \   'gitbranch' : 'FugitiveHead'
        \ },
        \ 'component': {
        \   'lineinfo': '%3l:%-2v%<',
        \ },
        \ 'mode_map': {
        \ 'n' : 'CHU',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
        \ }

  let g:lightline.tabline = {
        \   'left': [ ['tabs'] ],
        \   'right': [ ['gitbranch'] ]
        \ }

endif

" vim-airline
if has_key(plugs, 'vim-airline')
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
  else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
  endif

endif

