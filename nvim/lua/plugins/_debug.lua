local fn = vim.fn
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

if fn.PlugLoaded("nvim-dap") == 1 then
  local opts = { noremap = true, silent = true }

  local dap = require('dap')
  local dapui = require("dapui")

  -- Keybindings {{{
        buf_set_keymap("v", "<M-k>", "<Cmd>lua require('dapui').eval()<CR>", opts)
  -- }}}

  -- DAP Config
  -- dap.adapters.python = {
  --   type = 'executable',
  --   command = os.getenv('VIRTUAL_ENV') .. '/bin/python',
  --   args = {'-m', 'debugpy.adapter'}
  -- }

  -- DapUI Config
  dapui.setup({
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
      },
      sidebar = {
        open_on_start = true,
        -- You can change the order of elements in the sidebar
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = "scopes",
            size = 0.25, -- Can be float or integer > 1
          },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 00.25 },
        },
        width = 40,
        position = "left", -- Can be "left" or "right"
      },
      tray = {
        open_on_start = true,
        elements = { "repl" },
        height = 10,
        position = "bottom", -- Can be "bottom" or "top"
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
    })

end

