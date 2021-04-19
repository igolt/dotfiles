syntax enable
filetype plugin indent on

call plug#begin('$XDG_DATA_HOME/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme gruvbox
