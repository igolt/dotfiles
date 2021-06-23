local config = {}

config.nvim_treesitter = function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {'cpp', 'c', 'html', 'lua', 'javascript', 'typescript'},
    highlight = {enable = true},
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
