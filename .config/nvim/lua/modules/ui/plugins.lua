local ui = {}
local conf = require('modules.ui.config')

ui['gruvbox-community/gruvbox'] = {
  opt = true,
  config = conf.gruvbox
}

ui['glepnir/zephyr-nvim'] = {
  opt = true,
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['sainnhe/gruvbox-material'] = {
  config = [[vim.cmd('colorscheme gruvbox-material')]]
}

ui['marko-cerovac/material.nvim'] = {
  opt = true,
  config = conf.material_nvim
}

ui['Mofiqul/vscode.nvim'] = {
  opt = true,
  config = function ()
    vim.g.vscode_style = 'dark'
    vim.cmd [[colorscheme vscode]]
  end
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['hoob3rt/lualine.nvim'] = {
  config = conf.lualine,
  requires = {'kyazdani42/nvim-web-devicons', opt = true},
}

ui['lukas-reineke/indent-blankline.nvim'] = {
  event = 'BufRead',
  config = conf.indent_blakline
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim', opt=true}
}

ui['norcalli/nvim-colorizer.lua'] = {
  config = function ()
    require('colorizer').setup({
      'sh', 'yml', 'yaml', 'html', 'javascript', 'css', 'scss', 'conf',
      'dosini'
    }, {
      mode = 'background'
    })
  end
}

return ui
