if PlugLoaded('lightline.vim')
  source $HOME/.config/nvim/config/nord.vim
  set noshowmode

  luafile $HOME/.config/nvim/lua/plugins/_lightline.lua

  function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  endfunction

  " register ompoments:
  call lightline#coc#register()
endif
