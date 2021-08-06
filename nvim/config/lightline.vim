if PlugLoaded('lightline.vim')
  source $HOME/.config/nvim/config/nord.vim
  " set noshowmode

  luafile $HOME/.config/nvim/lua/plugins/_lightline.lua

  function! WizFormat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! WizMod()
    return &ft =~ 'help\|vimfiler' ? '' : &modified ? '»' : &modifiable ? '' : ''
  endfunction

  function! WizRO()
    return &ft !~? 'help\|vimfiler' && &readonly ? 'x' : ''
  endfunction

  function! WizEncoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &enc : &enc) : ''
  endfunction

  function! WizType()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
  endfunction

  function! WizName()
    return ('' != WizMod() ? WizMod() . ' ' : '') .
          \ ('' != expand('%:t') ? expand('%:t') : '[none]') 
  endfunction

  function! WizGit()
    if &ft !~? 'help\|vimfiler' && exists("*FugitiveHead")
      return FugitiveHead()
    endif
    return ''
  endfunction

  command! LightlineReload call LightlineReload()

  function! LightlineReload()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endfunction

endif

if PlugLoaded('vim-lightline-coc')
  " register ompoments:
  call lightline#coc#register()
endif
