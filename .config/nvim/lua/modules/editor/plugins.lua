local editor = {}
local conf = require('modules.editor.config')

editor['tpope/vim-commentary'] = {event = 'BufRead'}

editor['editorconfig/editorconfig-vim'] = {event = 'BufRead'}

editor['tpope/vim-surround'] = {event = 'BufRead'}

editor['andymass/vim-matchup'] = {
  event = 'BufEnter',
  config = conf.vim_matchup
}

editor['godlygeek/tabular'] = {event = 'BufRead',}

editor['akinsho/nvim-toggleterm.lua'] = {
  config = conf.toggleterm
}

editor['tpope/vim-repeat'] = {}

editor['folke/zen-mode.nvim'] = {
  cmd = 'ZenMode'
}

editor['numToStr/BufOnly.nvim'] = {cmd = 'BufOnly'}

return editor
