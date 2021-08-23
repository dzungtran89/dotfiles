nnoremap <silent> <leader>ts
      \ :if exists("syntax_on") <BAR>
      \    syntax off <BAR>
      \ else <BAR>
      \    syntax enable <BAR>
      \ endif<CR>

if PlugLoaded('vim-which-key')

  call which_key#register('<space>', "g:which_key_map")

  nnoremap <silent> <leader>      :<c-u>WhichKey '<space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
  vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<space>'<CR>

  set timeoutlen=500

  " Define prefix dictionary
  let g:which_key_map =  {}

  " =======================================================
  " Create menus based on existing mappings
  " =======================================================
  " You can pass a descriptive text to an existing mapping.

  " let g:which_key_map.f = { 'name' : '+file' }

  " nnoremap <leader>fz :e!<CR>
  " nnoremap <leader>fe :e<CR>
  " nnoremap <leader>fs :update<CR>

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

        " \ 'd' : ['<C-W>c'      , 'delete-window']         ,
        " \ 'h' : ['<C-W>h'      , 'window-left']           ,
        " \ 'j' : ['<C-W>j'      , 'window-below']          ,
        " \ 'l' : ['<C-W>l'      , 'window-right']          ,
        " \ 'k' : ['<C-W>k'      , 'window-up']             ,
  let g:which_key_map.w = {
        \ 'name' : '+windows'  ,
        \ 'w' : ['<C-W>w'      , 'other-window']          ,
        \ '-' : ['<C-W>s'      , 'split-window-below']    ,
        \ '|' : ['<C-W>v'      , 'split-window-right']    ,
        \ '2' : ['<C-W>v'      , 'layout-double-columns'] ,
        \ 'H' : ['<C-W>5<'     , 'expand-window-left']    ,
        \ 'J' : [':resize +5'  , 'expand-window-below']   ,
        \ 'L' : ['<C-W>5>'     , 'expand-window-right']   ,
        \ 'K' : [':resize -5'  , 'expand-window-up']      ,
        \ '=' : ['<C-W>='      , 'balance-window']        ,
        \ '?' : ['Windows'     , 'fzf-window']            ,
        \ 'q' : ['<C-W>q'      , 'close-window']            ,
        \ }

  " \ ';' : [':FloatermNew --wintype=popup --height=6' , 'terminal'] ,
  " \ 'd' : [':FloatermNew lazydocker' , 'docker']   ,
  " \ 'N' : [':FloatermNew node'       , 'node']     ,
  " \ 't' : [':FloatermToggle'         , 'terminal'] ,
  " \ 'p' : [':FloatermNew python'     , 'python']   ,
  let g:which_key_map.c = {
        \ 'name' : '+floaterm'             ,
        \ 'l' : [':FloatermNew lazygit'    , 'git']      ,
        \ 'g' : [':FloatermNew tig'        , 'tig']      ,
        \ 'n' : [':FloatermNew nnn'        , 'nnn']      ,
        \ }

  let g:which_key_map.t = {
        \ 'name' : '+toggle'             ,
        \ 'l' : [':set invrelativenumber'    , 'On/Off relativenumber']      ,
        \ }

endif

if PlugLoaded('vim-floaterm')
  nnoremap   <silent>   <F12>              :FloatermToggle<CR>
  tnoremap   <silent>   <F12>   <C-\><C-n> :FloatermToggle<CR>
endif

