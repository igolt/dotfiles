local telescope = require('telescope')
telescope.setup {
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    }
  }
}

telescope.load_extension('fzy_native')

local M = {}
M.search_vimdots = function()
  require("telescope.builtin").find_files({
    prompt_title = "VimDots",
    cwd = "$XDG_CONFIG_HOME/nvim",
  })
end

return M
