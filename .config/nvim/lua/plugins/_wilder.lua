if vim.fn.PlugLoaded('wilder.nvim') ~= 1 then
  return
end

local wilder = require('wilder')
wilder.setup({
  modes = {':'},
  enable_cmdline_enter = false,
})

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      language = 'vim',
      fuzzy = 1,
      fuzzy_filter = wilder.vim_fuzzy_filter(),
    })
  )
})

-- local highlighters = {
--   wilder.pcre2_highlighter(),
--   wilder.lua_fzy_highlighter(),
-- }

-- local popupmenu_renderer = wilder.popupmenu_renderer(
--   wilder.popupmenu_border_theme({
--     border = 'rounded',
--     empty_message = wilder.popupmenu_empty_message_with_spinner(),
--     highlighter = highlighters,
--   })
-- )

-- local wildmenu_renderer = wilder.wildmenu_renderer({
--   highlighter = highlighters,
--   separator = ' · ',
--   left = {' ', wilder.wildmenu_spinner(), ' '},
--   right = {' ', wilder.wildmenu_index()},
-- })

-- wilder.set_option('renderer', wilder.renderer_mux({
--   [':'] = popupmenu_renderer,
--   ['/'] = wildmenu_renderer,
--   substitute = wildmenu_renderer,
-- }))
