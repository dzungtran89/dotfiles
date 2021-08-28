local fn = vim.fn

if fn.PlugLoaded('neorg') == 1 then
  require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.norg.dirman"] = { -- Manage your directories with Neorg
        config = {
          workspaces = {
            my_workspace = "~/neorg"
          }
        }
      }
    },
  }
elseif fn.PlugLoaded('orgmode.nvim') == 1 then

  require('orgmode').setup({
      org_agenda_files = {'~/code/github/abc-og/org/*'},
      org_default_notes_file = '~/code/github/abc-og/org/gtd.org',
    })

  require("org-bullets").setup {
    symbols = { "◉", "○", "✸", "✿" }
  }
end
