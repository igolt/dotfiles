local config = {}

function config.nvim_tree()
  -- On Ready Event for Lazy Loading work
  require("nvim-tree.events").on_nvim_tree_ready(function()
    vim.cmd("NvimTreeRefresh")
  end
  )
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_bindings = {
    ["l"] = "<cmd>lua require'nvim-tree'.on_keypress('edit')<CR>",
    ["s"] = "<cmd>lua require'nvim-tree'.on_keypress('vsplit')<CR>",
    ["i"] = "<cmd>lua require'nvim-tree'.on_keypress('split')<CR>",
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

function config.gruvbox()
  vim.g.gruvbox_invert_selection = 0
  vim.g.gruvbox_italic = 1
  vim.cmd('autocmd vimenter * ++nested colorscheme gruvbox')
end

function config.lualine()
  require'lualine'.setup {
    options = {
      icons_enabled = true,
      theme = 'gruvbox',
      component_separators = {'|', '|'},
      section_separators = {'', ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {
        'filename',
        {
          'diagnostics',
          sources = {'nvim_lsp'},
        }
      },
      lualine_x = {},
      lualine_y = {
        {'o:encoding', upper = true},
        {'fileformat', icons_enabled = false, upper = true},
        {'filetype'},
      },
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
end

function config.indent_blakline()
  vim.cmd [[nnoremap <leader><leader>i <cmd>IndentBlanklineToggle<cr>]]
  vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_filetype_exclude = {
    "startify",
    "dashboard",
    "dotooagenda",
    "log",
    "fugitive",
    "gitcommit",
    "packer",
    "vimwiki",
    "markdown",
    "json",
    "txt",
    "vista",
    "help",
    "todoist",
    "NvimTree",
    "peekaboo",
    "git",
    "TelescopePrompt",
    "undotree",
    "flutterToolsOutline",
    "" -- for all buffers without a file type
  }
  vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
  vim.g.indent_blankline_show_trailing_blankline_indent = false
end

return config
