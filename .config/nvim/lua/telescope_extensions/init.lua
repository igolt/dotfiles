local global = require('core.global')
local M = {}

local function _find_files(title, cur_dir)
  require('telescope.builtin').find_files({
    prompt_title = title,
    cwd = cur_dir
  })
end

return M
