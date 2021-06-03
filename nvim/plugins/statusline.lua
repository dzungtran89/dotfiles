if has_key(plugs, 'lualine.nvim')
  
lua << EOF

local lualine = require('lualine')

-- Color table for highlights
local colors = {
  -- bg       = '#202328',
  bg       = '#32302f',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67'
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
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
    }
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
    lualine_a = {},
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

ins_left {
  function() return '▊' end,
  color = {fg = colors.blue}, -- Sets highlighting of component
  left_padding = 0 -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red
    }
    vim.api.nvim_command(
        'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" ..
            colors.bg)
    return ' '
    -- return ''
  end,
  color = "LualineMode",
  left_padding = 0
}

-- ins_left {
--   -- filesize component
--   function()
--     local function format_file_size(file)
--       local size = vim.fn.getfsize(file)
--       if size <= 0 then return '' end
--       local sufixes = {'b', 'k', 'm', 'g'}
--       local i = 1
--       while size > 1024 do
--         size = size / 1024
--         i = i + 1
--       end
--       return string.format('%.1f%s', size, sufixes[i])
--     end
--     local file = vim.fn.expand('%:p')
--     if string.len(file) == 0 then return '' end
--     return format_file_size(file)
--   end,
--   condition = conditions.buffer_not_empty
-- }

ins_left {
  'filename',
  condition = conditions.buffer_not_empty,
  color = {fg = colors.magenta, gui = 'bold'}
}

ins_left {'location'}

ins_left {'progress', color = {fg = colors.fg, gui = 'bold'}}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info = ' '},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {function() return '%=' end}

ins_right {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = {fg = '#ffffff', gui = 'bold'}
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  upper = true, -- I'm not sure why it's upper case either ;)
  condition = conditions.hide_in_width,
  color = {fg = colors.green, gui = 'bold'}
}

ins_right {
  'fileformat',
  upper = true,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = {fg = colors.green, gui = 'bold'}
}

ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = {fg = colors.violet, gui = 'bold'}
}

-- ins_right {
--   'diff',
--   -- Is it me or the symbol for modified us really weird
--   -- symbols = {added = ' ', modified = '柳 ', removed = ' '},
--   symbols = {added = ' ', modified = '🙋 ', removed = ' '},
--   color_added = colors.green,
--   color_modified = colors.orange,
--   color_removed = colors.red,
--   condition = conditions.hide_in_width
-- }

ins_right {
  function() return '▊' end,
  color = {fg = colors.blue},
  right_padding = 0
}

-- Now don't forget to initialize lualine
lualine.setup(config)

EOF

elseif has_key(plugs, 'lightline.vim')

  " set tabline="%1t"

  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'separator': { 'left': "", 'right': "" },
        \ 'active': {
        \   'left': [
        \       [ 'gitbranch', 'mode' ],
        \       [ 'readonly', 'modified', 'tagbar' ]
        \   ],
        \   'right': [
        \       ['percent'],
        \       ['lineinfo'],
        \       ['cocstatus', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'gitbranch' : 'FugitiveHead',
        \   'cocstatus' : 'coc#status'
        \ },
        \ 'component': {
        \   'lineinfo': '%3l:%-2v%<',
        \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
        \ },
        \ 'mode_map': {
        \ 'n' : 'N',
        \ 'r' : 'Prompt',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'Vim Ex',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'Terminal',
        \ },
        \
        \'enable': { 'tabline': 0 }
        \
        \ }

elseif has_key(plugs, 'vim-airline')

  let g:airline_extensions = []
  let g:airline#extensions#tabline#enabled = 0

else

  " Statusline & Tabline/Buffer line
  " Dynamically getting the fg/bg colors from the current colorscheme,
  "   returns hex which is enough for me to use in Neovim
  " Needs to figure out how to return cterm values too
  " let fgcolor=synIDattr(synIDtrans(hlID("Normal")), "fg", "gui")
  " let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")

  " Statusline
  " https://github.com/Greduan/dotfiles/blob/76e16dd8a04501db29989824af512c453550591d/vim/after/plugin/statusline.vim

  let g:currentmode={
        \ 'n'   : 'N ',
        \ 'no'  : 'N·Operator Pending ',
        \ 'v'   : 'V ',
        \ 'V'   : 'V·Line ',
        \ 'x22' : 'V·Block ',
        \ 's'   : 'Select ',
        \ 'S'   : 'S·Line ',
        \ 'x19' : 'S·Block ',
        \ 'i'   : 'I ',
        \ 'R'   : 'R ',
        \ 'Rv'  : 'V·Replace ',
        \ 'c'   : 'Command ',
        \ 'cv'  : 'Vim Ex ',
        \ 'ce'  : 'Ex ',
        \ 'r'   : 'Prompt ',
        \ 'rm'  : 'More ',
        \ 'r?'  : 'Confirm ',
        \ '!'   : 'Shell ',
        \ 't'   : 'Terminal ',
        \ "\<C-v>": 'VB',
        \}

  hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
  hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
  hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
  hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

  " Find out current buffer's size and output it.
  function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
      let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
      let mbytes = kbytes / 1000
    endif

    if bytes <= 0
      return '0'
    endif

    if (exists('mbytes'))
      return mbytes . 'MB '
    elseif (exists('kbytes'))
      return kbytes . 'KB '
    else
      return bytes . 'B '
    endif
  endfunction

  function! ReadOnly()
    if &readonly || !&modifiable
      return ''
    else
      return ''
    endif
  endfunction

  function! GitInfo()
    let git = fugitive#head()
    if git != ''
      return git
      " return ' '.fugitive#head()
    else
      return ''
    endif
  endfunction

  " http://stackoverflow.com/a/10416234/213124
  " set statusline+=%{neomake#statusline#LoclistStatus()}                 " Neomake errors
  " set statusline+=%8*\ %{ObsessionStatus()}                             " Obsession indicator
  " set statusline+=%1*\ %-3(%{FileSize()}%)                              " File size
  set laststatus=2
  set statusline=
  set statusline+=%0*\ %{toupper(g:currentmode[mode()])}                " Current mode
  set statusline+=%2*\ [%{GitInfo()}]                                     " Git Branch name
  set statusline+=%2*\ %<%f\ %{ReadOnly()}\ %m\ %w                         " File+path
  " set statusline+=%2*\ %{NearestMethodOrFunction()}
  set statusline+=%#warningmsg#
  set statusline+=%*
  set statusline+=%3*\ %=                                               " Space
  " set statusline+=%8*\ %{gutentags#statusline('[Generating\ tags...]')} " Tags generation
  set statusline+=%1*\ [%n]                                             " buffernr
  set statusline+=%1*\ %y\                                              " FileType
  set statusline+=%2*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\              " Encoding & Fileformat
  set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                              " Rownumber/total (%)

endif
