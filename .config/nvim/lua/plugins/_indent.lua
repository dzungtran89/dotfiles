if vim.fn.PlugLoaded('indent-blankline.nvim') ~= 1 then
  return
end

require("indent_blankline").setup {
  enabled = false,
  show_first_indent_level = false,
  show_end_of_line = true,
  space_char_blankline = " ",
  use_treesitter = true,
  filetype_exclude = { 'dashboard', 'qf', 'git', 'fugitive*'}
}

-- vim.cmd [[let g:indentLine_char = '│']]
