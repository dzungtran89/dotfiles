if has_key(plugs, 'vim-which-key')

  call which_key#register('<Space>', "g:which_key_map")

  nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
  vnoremap <silent> <leader> :<c-u>WhichKeyVisual ','<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>

  set timeoutlen=500

  " Define prefix dictionary
  let g:which_key_map =  {}

  " =======================================================
  " Create menus based on existing mappings
  " =======================================================
  " You can pass a descriptive text to an existing mapping.

  let g:which_key_map.f = { 'name' : '+file' }

  nnoremap  <localleader>fz :e!<CR>
  nnoremap  <localleader>fe :e<CR>
  nnoremap  <localleader>fs :update<CR>

  " nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
  " let g:which_key_map.f.d = 'open-vimrc'

  " nnoremap <silent> <leader>oq  :copen<CR>
  " nnoremap <silent> <leader>ol  :lopen<CR>

  " let g:which_key_map.o = {
  "       \ 'name' : '+open',
  "       \ 'q' : 'open-quickfix'    ,
  "       \ 'l' : 'open-locationlist',
  "       \ }

  " =======================================================
  " Create menus not based on existing mappings:
  " =======================================================
  " Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
  " and descriptions for the existing mappings.
  "
  " Note:
  " Some complicated ex-cmd may not work as expected since they'll be
  " feed into `feedkeys()`, in which case you have to define a decicated
  " Command or function wrapper to make it work with vim-which-key.
  " Ref issue #126, #133 etc.

  " let g:which_key_map.b = {
  "       \ 'name' : '+buffer' ,
  "       \ '1' : ['b1'        , 'buffer 1']        ,
  "       \ '2' : ['b2'        , 'buffer 2']        ,
  "       \ 'd' : ['bd'        , 'delete-buffer']   ,
  "       \ 'f' : ['bfirst'    , 'first-buffer']    ,
  "       \ 'h' : ['Startify'  , 'home-buffer']     ,
  "       \ 'l' : ['blast'     , 'last-buffer']     ,
  "       \ 'n' : ['bnext'     , 'next-buffer']     ,
  "       \ 'p' : ['bprevious' , 'previous-buffer'] ,
  "       \ '?' : ['Buffers'   , 'fzf-buffer']      ,
  "       \ }

  " let g:which_key_map.w = {
  "       \ 'name' : '+windows'  ,
  "       \ 'w' : ['<C-W>w'      , 'other-window']          ,
  "       \ 'd' : ['<C-W>c'      , 'delete-window']         ,
  "       \ '-' : ['<C-W>s'      , 'split-window-below']    ,
  "       \ '|' : ['<C-W>v'      , 'split-window-right']    ,
  "       \ '2' : ['<C-W>v'      , 'layout-double-columns'] ,
  "       \ 'h' : ['<C-W>h'      , 'window-left']           ,
  "       \ 'j' : ['<C-W>j'      , 'window-below']          ,
  "       \ 'l' : ['<C-W>l'      , 'window-right']          ,
  "       \ 'k' : ['<C-W>k'      , 'window-up']             ,
  "       \ 'H' : ['<C-W>5<'     , 'expand-window-left']    ,
  "       \ 'J' : [':resize +5'  , 'expand-window-below']   ,
  "       \ 'L' : ['<C-W>5>'     , 'expand-window-right']   ,
  "       \ 'K' : [':resize -5'  , 'expand-window-up']      ,
  "       \ '=' : ['<C-W>='      , 'balance-window']        ,
  "       \ 's' : ['<C-W>s'      , 'split-window-below']    ,
  "       \ 'v' : ['<C-W>v'      , 'split-window-below']    ,
  "       \ '?' : ['Windows'     , 'fzf-window']            ,
  "       \ }

  let g:which_key_map.c = {
        \ 'name' : '+terminal'                             ,
        \ ';' : [':FloatermNew --wintype=popup --height=6' , 'terminal'] ,
        \ 'f' : [':FloatermNew fzf'                        , 'fzf']      ,
        \ 'g' : [':FloatermNew lazygit'                    , 'git']      ,
        \ 'd' : [':FloatermNew lazydocker'                 , 'docker']   ,
        \ 'N' : [':FloatermNew node'                       , 'node']     ,
        \ 'n' : [':FloatermNew nnn'                        , 'nnn']      ,
        \ 'p' : [':FloatermNew python'                     , 'python']   ,
        \ 'r' : [':FloatermNew ranger'                     , 'ranger']   ,
        \ 't' : [':FloatermToggle'                         , 'toggle']   ,
        \ 'y' : [':FloatermNew ytop'                       , 'ytop']     ,
        \ }

endif
