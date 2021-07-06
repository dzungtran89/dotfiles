" vim: set ft=vim fdm=marker

" important!!
if has('termguicolors')
  set termguicolors
endif

" Personal plugins

source $HOME/.config/nvim/plugins/_whichkey.vim
source $HOME/.config/nvim/plugins/_session.vim
source $HOME/.config/nvim/plugins/_editor.vim
source $HOME/.config/nvim/plugins/_telescope.vim
source $HOME/.config/nvim/plugins/_nvimtree.vim
source $HOME/.config/nvim/plugins/search.vim
source $HOME/.config/nvim/plugins/_find.vim
source $HOME/.config/nvim/plugins/_lf.vim

lua require('_indent_blankline_nvim')
lua require('_fzf')
lua require('_coc')
" lua require('_nvimtree')

if PlugLoaded('coc.nvim')
  source $HOME/.config/nvim/plugins/coc.vim
else
  lua require('_lsp')
  lua require('_compe')
endif

" lua require('_treesitter')
" lua require('_tabline')
lua require('_theme')
" lua require('_lualine')

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
