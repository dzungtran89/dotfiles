local g = vim.g
local fn = vim.fn
local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

if fn.PlugLoaded('nvim-treesitter') == 1 then
  require('plugins._treesitter')
end

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

if fn.PlugLoaded('Navigator.nvim') == 1 then
  require('plugins._tmux')
end

if fn.PlugLoaded('lualine.nvim') == 1 then
  require('plugins._lualine')
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

if fn.PlugLoaded('neo-tree.nvim') == 1 then
  require("neo-tree").setup()
  vim.cmd([[nnoremap \ :NeoTreeReveal<cr>]])
end

if fn.PlugLoaded('mini.nvim') == 1 then
  require('mini.surround').setup({
    mappings = {
      add =            'gs',  -- Add surrounding
      delete =         'gsd', -- Delete surrounding
      find =           'gsf', -- Find surrounding (to the right)
      find_left =      'gsF', -- Find surrounding (to the left)
      highlight =      'gsh', -- Highlight surrounding
      replace =        'gsr', -- Replace surrounding
      update_n_lines = 'gsn', -- Update `n_lines`
    },
  })
  require('mini.pairs').setup()
end

if fn.PlugLoaded('indent-blankline.nvim') == 1 then
  require("indent_blankline").setup {
    enabled = false,
    show_first_indent_level = false,
    show_end_of_line = true,
    space_char_blankline = " ",
  }
end

-- GIT
require('plugins._git')

-- MAPPINGS
require('plugins._whichkey')
