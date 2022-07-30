" Get the first assign of the var undercursor"
nn <localleader>1 zy[i<CR>

" qf results
nnoremap <leader>p      :copen<CR>
nnoremap <silent> <c-n> :cnext<CR>
nnoremap <silent> <c-p> :cprevious<CR>
nnoremap <localleader>p :lopen<CR>
nnoremap <localleader>] :lnext<CR>
nnoremap <localleader>[ :lprevious<CR>

if PlugLoaded('ack.vim')

  if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case'
  endif

  let g:ack_autoclose = 1
  let g:ack_use_cword_for_empty_search = 1

  cnoreabbrev Ack Ack!
  nnoremap <leader>/ :Ack -t
  vnoremap <leader>/ y:Ack --glob "!test*" --glob "!l10n*" -we "<C-r>=fnameescape(@")<CR>" -tpy<space>

  " lazy mappings
  " wholeword, ignore !tests and l10n*
  nmap <leader>1  :Ack  --glob "!test*" --glob "!l10n*" -tpy  -we<space>
  nmap <leader>2  :Ack  --glob "!test*" --glob "!l10n*" -txml -we<space>
  nmap <leader>3  :Ack  --glob "!test*" --glob "!l10n*" -tjs  -we<space>
  nmap <leader>st :Ack  --glob "!test*" --glob "!l10n*" -we   "\#.*(TODO\\|TOCHECK\\|FIXME)"<space>

endif
