local editor = {}

editor['tpope/vim-commentary'] = {
  event = 'BufRead'
}

editor['editorconfig/editorconfig-vim'] = {
  event = 'BufRead'
}

editor['tpope/vim-surround'] = {
  event = 'BufRead'
}

editor['dgraham/vim-eslint'] = {

}

editor['andymass/vim-matchup'] = {
  event = 'BufEnter',
  config = function ()
    vim.g.matchup_matchparen_offscreen = {
      method = 'popup'
    }
  end
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

editor['numToStr/BufOnly.nvim'] = {
  cmd = 'BufOnly'
}

return editor
