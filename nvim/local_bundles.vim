" vim:fileencoding=utf-8

" common {{{

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Plug 'ThePrimeagen/vim-be-good'
" Plug 'lifepillar/vim-colortemplate'

" You would love this
Plug 'ludovicchabant/vim-gutentags'
" }}}

" themes {{{
" Plug 'arcticicestudio/nord-vim'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'

" Plug 'gruvbox-community/gruvbox'
" Plug 'dzungtran89/photon.vim'
" Plug 'dracula/vim', {'dir': '/Users/tran/.config/nvim/plugged/dracula'}
Plug 'edersonferreira/dalton-vim'

Plug 'mhartington/oceanic-next'

" Plug 'lifepillar/vim-gruvbox8'
" Plug 'chriskempson/base16-vim'
" Plug 'barlog-m/oceanic-primal-vim', { 'branch': 'main' }
" Plug 'NieTiger/halcyon-neovim'

" Plug 'andreypopp/vim-colors-plain'
" Plug 'joshdick/onedark.vim'
" Plug 'connorholyday/vim-snazzy'
" Plug 'doums/darcula'
" Plug 'dzungtran89/vim-gruvbox8-mono'
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" }}}

" editor {{{

" Plug 'suxpert/vimcaps'
Plug 'tpope/vim-surround'
Plug 'ronakg/quickr-preview.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'liuchengxu/vim-which-key'
Plug 'pechorin/any-jump.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dyng/ctrlsf.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Plug 'terryma/vim-multiple-cursors'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" wiki / writing
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Plug 'vimwiki/vimwiki'
" Plug 'ducbueno/vimwiki-roam', { 'branch': 'myroam' }

Plug 'samgriesemer/wiki.vim'
Plug 'samgriesemer/vim-roam'

" }}}

" explorer {{{

" Plug 'mcchrish/nnn.vim'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" editorconfig
Plug 'editorconfig/editorconfig-vim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" " snippets
" " replaced by coc-snippets
" Plug 'Jorengarenar/miniSnip'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" Plug 'microsoft/vscode-python'
" Plug 'mstuttgart/vscode-odoo-snippets'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dzungtran89/vim-odoo-snippets'

" }}}

" motion {{{

Plug 'easymotion/vim-easymotion'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" }}}

" git {{{

Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
" required by fugitive to :Gbrowse
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" }}}

" if has('nvim') || has('patch-8.0.902')
"   Plug 'mhinz/vim-signify'
" else
"   Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
" endif

