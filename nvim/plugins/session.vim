if has_key(plugs, 'vim-session')

  " session management
  nnoremap <leader>qo :OpenSession<Space>
  nnoremap <leader>qs :SaveSession<Space>
  nnoremap <leader>qd :DeleteSession<CR>
  nnoremap <leader>qc :CloseSession<CR>
  nnoremap <leader>qq :qa!<CR>

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
