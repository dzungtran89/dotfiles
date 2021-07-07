" vim: set ft=vim fdm=marker:

" -------------------------------
" Vim-PLug core
" -------------------------------

source $HOME/.config/nvim/config/plugins.vim

source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/ui.vim

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

"*****************************************************************************
"" Commands
"*****************************************************************************

lua require('options')
lua require('utils')

" COMMON
source $HOME/.config/nvim/config/commands.vim
source $HOME/.config/nvim/config/autocmds.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/nord.vim

" Personal plugins

source $HOME/.config/nvim/config/_whichkey.vim
source $HOME/.config/nvim/config/_session.vim
source $HOME/.config/nvim/config/_editor.vim
source $HOME/.config/nvim/config/_telescope.vim
source $HOME/.config/nvim/config/_nvimtree.vim
source $HOME/.config/nvim/config/_search.vim
source $HOME/.config/nvim/config/_find.vim
source $HOME/.config/nvim/config/_lf.vim

lua require('_indent_blankline_nvim')
lua require('_fzf')
lua require('_coc')
" lua require('_nvimtree')

if PlugLoaded('coc.nvim')
  source $HOME/.config/nvim/config/_coc.vim
else
  lua require('_lsp')
  lua require('_compe')
endif

" lua require('_treesitter')
" lua require('_tabline')
" lua require('_lualine')

source $HOME/.config/nvim/config/_git.vim
" source $HOME/.config/nvim/config/_gutentags.vim
source $HOME/.config/nvim/config/_snips.vim
source $HOME/.config/nvim/config/_jump.vim
source $HOME/.config/nvim/config/_wiki.vim
source $HOME/.config/nvim/config/_md.vim
source $HOME/.config/nvim/config/_floaterm.vim
source $HOME/.config/nvim/config/_linter.vim
source $HOME/.config/nvim/config/_debug.vim

source $HOME/.config/nvim/config/_statusline.vim

