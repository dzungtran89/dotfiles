if vim.fn.PlugLoaded('nvim-autopairs') ~= 1 then
  return
end

require('nvim-autopairs').setup({
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})
