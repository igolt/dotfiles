local config = {}

config.nvim_treesitter = function()
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      -- disable = {'lua'},
    },
    indent = {
      enable = true,
      disable = {'lua', 'c', 'cpp'}
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
end
return config
