-- INFO   : Heavily inspired by: Eviline config for lualine
-- Source : https://gist.github.com/hoob3rt/b200435a765ca18f09f83580a606b878
-- Author : shadmansaleh
-- Credit : glepnir

-- Changes:
-- - Disable `expand` to respect the workspace's root dir
-- - Add disabled_filetypes

local lualine = require('lualine')

-- Color table for highlights
local colors = {
  -- bg       = '#202328',
  -- violet   = '#6845ad',
  bg       = '#32302f',
  fg       = '#bbc2cf',
  yellow   = '#e3d18a',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#598030',
  orange   = '#c57339',
  violet   = '#c792ea',
  magenta  = '#cc517a',
  blue     = '#2d539e',
  red      = '#cc3768'
}

local conditions = {
  -- buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  -- check_git_workspace = function()
  --   local filepath = vim.fn.expand('%:p:h')
  --   local gitdir = vim.fn.finddir('.git', filepath .. ';')
  --   return gitdir and #gitdir > 0 and #gitdir < #filepath
  -- end
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {c = {fg = colors.fg, bg = colors.bg}},
      inactive = {c = {fg = colors.fg, bg = colors.bg}}
    },
    disabled_filetypes = {'fzf', 'coc-explorer', 'ctrlsf', 'tagbar'},
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {'filename'},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- ins_left {
--   function() return '▊' end,
--   color = {fg = colors.blue}, -- Sets highlighting of component
--   left_padding = 0 -- We don't need space before this
-- }

local function mode_map()
  -- auto change color according to neovims mode
  local mode_color = {
    n      = colors.green,
    i      = colors.red,
    v      = colors.blue,
    [''] = colors.blue,
    V      = colors.blue,
    c      = colors.magenta,
    no     = colors.green,
    s      = colors.orange,
    S      = colors.orange,
    [''] = colors.orange,
    ic     = colors.yellow,
    R      = colors.violet,
    Rv     = colors.violet,
    cv     = colors.red,
    ce     = colors.red,
    r      = colors.cyan,
    rm     = colors.cyan,
    ['r?'] = colors.cyan,
    ['!']  = colors.red,
    t      = colors.red
  }
  vim.api.nvim_command(
    'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" ..
    colors.bg)
end

ins_left {
  function()
    mode_map()
    return '▊'          -- , 
  end,
  color = "LualineMode",
  left_padding = 0
}

ins_left {
  'filename',
  left_padding = 0,
  color = {fg = colors.violet, gui = 'bold'}
}

ins_left {
  'progress', 
  condition = conditions.hide_in_width,
  color = {fg = colors.fg, gui = 'bold'},
}
ins_left {
  'location', 
}

-- Tagbar
ins_left {
  function()
    return "%{tagbar#currenttag('%s', '', 'f', 'scoped-stl')}"
  end,
  left_padding = 0,
  icon = '»',
  color = {fg = colors.orange, gui='bold'},
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {function() return '%=' end}

-- Add components to right sections {{{

ins_right {
  -- Lsp server name .
  'coc#status',
  icon = '∥ LSP:',
  color = {fg = colors.yellow, gui = 'bold'},
}

-- ins_right {
--   'diagnostics',
--   sources = {'coc', 'ale'},
--   sections = {'error', 'warn', 'info'},
--   symbols = {error = '░ ', warn = '░ ', info = '░ '},
--   color_error = colors.red,
--   color_warn = colors.yellow,
--   color_info = colors.cyan,
-- }

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  upper = true,
  condition = conditions.hide_in_width,
  color = {fg = colors.green, gui = 'bold'},
}

ins_right {
  function() return "%{get(b:,'gitsigns_head','')}" end,
  icon = '',
  color = {fg = colors.yellow, gui = 'bold'},
  condition = conditions.hide_in_width,
}

ins_right {
  -- 'diff',
  -- symbols = {added = '+', modified = '~', removed = '-'},
  -- color_added = colors.green,
  -- color_modified = colors.orange,
  -- color_removed = colors.red,
  function () return "%{get(b:,'gitsigns_status','')}" end,
  condition = conditions.hide_in_width,
}

ins_right {
  "mode",
  color = "LualineMode",
  right_padding = 0,
}

ins_right {
  function() return '░▒▓' end, -- '▊'
  color = "LualineMode",
  right_padding = 0,
}

-- }}}

lualine.setup(config)
