local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp
}

completion['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

completion['mhartington/formatter.nvim'] = {
  event = 'BufReadPre',
  config = conf.formatter
}

completion['hrsh7th/nvim-compe'] = {
  event = 'InsertEnter',
  config = conf.nvim_compe,
}

completion['hrsh7th/vim-vsnip'] = {
  after = 'nvim-compe',
  config = conf.vim_vsnip
}

completion['windwp/nvim-autopairs'] = {
  after = 'nvim-compe',
  config = conf.autopairs
}

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim', opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
  }
}

return completion
