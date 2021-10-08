local conf = require('modules.completion.config')

local completion = {
  ['neovim/nvim-lspconfig'] = {
    event = 'BufReadPre',
    config = conf.nvim_lsp
  },

  ['windwp/nvim-autopairs'] = {config = conf.autopairs},
  ['hrsh7th/vim-vsnip'] = {config = conf.vim_vsnip},
  ['hrsh7th/cmp-buffer'] = {},
  ['hrsh7th/cmp-vsnip'] = {},

  ['glepnir/lspsaga.nvim'] = {},

  ['jose-elias-alvarez/null-ls.nvim'] = {},
  ['jose-elias-alvarez/nvim-lsp-ts-utils'] = {},

  ['nvim-telescope/telescope.nvim'] = {
    cmd = 'Telescope',
    config = conf.telescope,
    requires = {
      {'nvim-lua/popup.nvim', opt = true},
      {'nvim-lua/plenary.nvim', opt = true},
      {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
    }
  },
}

return completion
