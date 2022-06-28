" Get the first assign of the var undercursor"
nn <localleader>1 zy[i<CR>

" qf results
nnoremap <leader>p      :copen<CR>
nnoremap <localleader>p :lopen<CR>
nnoremap <silent> <c-n> :lnext<CR>
nnoremap <silent> <c-p> :lprevious<CR>

if PlugLoaded('ack.vim')

  if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case'
  endif

  let g:ack_autoclose = 1
  let g:ack_use_cword_for_empty_search = 1

  cnoreabbrev LAck LAck!
  nnoremap <leader>/ :LAck -t

  " lazy mappings"
  nmap <leader>1  :LAck -tpy -e<space>
  nmap <leader>2  :LAck -txml -e<space>
  nmap <leader>3  :LAck -tjs -e<space>
  nmap <leader>st :LAck -e "\#.*(TODO\\|TOCHECK\\|FIXME)"<space>

endif

if PlugLoaded('far.vim')
  " shortcut for far.vim find
  nnoremap <silent> <leader>sg  :Farf<cr>
  vnoremap <silent> <leader>sg  :Farf<cr>


  " shortcut for far.vim replace
  nnoremap <silent> <leader>sr  :Farr<cr>
  vnoremap <silent> <leader>sr  :Farr<cr>
endif
