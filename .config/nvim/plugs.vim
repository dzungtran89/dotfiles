" vim:fileencoding=utf-8

" CORE <<<
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                    " required by fugitive to :Gbrowse
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'yioneko/nvim-yati'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

Plug 'junegunn/vim-easy-align'                    " godlygeek/tabular alternative
Plug 'samgriesemer/wiki.vim', {'commit': 'f0db9e3'}
" Keep vim-roam simple and light, thanks to the author 🙏
Plug 'dzungtran89/vim-roam'
Plug 'kristijanhusak/orgmode.nvim'
Plug 'akinsho/org-bullets.nvim'

Plug 'pechorin/any-jump.vim'
Plug 'mileszs/ack.vim'                            " 2022-06-18 back to native vimgrep + rg
Plug 'tpope/vim-eunuch'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

Plug 'Jorengarenar/vim-syntaxMarkerFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'andymass/vim-matchup'

Plug 'folke/which-key.nvim'
Plug 'vimlab/split-term.vim'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/lewis6991/gitsigns.nvim'
" >>>

" FOR FUN <<<
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lualine/lualine.nvim'

Plug 'lewis6991/impatient.nvim'
Plug 'tweekmonster/startuptime.vim'
Plug 'glepnir/dashboard-nvim'
" >>>

" LATER <<<
Plug 'ggandor/lightspeed.nvim'                    " easymotion alternative
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'navarasu/onedark.nvim'
" >>>
