let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap FQ :qa<CR>
nnoremap du 0D
nnoremap Y y$

nnoremap <leader>e :e 
nnoremap <leader>v :vsplit 

noremap <leader>s :s/
nnoremap <leader>S :%s/

" Buffers
nnoremap <leader>bn :BufferNext<CR>
nnoremap <leader>bp :BufferPrevious<CR>
nnoremap <leader>bs :BufferPick<CR>
nnoremap <leader>x :BufferClose<CR>

" Telescope
nnoremap <C-P> :Telescope find_files<CR>
nnoremap <leader>nt :Telescope file_browser<CR>

" Terminal
nnoremap <silent> <C-u> :ToggleTerm<Enter>
tnoremap <silent> <C-u> <C-\><C-n>:ToggleTerm<Enter>

" Completion
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Cyclist
nnoremap <leader>cn :call cyclist#next_listchar()<CR>
nnoremap <leader>cp :call cyclist#prev_listchar()<CR>
