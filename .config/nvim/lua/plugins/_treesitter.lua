if vim.fn.PlugLoaded('nvim-treesitter') ~= 1 then
  return
end

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

parser_configs.xml = {
  install_info = {
    url = "https://github.com/unhammer/tree-sitter-xml",
    files = { "src/parser.c" },
    branch = "master"
  },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python", "dockerfile", "bash",
    "xml", "javascript", "html", "css",
    "yaml", "rst", "org",
  },
  indent = {
    enable = false,
  },
  yati = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {"po", "pot", "csv"},
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  auto_tag = {
    enable = true,
    filetyles = {"html", "xml"}
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}
