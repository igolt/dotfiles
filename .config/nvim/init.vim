syntax enable
filetype plugin indent on

call plug#begin('$XDG_DATA_HOME/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'majutsushi/tagbar'
" Plug 'vim-jp/vim-cpp'
" Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ap/vim-css-color'
" Plug 'universal-ctags/ctags'
call plug#end()

colorscheme gruvbox
