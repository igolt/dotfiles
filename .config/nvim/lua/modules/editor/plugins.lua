local editor = {}

editor['tpope/vim-commentary'] = {
  event = 'BufRead'
}

editor['tpope/vim-surround'] = {
  event = 'BufRead'
}

editor['andymass/vim-matchup'] = {
  event = 'BufEnter',
}

editor['godlygeek/tabular'] = {
  event = 'BufRead',
}

editor['akinsho/nvim-toggleterm.lua'] = {
  cmd = 'ToggleTerm'
}

editor['tpope/vim-repeat'] = {}

editor['folke/zen-mode.nvim'] = {
  cmd = 'ZenMode'
}

return editor
