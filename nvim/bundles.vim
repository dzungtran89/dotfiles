" vim:fileencoding=utf-8

" CORE {{{
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                    " required by fugitive to :Gbrowse
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'preservim/tagbar'
Plug 'numToStr/Comment.nvim'
" Plug 'nathom/filetype.nvim'

" RIP {{{

" Plug 'tpope/vim-commentary'
" Plug 'dense-analysis/ale'
" Plug 'airblade/vim-gitgutter'
" Plug 'rstacruz/vim-closer'
" Plug 'liuchengxu/vim-which-key'

let g:polyglot_disabled = [
      \'ftdetect',
      \'python', 'go', 'c', 'vim', 'lua', 'sh',
      \'xml', 'html', 'javascript',
      \'markdown', 'yaml',
      \'org', 'txt', 'rst',
      \'git'
      \]
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

"" SNIPPETS {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" NOTE-TAKING {{{
Plug 'godlygeek/tabular'
Plug 'samgriesemer/wiki.vim', {'commit': 'f0db9e3'}
Plug 'samgriesemer/vim-roam', {'commit': '7688e18'}
Plug 'kristijanhusak/orgmode.nvim'
Plug 'akinsho/org-bullets.nvim'

" SEARCHING {{{
Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'brooth/far.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
" Plug 'ms-jpq/coq_nvim'
" Plug 'neovim/nvim-lspconfig'

" MISC {{{
" Plug 'Konfekt/FastFold'
Plug 'Jorengarenar/vim-syntaxMarkerFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'

"" Better if exit vim by <prefix><motion>
" Plug 'numToStr/Navigator.nvim'
Plug 'folke/which-key.nvim'
Plug 'vimlab/split-term.vim'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" DEBUGGING {{{
" Plug 'mfussenegger/nvim-dap' | Plug 'mfussenegger/nvim-dap-python'
" Plug 'rcarriga/nvim-dap-ui'

" FOR FUN {{{

Plug 'nvim-lualine/lualine.nvim'              " {'commit': '017620b'}
" Plug 'nanozuki/tabby.nvim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'lewis6991/impatient.nvim'
Plug 'tweekmonster/startuptime.vim'

" Required plenary
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'alec-gibson/nvim-tetris'

" LATER {{{
" Plug 'monaqa/dial.nvim'
" Plug 'posva/vim-vue'
" Plug 'leafOfTree/vim-vue-plugin'
" Plug 'mattn/emmet-vim'
" Plug 'ggandor/lightspeed.nvim'                  " easymotion alternative
" Plug 'pwntester/octo.nvim'                      " github actions
" Plug 'SmiteshP/nvim-gps'                        " tagbar alternative
