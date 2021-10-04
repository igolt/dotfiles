local config = {}

config.nvim_treesitter = function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      'cpp',
      'c',
      'html',
      'lua',
      'javascript',
      'typescript',
      'php'
    },
    highlight = {enable = true},
    indent = {
      enable = true,
      disable = {'lua', 'c', 'cpp', 'html'}
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        }
      }
    }
  }

  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
  parser_configs.typescript.used_by = "typescriptreact"
end
return config
