" vim: set ft=vim fdm=marker:

" set tabline="%1t"

if has_key(plugs, 'lightline.vim')

  set showtabline=2
  set tabline="%1t"

  " seoul256
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [
        \       [ 'filename', 'mode' ],
        \       [ 'readonly', 'modified', 'tagbar' ]
        \   ],
        \   'right': [
        \       ['percent', 'gitbranch'],
        \       ['lineinfo'],
        \       ['fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'gitbranch' : 'FugitiveHead'
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

  " let g:lightline.tabline = {
  "             \   'left': [ ['tabs'] ],
  "             \   'right': [ [''] ],
  "             \ }

elseif has_key(plugs, 'vim-airline')

  set showtabline=2
  set tabline="%1t"
  let g:airline_extensions = []
  let g:airline#extensions#tabline#enabled = 0

else

  " Statusline & Tabline/Buffer line
  " Dynamically getting the fg/bg colors from the current colorscheme,
  "   returns hex which is enough for me to use in Neovim
  " Needs to figure out how to return cterm values too
  " let fgcolor=synIDattr(synIDtrans(hlID("Normal")), "fg", "gui")
  " let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")

  " Tabline/Buffer line
  set showtabline=2
  set tabline="%1t"

  " Statusline
  " https://github.com/Greduan/dotfiles/blob/76e16dd8a04501db29989824af512c453550591d/vim/after/plugin/statusline.vim

  let g:currentmode={
        \ 'n'   : 'N ',
        \ 'no'  : 'N·Operator Pending ',
        \ 'v'   : 'V ',
        \ 'V'   : 'V·Line ',
        \ 'x22' : 'V·Block ',
        \ 's'   : 'Select ',
        \ 'S'   : 'S·Line ',
        \ 'x19' : 'S·Block ',
        \ 'i'   : 'I ',
        \ 'R'   : 'R ',
        \ 'Rv'  : 'V·Replace ',
        \ 'c'   : 'Command ',
        \ 'cv'  : 'Vim Ex ',
        \ 'ce'  : 'Ex ',
        \ 'r'   : 'Prompt ',
        \ 'rm'  : 'More ',
        \ 'r?'  : 'Confirm ',
        \ '!'   : 'Shell ',
        \ 't'   : 'Terminal ',
        \ "\<C-v>": 'VB',
        \}

  hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
  hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
  hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
  hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

  " Find out current buffer's size and output it.
  function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
      let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
      let mbytes = kbytes / 1000
    endif

    if bytes <= 0
      return '0'
    endif

    if (exists('mbytes'))
      return mbytes . 'MB '
    elseif (exists('kbytes'))
      return kbytes . 'KB '
    else
      return bytes . 'B '
    endif
  endfunction

  function! ReadOnly()
    if &readonly || !&modifiable
      return ''
    else
      return ''
    endif
  endfunction

  function! GitInfo()
    let git = fugitive#head()
    if git != ''
      return git
      " return ' '.fugitive#head()
    else
      return ''
    endif
  endfunction

  " http://stackoverflow.com/a/10416234/213124
  " set statusline+=%{neomake#statusline#LoclistStatus()}                 " Neomake errors
  " set statusline+=%8*\ %{ObsessionStatus()}                             " Obsession indicator
  " set statusline+=%1*\ %-3(%{FileSize()}%)                              " File size
  set laststatus=2
  set statusline=
  set statusline+=%0*\ %{toupper(g:currentmode[mode()])}                " Current mode
  set statusline+=%2*\ [%{GitInfo()}]                                     " Git Branch name
  set statusline+=%2*\ %<%f\ %{ReadOnly()}\ %m\ %w                         " File+path
  " set statusline+=%2*\ %{NearestMethodOrFunction()}
  set statusline+=%#warningmsg#
  set statusline+=%*
  set statusline+=%3*\ %=                                               " Space
  " set statusline+=%8*\ %{gutentags#statusline('[Generating\ tags...]')} " Tags generation
  set statusline+=%1*\ [%n]                                             " buffernr
  set statusline+=%1*\ %y\                                              " FileType
  set statusline+=%2*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\              " Encoding & Fileformat
  set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                              " Rownumber/total (%)

endif
