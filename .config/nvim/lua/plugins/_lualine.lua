-- require('plugins._evil_line')

if vim.fn.PlugLoaded('lualine.nvim') ~= 1 then
  return
end

-- Color table for highlights
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local function mode_map()
  -- auto change color according to neovims mode
  local mode_color = {
    n      = colors.blue,
    i      = colors.red,
    v      = colors.green,
    [''] = colors.magenta,
    V      = colors.green,
    c      = colors.red,
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
    'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg
  )
end

require'lualine'.setup {
  options = {
    section_separators = '▒',
    component_separators = '░',
    icons_enabled = false,
    disabled_filetypes = {
      'fzf', 'coc-explorer', 'ctrlsf', 'tagbar', 'netrw', 'fugitiveblame',
      'coctree'
    },
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1,2)
          -- mode_map()
          -- return str:sub(1,3) .. ' ▊'
        end,
        -- color = 'LualineMode',
        -- padding = {left = 0, right=0},
      },
    },
    lualine_c = {
      'diff',
    },
    lualine_b = {
      'filename',
    },

    lualine_x = {
      {
        'diagnostics',
        sources={'coc'},
        update_in_insert = false,
        always_visible = false
      },
    },
    lualine_y = {
      'encoding',
      'progress'
      -- {
      --   'progress',
      --   padding = {left = 0, right = 1}
      -- }
    },
    lualine_z = {
      'location',
      -- {
      --   'filetype',
      --   color = 'LualineMode',
      --   fmt = function(str) return str:sub(1,3) .. ' ▊' end,
      -- }
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        function() return '---' end
      },
      {'filename', path=2}
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'location',
        fmt = function(str) return str .. ' ⏾' end
      }
    }
  },
  tabline = {
    lualine_a = {
      'tabs'
    },
    lualine_b = {
      {'filename', path = 2},
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      'branch'
    },
    lualine_z = {
      {function() return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") end,
      }
    }
  },
  extensions = {}
}
