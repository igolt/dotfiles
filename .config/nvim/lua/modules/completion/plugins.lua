local completion = {}
local conf = require('modules.completion.config')

completion['jose-elias-alvarez/nvim-lsp-ts-utils'] = {}

completion['jose-elias-alvarez/null-ls.nvim'] = {}

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp
}

completion['glepnir/lspsaga.nvim'] = {}

completion['hrsh7th/cmp-vsnip'] = {}
completion['hrsh7th/cmp-nvim-lsp'] = {}
completion['hrsh7th/cmp-buffer'] = {}
completion['hrsh7th/nvim-cmp'] = {config = conf.nvim_cmp}

completion['hrsh7th/vim-vsnip'] = {config = conf.vim_vsnip}

completion['windwp/nvim-autopairs'] = {config = conf.autopairs}

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
