if PlugLoaded('feline.nvim')
  lua require('_feline')

elseif PlugLoaded('lualine.nvim')
  lua require('_lualine')

else 
  " lightline as default
  source $HOME/.config/nvim/config/lightline.vim
endif
