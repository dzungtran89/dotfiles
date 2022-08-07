if vim.fn.PlugLoaded('true-zen.nvim') ~=1 then
  return
end

require('true-zen').setup({
  modes = {
    minimalist = {
      options = {
        statusline = "yes"
      }
    }
  }
})
