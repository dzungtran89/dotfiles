" vim: set ft=vim fdm=marker

" important!!
if has('termguicolors')
  set termguicolors
endif

" Personal plugins

source $HOME/.config/nvim/plugins/_whichkey.vim
source $HOME/.config/nvim/plugins/_session.vim
source $HOME/.config/nvim/plugins/_editor.vim
source $HOME/.config/nvim/plugins/_nvimtree.vim
source $HOME/.config/nvim/plugins/_telescope.vim
source $HOME/.config/nvim/plugins/_nvimtree.vim
source $HOME/.config/nvim/plugins/search.vim
" source $HOME/.config/nvim/plugins/_find.vim
" source $HOME/.config/nvim/plugins/_fzf.vim
source $HOME/.config/nvim/lua/_indent_blankline_nvim.lua
source $HOME/.config/nvim/lua/_nnn.lua
source $HOME/.config/nvim/lua/_fzf.lua

if PlugLoaded('coc.nvim')
  source $HOME/.config/nvim/plugins/coc.vim
else
  source $HOME/.config/nvim/plugins/lsp.lua
  source $HOME/.config/nvim/plugins/compe.lua
endif

source $HOME/.config/nvim/plugins/git.vim
source $HOME/.config/nvim/plugins/gutentags.vim
source $HOME/.config/nvim/plugins/snips.vim
source $HOME/.config/nvim/plugins/jump.vim
source $HOME/.config/nvim/plugins/wiki.vim
source $HOME/.config/nvim/plugins/md.vim

source $HOME/.config/nvim/plugins/statusline.vim
source $HOME/.config/nvim/plugins/floaterm.vim

" source $HOME/.config/nvim/plugins/doc.vim

source $HOME/.config/nvim/plugins/linter.vim
" source $HOME/.config/nvim/plugins/scheme.vim

source $HOME/.config/nvim/plugins/debug.vim
