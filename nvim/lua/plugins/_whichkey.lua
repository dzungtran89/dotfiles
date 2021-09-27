local fn = vim.fn

vim.o.timeoutlen = 500

local wk = require("which-key")
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
    l = { ":setl nu!<cr>"       , "On/Off Line number" } ,
    h = { ":setl hlsearch!<cr>" , "On/Off hlsearch" }    ,
    i = { ":setl ic!<cr>"       , "On/Off caseinsensitive" }    ,
  },

  c = {
    name = "floaterm",
    l = {":FloatermNew lazygit<CR>" , "lazygit"} ,
    g = {":FloatermNew tig<CR>"     , "tig"}     ,
    n = {":FloatermNew nnn<CR>"     , "nnn"}     ,
  },

  -- w = {
  --   name = "windows",
  --   w     = {"<C-W>w"      , "other-window"}          ,
  --   ["-"] = {"<C-W>s"      , "split-window-below"}    ,
  --   ["|"] = {"<C-W>v"      , "split-window-right"}    ,
  --   ["2"] = {"<C-W>v"      , "layout-double-columns"} ,
  --   H     = {"<C-W>5<"     , "expand-window-left"}    ,
  --   J     = {":resize +5"  , "expand-window-below"}   ,
  --   L     = {"<C-W>5>"     , "expand-window-right"}   ,
  --   K     = {":resize -5"  , "expand-window-up"}      ,
  --   ["="] = {"<C-W>="      , "balance-window"}        ,
  --   ["?"] = {"Windows"     , "fzf-window"}            ,
  --   q     = {"<C-W>q"      , "close-window"}          ,
  -- }
}

wk.register( mappings, { prefix = "<leader>" } )
