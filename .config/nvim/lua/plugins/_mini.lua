if vim.fn.PlugLoaded('mini.nvim') ~= 1 then
  return
end

require('mini.surround').setup({
  mappings = {
    add =            'gs',  -- Add surrounding
    delete =         'gsd', -- Delete surrounding
    find =           'gsf', -- Find surrounding (to the right)
    find_left =      'gsF', -- Find surrounding (to the left)
    highlight =      'gsh', -- Highlight surrounding
    replace =        'gsr', -- Replace surrounding
    update_n_lines = 'gsn', -- Update `n_lines`
  },
})

require('mini.pairs').setup()
