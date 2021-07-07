-- local ts = require('nvim-treesitter.configs')
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'lua', 'rust', 'python', 'vue', 'yaml', 'javascript',
    'css', 'html', 'json', 'typescript', 'tsx', 'bash'
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}
