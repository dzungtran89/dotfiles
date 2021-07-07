if PlugLoaded('vim-session')

  let g:session_directory = "~/.config/nvim/session"
  let g:session_autoload = "no"
  let g:session_autosave = "no"
  let g:session_command_aliases = 1

  nnoremap <leader>qo :OpenSession<Space>
  nnoremap <leader>qw :SaveSession<Space>
  nnoremap <leader>qd :DeleteSession<CR>
  nnoremap <leader>qc :CloseSession<CR>

endif
