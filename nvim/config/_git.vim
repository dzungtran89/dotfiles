" Git
if PlugLoaded('vim-fugitive')
  noremap <leader>gg :Git<space>
  noremap <leader>go :.GBrowse<CR>
  noremap <leader>gw :GBrowse<CR>
  noremap <leader>gb :Git blame<CR>
  noremap <leader>gq :gq<CR>

  "" Open current line on GitHub
  let g:fugitive_gitlab_domains = ['https://gitlab.trobz.com']
endif

if PlugLoaded('vim-gitgutter')
  set updatetime=250

  " let g:gitgutter_sign_removed          = '🔥'
  " let g:gitgutter_sign_modified_removed = '🤔'
  " let g:gitgutter_sign_added            = '🐣'
  " let g:gitgutter_sign_modified         = '🐍'
endif

if PlugLoaded('gitsigns.nvim')
  source $HOME/.config/nvim/plugins/gitsign.lua
endif
