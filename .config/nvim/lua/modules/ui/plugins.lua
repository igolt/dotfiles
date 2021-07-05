local ui = {}
local conf = require('modules.ui.config')

ui['gruvbox-community/gruvbox'] = {
  -- config = conf.gruvbox
}

ui['glepnir/zephyr-nvim'] = {
  -- config = [[vim.cmd('colorscheme zephyr')]]
}

ui['marko-cerovac/material.nvim'] = {
  config = conf.material_nvim
}

ui['Mofiqul/vscode.nvim'] = {
  -- config = function ()
  --   vim.g.vscode_style = 'dark'
  --   vim.cmd [[colorscheme vscode]]
  -- end
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

ui['norcalli/nvim-colorizer.lua'] = {
  config = function ()
    require('colorizer').setup({
      'sh', 'yml', 'yaml', 'html', 'javascript', 'css', 'scss', 'conf'
    }, {
      mode = 'background'
    })
  end
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim', opt=true}
}

return ui
