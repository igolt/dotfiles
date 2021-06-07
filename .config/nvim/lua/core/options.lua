local global_local = {
  encoding       = "utf-8",
  -- clipboard      = 'unnamedplus',
  backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",

  tabstop        = 2,
  softtabstop    = 2,
  shiftwidth     = 0,
  wrap           = false,
  expandtab      = true,
  smartindent    = true,
  hidden         = true,
  wildignorecase = true,

  relativenumber = true,
  number         = true,
  hlsearch       = false,
  inccommand     = 'split',
  listchars      = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←',
  list           = true,

  swapfile       = false,
  backup         = false,
  undofile       = true,

  completeopt    = 'menuone,noselect',
  incsearch      = true,
  termguicolors  = true,
  sidescrolloff  = 20,
  scrolloff      = 10,
  colorcolumn    = '80',
  signcolumn     = 'yes',
}

for name, value in pairs(global_local) do
  vim.o[name] = value
end
