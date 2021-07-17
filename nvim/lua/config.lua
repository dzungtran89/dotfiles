local packer_plugins = packer_plugins

if packer_plugins["nvim-dap"].loaded then
  local dap = require('dap')
  dap.adapters.python = {
    type = 'executable',
    command = os.getenv('VIRTUAL_ENV') .. '/bin/python',
    args = {'-m', 'debugpy.adapter'}
  }
end

if packer_plugins["hop.nvim"] and packer_plugins["hop.nvim"].loaded then
  require('hop').setup {
    keys = 'etovxqpdygfblzhckisuran',
    term_seq_bias = 0.5
  }
end

if packer_plugins["telescope.nvim"] and packer_plugins["telescope.nvim"].loaded then
  require('plugins._telescope')
end

if packer_plugins["luatab.nvim"] and packer_plugins["luatab.nvim"].loaded then
  vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'
end

if packer_plugins["nvim-tabline"] and packer_plugins["nvim-tabline"].loaded then
  require('tabline').setup{
    show_index = true,    -- show tab index
    show_modify = true,   -- show buffer modification indicator
    no_name = '[No name]' -- no name buffer name
  }
end
