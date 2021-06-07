local ui = {}
local conf = require('modules.ui.config')

ui['gruvbox-community/gruvbox'] = {
  config = [[vim.cmd('autocmd vimenter * ++nested colorscheme gruvbox')]]
}

ui['glepnir/zephyr-nvim'] = {
  -- config = [[vim.cmd('colorscheme zephyr')]]
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['kyazdani42/nvim-tree.lua'] = {
  -- cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['glepnir/galaxyline.nvim'] = {
  branch = 'main',
  config = conf.galaxyline,
  requires = 'kyazdani42/nvim-web-devicons'
}

return ui
