if vim.fn.PlugLoaded('auto-session') ~=1 then
return
end

local opts = {
  -- log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/session/",
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = nil,
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil,
  auto_session_suppress_dirs = {"~/code/projects"},
}

require("auto-session").setup(opts)
