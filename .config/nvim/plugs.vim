" vim:fileencoding=utf-8

" EXPLORER
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'

" EDITOR
Plug 'tpope/vim-commentary'
Plug 'ggandor/lightspeed.nvim'                    " easymotion alternative
Plug 'kylechui/nvim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'junegunn/vim-easy-align'                    " godlygeek/tabular alternative
Plug 'editorconfig/editorconfig-vim'
Plug 'andymass/vim-matchup'
Plug 'Yggdroot/indentLine'
Plug 'Pocco81/true-zen.nvim'

" SYNTAX
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'yioneko/nvim-yati'
Plug 'Jorengarenar/vim-syntaxMarkerFold'

" FUZZY / SEARCH
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'                            " 2022-06-18 back to native vimgrep + rg

" NOTE-TAKINGS / GTD
Plug 'vimwiki/vimwiki'
Plug 'kristijanhusak/orgmode.nvim'
" Plug 'akinsho/org-bullets.nvim'

" LSP
Plug 'neoclide/coc.nvim',    {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
" TODO Move all snippets to coc-snippets
Plug 'dzungtran89/vim-odoo-snippets'

" MISC
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'
" Plug 'voldikss/vim-floaterm'                    " TMP disabled due to perf issue as using terminal
Plug 'sindrets/winshift.nvim'

" CACHING
Plug 'lewis6991/impatient.nvim'
Plug 'tweekmonster/startuptime.vim'
"
" COLORS
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'rebelot/kanagawa.nvim'
