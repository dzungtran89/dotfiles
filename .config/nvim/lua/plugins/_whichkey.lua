local fn = vim.fn

vim.o.timeoutlen = 300

-- Global mappings
local mappings = {
  e = {
    name = "explorer",
  },

  b = {
    name = "buffers",
  },
  
  f = {
    name = "file",
    -- f = { "<cmd>Telescope find_files<cr>" , "Find File" }        ,
    -- r = { "<cmd>Telescope oldfiles<cr>"   , "Open Recent File" } ,
  },

  s = {
    name = "search",
  },

  t = {
    name = "toggle",
    l = { ":set nu!<cr>"      , "On/Off Line number" },
    h = { ":set hlsearch!<cr>", "On/Off hlsearch" },
    i = { ":set ic!<cr>"      , "On/Off caseinsensitive" },
  },

  c = {
    name = "floaterm",
    l = {":FloatermNew lazygit<CR>"   , "lazygit"} ,
    g = {":FloatermNew tig<CR>"       , "tig"}     ,
    n = {":FloatermNew nnn<CR>"       , "nnn"}     ,
    v = {":FloatermNew gitui<CR>"     , "gitui"}   ,
  },
}

local buffer_mappings = {
  t = {
    name = "toggle",
    i = { ":IndentLinesToggle<cr>", "On/Off Indent Lines" },
  }
}

local wk = require("which-key")
wk.register( mappings, { prefix = "<leader>" } )
wk.register( buffer_mappings, { prefix = "<localleader>" } )
