" vim:fileencoding=utf-8

" CORE {{{
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                    " required by fugitive to :Gbrowse
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'echasnovski/mini.nvim'

" RIP {{{

Plug 'tpope/vim-commentary'

" let g:polyglot_disabled = [
"       \'ftdetect',
"       \'python', 'go', 'c', 'vim', 'lua', 'sh',
"       \'xml', 'html', 'javascript',
"       \'markdown', 'yaml',
"       \'org', 'txt', 'rst',
"       \'git'
"       \]

" }}}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'yioneko/nvim-yati'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

"" SNIPPETS {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" NOTE-TAKING {{{
Plug 'godlygeek/tabular'
Plug 'samgriesemer/wiki.vim', {'commit': 'f0db9e3'}
" Keep vim-roam simple and light, thanks to the author 🙏
Plug 'dzungtran89/vim-roam'
Plug 'kristijanhusak/orgmode.nvim'
Plug 'akinsho/org-bullets.nvim'

" SEARCHING {{{
Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'https://github.com/tpope/vim-eunuch'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" MISC {{{
Plug 'Jorengarenar/vim-syntaxMarkerFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'andymass/vim-matchup'

Plug 'folke/which-key.nvim'
Plug 'vimlab/split-term.vim'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/lewis6991/gitsigns.nvim'

" FOR FUN {{{

Plug 'norcalli/nvim-colorizer.lua'

Plug 'lewis6991/impatient.nvim'
Plug 'tweekmonster/startuptime.vim'
Plug 'gelguy/wilder.nvim'

" LATER {{{
Plug 'ggandor/lightspeed.nvim'                    " easymotion alternative
Plug 'rebelot/kanagawa.nvim'
