local telescope = 'telescope.nvim'
local global = require('core.global')
local packer = require('packer')
local M = {}

local function _find_files(title, cur_dir)
  require('telescope.builtin').find_files({
    prompt_title = title,
    cwd = cur_dir
  })
end

function M.vimdots()
  _find_files('VimDots', global.vim_path)
end

function M.packages()
  _find_files('Packages', global.data_dir)
end

return M
