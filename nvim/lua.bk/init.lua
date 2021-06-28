-- Nathan's vim configuration

vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

local packer = require("packer")
local util = require("packer.util")

function packer_spec()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color theme
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'crispgm/nvim-tabline'
  -- use 'itchyny/lightline.vim'
  use 'hoob3rt/lualine.nvim'
  -- use 'famiu/feline.nvim'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'airblade/vim-gitgutter'
  use 'shumphrey/fugitive-gitlab.vim'

  -- Editing nicities
  use {
    'junegunn/fzf.vim',
    -- requires = {
    --   {
    --     'junegunn/fzf',
    --     rtp = '~/.fzf',
    --     run = function() vim.fn['fzf#install'](0) end
    --   }
    -- }
  }

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'ludovicchabant/vim-gutentags'

  use 'easymotion/vim-easymotion'
  use 'christoomey/vim-tmux-navigator'

  -- use 'tpope/vim-repeat'
  -- use 'tpope/vim-unimpaired'
  -- use 'tpope/vim-characterize'
  -- use 'tpope/vim-speeddating'
  -- use 'tpope/vim-rsi'
  -- use 'tpope/vim-abolish'
  -- use 'tpope/vim-sleuth'
  -- use 'AndrewRadev/splitjoin.vim'

  -- Completion
  -- TODO: nvim-compe is cool and hip, but doesn't seem to work great with Ultisnips.
  -- I could be missing something...
  -- use 'hrsh7th/nvim-compe'
  -- use 'ervandew/supertab'

  -- Snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'dzungtran89/vim-odoo-snippets'

  -- -- Tim Pope Extensions
  -- use 'tpope/vim-eunuch'
  -- use 'tpope/vim-vinegar'

  -- -- Show Marks
  -- use 'kshenoy/vim-signature'

  -- -- Show Buffers
  -- use 'junegunn/vim-peekaboo'

  -- -- Search selection with *
  -- use 'nelstrom/vim-visual-star-search'
  use 'dyng/ctrlsf.vim'

  -- Highlight colors
  use 'norcalli/nvim-colorizer.lua'

  -- Text object modifications and extensions
  -- use 'chaoren/vim-wordmotion'
  -- use 'wellle/targets.vim'
  -- use 'kana/vim-textobj-user'
  -- use 'kana/vim-textobj-entire'
  -- use 'whatyouhide/vim-textobj-xmlattr'

  -- Testing
  -- use 'vim-test/vim-test'
  use {'lukas-reineke/indent-blankline.nvim'}
  use 'dhruvasagar/vim-zoom'
  use 'liuchengxu/vim-which-key'
  use 'pechorin/any-jump.vim'
  use 'jeetsukumaran/vim-indentwise'
  use 'ntpeters/vim-better-whitespace'
  use 'kdav5758/HighStr.nvim'
  use 'editorconfig/editorconfig-vim'

  -- File picking
  use {
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-tree.lua',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'voldikss/vim-floaterm'

  -- -- Linting
  -- use {
  --   'dense-analysis/ale',
  --   -- ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   -- cmd = 'ALEEnable',
  --   -- config = 'vim.cmd[[ALEEnable]]'
  -- }
  --

  use 'preservim/tagbar'

  -- use 'neoclide/coc.nvim', {'branch': 'release'}

  -- LSP Support
  lsp_filetypes = {'html', 'css', 'typescript', 'python'}
  use {
    'neovim/nvim-lspconfig',
    -- ft = lsp_filetypes,
    -- config = function() require("lsp") end,
  }

  -- use {
  --   'nathunsmitty/nvim-ale-diagnostic',
  --   -- ft = lsp_filetypes,
  -- }

  -- Treesitter
  ts_filetypes = {'html', 'css', 'typescript', 'python'}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    -- ft = ts_filetypes,
    -- config = function() require("treesitter") end,
  }

  -- use {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   -- ft = ts_filetypes,
  -- }
  -- use {
  --   'nvim-treesitter/playground',
  --   -- ft = ts_filetypes,
  -- }

  -- -- Ruby
  -- use 'tpope/vim-rails'
  -- use 'tpope/vim-endwise'
  -- use 'tpope/vim-rake'
  -- use 'tpope/vim-bundler'

  -- -- Go
  -- use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

  -- -- Terraform
  -- use 'hashivim/vim-terraform'

  ---------------------------------
  -- WIKI / WRITING
  ---------------------------------

  use 'godlygeek/tabular'
  -- use {
  --   'samgriesemer/vim-roam',
  --   requires={{'samgriesemer/wiki.vim'}}
  -- }

end

local compile_path = util.join_paths(
  vim.fn.stdpath("config"), "generated", "packer_compiled.vim"
)

local packer_config = {
  compile_path = compile_path,
}

packer.startup {
  packer_spec,
  config = packer_config
}

vim.cmd("source " .. compile_path)
