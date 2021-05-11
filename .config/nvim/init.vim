set nocompatible
filetype off

call plug#begin('$XDG_DATA_HOME/nvim/plugged')
Plug 'romgrk/barbar.nvim'
Plug 'hoob3rt/lualine.nvim'
" Plug 'tjdevries/cyclist.vim'

" Colorschemes
Plug 'vigoux/vim' "Dracula
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'glepnir/zephyr-nvim'
Plug 'gruvbox-community/gruvbox'

Plug 'akinsho/nvim-toggleterm.lua'

Plug 'jiangmiao/auto-pairs'

Plug 'rust-lang/rust.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ap/vim-css-color'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
call plug#end()

set runtimepath^=~/.local/share/vim/my_plugins/cyclist.vim

lua require('init')

syntax enable
filetype plugin indent on

" Set colorscheme
let g:gruvbox_invert_selection = '0'
let g:gruvbox_italic=1
colorscheme gruvbox
