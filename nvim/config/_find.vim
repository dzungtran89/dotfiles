" Get the first assign of the var undercursor"
nn <localleader>1 zy[i<CR>

" qf results
nnoremap <leader>p      :copen<CR>
nnoremap <localleader>p :lopen<CR>
nnoremap <silent> <c-n> :cnext<CR>
nnoremap <silent> <c-p> :cprevious<CR>

if PlugLoaded('ack.vim')

  if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case'
  endif

  let g:ack_autoclose = 1
  let g:ack_use_cword_for_empty_search = 1

  cnoreabbrev Ack Ack!
  nnoremap <leader>/ :Ack -t

  " lazy mappings"
  nmap <leader>1  :Ack -tpy -e<space>
  nmap <leader>2  :Ack -txml -e<space>
  nmap <leader>3  :Ack -tjs -e<space>
  nmap <leader>st :Ack -e "\#.*(TODO\\|TOCHECK\\|FIXME)"<space>

endif
