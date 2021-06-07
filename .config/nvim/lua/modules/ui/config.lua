local config = {}

function config.nvim_tree()
  -- On Ready Event for Lazy Loading work
  require("nvim-tree.events").on_nvim_tree_ready(
    function()
      vim.cmd("NvimTreeRefresh")
    end
  )
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_bindings = {
    ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
    ["s"] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
    ["i"] = ":lua require'nvim-tree'.on_keypress('split')<CR>",
  }
  vim.g.nvim_tree_icons = {
    default =  '',
    symlink =  '',
    git = {
     unstaged = "✚",
     staged =  "✚",
     unmerged =  "≠",
     renamed =  "≫",
     untracked = "★",
    },
  }
end

function config.nvim_bufferline()
  require('bufferline').setup{}
end

function config.galaxyline()
  -- require('modules.ui.voitd_line')
end

function config.gruvbox()
end

return config
