if vim.fn.PlugLoaded('nvim-colorizer.lua') ~= 1 then
  return
end

require('colorizer').setup({
    'css';
    'javascript';
    'html';
  }
)

vim.api.nvim_set_keymap('n', '<leader>tc', ':ColorizerToggle <cr>', {noremap = true})
