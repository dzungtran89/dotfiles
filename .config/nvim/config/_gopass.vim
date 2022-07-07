if has('macunix')
  au BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile
else
  au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
endif
