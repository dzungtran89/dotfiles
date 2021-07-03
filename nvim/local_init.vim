" vim: set ft=vim fdm=marker

" important!!
if has('termguicolors')
  set termguicolors
endif

" Personal plugins

source $HOME/.config/nvim/plugins/whichkey.vim
source $HOME/.config/nvim/plugins/session.vim
source $HOME/.config/nvim/plugins/editor.vim
source $HOME/.config/nvim/plugins/explorer.vim
source $HOME/.config/nvim/plugins/search.vim

if has_key(plugs, 'coc.nvim')
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
source $HOME/.config/nvim/plugins/keys.vim

" source $HOME/.config/nvim/plugins/doc.vim

source $HOME/.config/nvim/plugins/linter.vim
" source $HOME/.config/nvim/plugins/scheme.vim

source $HOME/.config/nvim/plugins/debug.vim
