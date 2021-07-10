" set tabline="%1t"

source $HOME/.config/nvim/config/nord.vim

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': "", 'right': "" },
      \ 'active': {
      \   'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'gitbranch', 'readonly', 'filename', 'modified', 'tagbar' ]
      \   ],
      \   'right': [
      \       ['percent'],
      \       ['lineinfo'],
      \       ['cocstatus', 'fileformat', 'fileencoding', 'filetype' ],
      \   ]
      \ },
      \ 'component_function': {
      \   'gitbranch' : 'FugitiveHead',
      \   'cocstatus' : 'coc#status',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ },
      \ 'mode_map': {
      \ 'n' : '🥚',
      \ 'r' : 'Prompt',
      \ 'i' : '🐣',
      \ 'R' : 'R',
      \ 'v' : '🔥',
      \ 'V' : 'VL',
      \ "\<C-v>": '🐍',
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

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
