local global = {}

function global:load_variables()
  self.home      = os.getenv('HOME')
  self.cache_dir = os.getenv('XDG_CACHE_HOME') or self.home .. '/.cache'
  self.vim_path  = vim.fn.stdpath('config')
  self.data_dir  = vim.fn.stdpath('data') .. '/site'
end

global:load_variables()

return global
