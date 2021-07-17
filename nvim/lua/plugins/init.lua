-- CREDITS
-- https://github.com/mxdevmanuel/dotfiles/blob/master/neovim/.config/nvim/lua/plugins.lua
-- https://github.com/YodaEmbedding/dotfiles/blob/master/nvim/.config/nvim/lua/plugins/init.lua

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[autocmd BufWritePost **/nvim/lua/plugins/init.lua PackerCompile]]

local packer = require("packer")
local util = require("packer.util")

local function packer_spec()
    local use = use;

    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/popup.nvim' , as = 'popup' } 
    use { 'nvim-lua/plenary.nvim', as = 'plenary' }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "alvarosevilla95/luatab.nvim" }

    -- Debug
    use { 'mfussenegger/nvim-dap', opt = true, }

    -- -- Telescope
    use { 'nvim-telescope/telescope.nvim',
        requires = {
            'popup',
            'plenary'
        }
    } 

    -- Org
    use { "vhyrro/neorg", ft = "norg", requires = 'plenary' }

end
-- }}}

-- Compile packs
local compile_path = util.join_paths(
    vim.fn.stdpath("config"), "generated", "packer_compiled.vim"
    )

local packer_config = {
    compile_path = compile_path,
}

-- Load on startup
packer.startup {
    packer_spec,
    config = packer_config
}

vim.cmd("source" .. compile_path)
