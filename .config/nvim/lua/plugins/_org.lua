if vim.fn.PlugLoaded('orgmode.nvim') ~= 1 then
  return
end

require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/Nextcloud/vimwiki/diary/**/*.org'},
  org_default_notes_file = '~/Nextcloud/vimwiki/diary/todo.org',
  org_todo_keywords = {'TODO(t)', 'WAITING(w)', '|', 'DONE(d)', 'DELEGATED(e)'},
  -- org_todo_keyword_faces = {
  --   WAITING = ':foreground blue :weight bold',
  --   DELEGATED = ':background #FFFFFF :slant italic :underline on',
  --   TODO = ':background #000000 :foreground red', -- overrides builtin color for `TODO` keyword
  -- }
})

if vim.fn.PlugLoaded('org-bullets.nvim') ~= 1 then
  return
end

require("org-bullets").setup {
  concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
  symbols = {
    -- headlines can be a list
    headlines = { "◉", "○", "✸", "✿" },
    -- or a function that receives the defaults and returns a list
    headlines = function(default_list)
      table.insert(default_list, "♥")
      return default_list
    end,
    checkboxes = {
      cancelled = { "", "OrgCancelled" },
      done = { "✓", "OrgDone" },
      todo = { "˟", "OrgTODO" },
    },
  }
}
