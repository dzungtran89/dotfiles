if vim.fn.PlugLoaded("nvim-dap") ~= 1 then
  return
end

local map = vim.api.nvim_set_keymap
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local dap = require('dap')
local dapui = require('dapui')

-- PYTHON {{{
require('dap-python').setup(
  os.getenv('WORKON_HOME') .. '/lotus-export/bin/python3'
  )

dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Attach to running Neovim instance",
    host = function() return "127.0.0.1" end,
    port = function() return 5678 end
  }
}

-- MAPPINGS {{{

local options = {noremap = true}

map('n' , '<leader>dct'  , '<cmd>lua require"dap".continue()<CR>', options)
map('n' , '<leader>dsv'  , '<cmd>lua require"dap".step_over()<CR>', options)
map('n' , '<leader>dsi'  , '<cmd>lua require"dap".step_into()<CR>', options)
map('n' , '<leader>dso'  , '<cmd>lua require"dap".step_out()<CR>', options)
map('n' , '<leader>dtb'  , '<cmd>lua require"dap".toggle_breakpoint()<CR>', options)

map('n' , '<leader>dsc'  , '<cmd>lua require"dap.ui.variables".scopes()<CR>', options)
map('n' , '<leader>dhh'  , '<cmd>lua require"dap.ui.variables".hover()<CR>', options)
map('v' , '<leader>dhv'  , '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', options)

map('n' , '<leader>duh'  , '<cmd>lua require"dap.ui.widgets".hover()<CR>', options)
map('n' , '<leader>duf'  , "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", options)

map('n' , '<leader>dsbr' , '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', options)
map('n' , '<leader>dsbm' , '<cmd>lua require"dap".set_breakpoint(nil, nil , vim.fn.input("Log point message: "))<CR>', options)
map('n' , '<leader>dro'  , '<cmd>lua require"dap".repl.open()<CR>', options)
map('n' , '<leader>drl'  , '<cmd>lua require"dap".repl.run_last()<CR>', options)

-- DAP UI
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
