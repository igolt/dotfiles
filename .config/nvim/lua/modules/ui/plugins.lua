local ui = {}
local conf = require('modules.ui.config')

local colorscheme_list = {
  gruvbox = {
    git = 'gruvbox-community/gruvbox',
    packer_config = {
      config = conf.gruvbox
    }
  },

  ['zephyr-nvim'] = {
    git = 'glepnir/zephyr-nvim',
    packer_config = {
      config = [[vim.cmd('colorscheme zephyr')]]
    }
  },

  ['gruvbox-material'] = {
    git = 'sainnhe/gruvbox-material',
    packer_config = {
      config = [[vim.cmd('colorscheme gruvbox-material')]]
    },
  },

  ['material.nvim'] = {
    git = 'marko-cerovac/material.nvim',
    packer_config = {
      config = conf.material_nvim
    }
  },

  ['vscode.nvim'] = {
    git = 'Mofiqul/vscode.nvim',
    packer_config = {
      config = function ()
        vim.g.vscode_style = 'dark'
        vim.cmd [[colorscheme vscode]]
      end
    }
  },

  ['omni.vim'] = {
    git = 'yonlu/omni.vim',
    packer_config = {
      config = function ()
        vim.cmd [['colorscheme omni']]
      end
    }
  }
}


local function set_colorscheme(colorscheme)
  for cs, value in pairs(colorscheme_list) do
    local packer_config = value.packer_config

    packer_config.opt = cs ~= colorscheme
    ui[value.git] = packer_config
  end
end

set_colorscheme('gruvbox-material')

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
