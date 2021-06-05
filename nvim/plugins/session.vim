if has_key(plugs, 'vim-session')

  " session management
  nnoremap <leader>wo :OpenSession<Space>
  nnoremap <leader>ws :SaveSession<Space>
  nnoremap <leader>wd :DeleteSession<CR>
  nnoremap <leader>wc :CloseSession<CR>

  " session management
  let g:session_directory = "~/.config/nvim/session"
  let g:session_autosave = "no"

  " let g:session_autoload = "no"
  " let g:session_command_aliases = 1
  "
elseif has_key(plugs, 'vim-workspace')
  let g:workspace_session_directory = $HOME . '/.config/nvim/session'
  let g:workspace_autosave = 0
  let g:workspace_autosave_untrailspaces = 0
end
