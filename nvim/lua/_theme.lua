local g = vim.g

if vim.fn.PlugLoaded('gruvbox-flat') then

  vim.g.gruvbox_flat_style = "hard"
  vim.g.gruvbox_italic_functions = true
  vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }
  vim.cmd[[colorscheme gruvbox-flat]]

elseif vim.fn.PlugLoaded('nord-vim') then

  g.nord_bold_vertical_split_line = 1
  g.nord_uniform_diff_background = 1
  g.nord_uniform_status_lines = 1

  vim.cmd[[colorscheme nord]]

end
