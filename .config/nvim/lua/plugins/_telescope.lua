if vim.fn.PlugLoaded('telescope.nvim') ~= 1 then
  return
end

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      vertical = {
        mirror = false,
        width = 0.75
      },
      horizontal = {
        mirror = false,
        width = 0.75,
        height = 0.7,
        preview_width = 0.6,
        preview_height = 0.8,
        preview_cutoff = 120,
        prompt_position = "bottom",
      }
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
-- Candidates
map('n' , '<leader>ft' , '<cmd>Telescope <cr>'           , {noremap = true})
map('n' , '<leader>ff' , '<cmd>Telescope find_files<cr>' , {noremap = true})
map('n' , '<leader>fg' , '<cmd>Telescope live_grep<cr>'  , {noremap = true})
map('n' , '<leader>fb' , '<cmd>Telescope buffers<cr>'    , {noremap = true})
map('n' , '<leader>fh' , '<cmd>Telescope help_tags<cr>'  , {noremap = true})
