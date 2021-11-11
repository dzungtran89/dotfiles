local g = vim.g
local fn = vim.fn
local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

if fn.PlugLoaded('filetype.nvim') == 1 then
  if fn.has('nvim-0.5') == 1 then
    g.did_load_filetypes = 1
  end
end

if fn.PlugLoaded("fzf-lua") == 1 then
  require("plugins._fzf")
end

-- DEBUGGING
if fn.PlugLoaded("nvim-dap") == 1 then
  require("plugins._debug")
end

if fn.PlugLoaded("hop.nvim") == 1 then
  require('hop').setup {
    keys = 'etovxqpdygfblzhckisuran',
    term_seq_bias = 0.5
  }
end

if fn.PlugLoaded("telescope.nvim") == 1 then
  require('plugins._telescope')

  -- Candidates
  map('n' , '<leader>ft' , '<cmd>Telescope <cr>'           , {noremap = true})
  map('n' , '<leader>ff' , '<cmd>Telescope find_files<cr>' , {noremap = true})
  map('n' , '<leader>fg' , '<cmd>Telescope live_grep<cr>'  , {noremap = true})
  map('n' , '<leader>fb' , '<cmd>Telescope buffers<cr>'    , {noremap = true})
  map('n' , '<leader>fh' , '<cmd>Telescope help_tags<cr>'  , {noremap = true})

end

if fn.PlugLoaded("nvim-bufferline.lua") == 1 then
  require("bufferline").setup{}
end

if fn.PlugLoaded("nvim-tabline") == 1 then
  require('tabline').setup{
    show_index = true,    -- show tab index
    show_modify = true,   -- show buffer modification indicator
    no_name = '[No name]' -- no name buffer name
  }
end

require('plugins._neorg')

if fn.PlugLoaded('nvim-treesitter') == 1 then
  require('plugins._treesitter')
end

if fn.PlugLoaded('Navigator.nvim') == 1 then
  require('plugins._tmux')
end

if fn.PlugLoaded('lualine.nvim') == 1 then
  -- require('plugins._evil_line')

  require'lualine'.setup {
    options = {
      icons_enabled = true,
      theme = 'nord',
      section_separators = { left = '', right = ''},
      component_separators = { left = '|', right = '|'},
      disabled_filetypes = {'fzf', 'coc-explorer', 'ctrlsf', 'tagbar'},
      always_divide_middle = false,
    },
    sections = {
      lualine_a = {{ 'mode', separator = { left = '', right = ''}}},
      lualine_b = {'branch', 'diff',
      {'diagnostics', sources={'coc'}}},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {{ 'location', separator = { left = '', right = ''}}},
    },
    inactive_sections = {
      lualine_a = {'filename'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
  -- require'tabline'.setup {}
end

if fn.PlugLoaded('nvim-lspconfig') == 1 then
  require'lspconfig'.pyright.setup{}
end

if fn.PlugLoaded('shade.nvim') == 1 then
  require('plugins._shade')
end

if fn.PlugLoaded('nvim-web-devicons') == 1 then
  require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        name = "Zsh"
      }
    };
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
  }

  if fn.PlugLoaded('nvim-tree.lua') == 1 then
    require('plugins._nvimtree')
  end
end

if fn.PlugLoaded('format.nvim') == 1 then
  require "format".setup {
    ["*"] = {
      {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    vim = {
      {
        cmd = {"luafmt -w replace"},
        start_pattern = "^lua << EOF$",
        end_pattern = "^EOF$"
      }
    },
    vimwiki = {
      {
        cmd = {"prettier -w --parser babel"},
        start_pattern = "^{{{javascript$",
        end_pattern = "^}}}$"
      }
    },
    lua = {
      {
        cmd = {
          function(file)
            return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
          end
        }
      }
    },
    go = {
      {
        cmd = {"gofmt -w", "goimports -w"},
        tempfile_postfix = ".tmp"
      }
    },
    javascript = {
      {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
    },
    markdown = {
      {cmd = {"prettier -w"}},
      {
        cmd = {"black"},
        start_pattern = "^```python$",
        end_pattern = "^```$",
        target = "current"
      }
    }
  }
end

if fn.PlugLoaded('nvim-colorizer.lua') == 1 then
  require('colorizer').setup({
      'css';
      'javascript';
      'html';
    }
    )

  map('n', '<leader>tc', ':ColorizerToggle <cr>', {noremap = true})
end

if fn.PlugLoaded('tabby.nvim') == 1 then
  require("tabby").setup({
      tabline = require("tabby.presets").active_wins_at_end,
    })
end

if fn.PlugLoaded('Comment.nvim') == 1 then
  require("Comment").setup({
    ignore = '^$'
  })
end

if fn.PlugLoaded('stabilize.nvim') == 1 then
  require("stabilize").setup({
    force = true, -- stabilize window even when current cursor position will be hidden behind new window
    forcemark = nil, -- set context mark to register on force event which can be jumped to with '<forcemark>
    ignore = {  -- do not manage windows matching these file/buftypes
      filetype = { "help", "list", "Trouble" },
      buftype = { "terminal", "quickfix", "loclist", "ctrlsf" }
    },
    nested = nil
  })
end


-- GIT
require('plugins._git')

-- MAPPINGS
require('plugins._whichkey')
