local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  config = conf.nvim_treesitter,
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

lang['windwp/nvim-ts-autotag'] = {
  after = 'nvim-treesitter',
  config = function()
    require('nvim-ts-autotag').setup()
  end
}

return lang
