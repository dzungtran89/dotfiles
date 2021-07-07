" set tabline="%1t"

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': "", 'right': "" },
      \ 'active': {
      \   'left': [
      \       [ 'gitbranch', 'mode' ],
      \       [ 'readonly', 'modified', 'tagbar' ]
      \   ],
      \   'right': [
      \       ['percent'],
      \       ['lineinfo'],
      \       ['cocstatus', 'fileformat', 'fileencoding', 'filetype'],
      \   ]
      \ },
      \ 'component_function': {
      \   'gitbranch' : 'FugitiveHead',
      \   'cocstatus' : 'coc#status'
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ },
      \ 'mode_map': {
      \ 'n' : 'N',
      \ 'r' : 'Prompt',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'Vim Ex',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'Terminal',
      \ },
      \
      \'enable': { 'tabline': 0 }
      \
      \ }
