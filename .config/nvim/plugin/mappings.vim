" -- Windows
nnoremap <silent><C-h> :wincmd h<cr>
nnoremap <silent><C-j> :wincmd j<cr>
nnoremap <silent><C-k> :wincmd k<cr>
nnoremap <silent><C-l> :wincmd l<cr>

nnoremap <Esc> <Cmd>noh<Cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap FQ <cmd>qa<cr>
nnoremap du 0D
nnoremap Y y$

nnoremap <leader>e :e 
nnoremap <leader>v :vsplit 

noremap <leader>s :s/
nnoremap <leader>S :%s/

nnoremap <silent>=f gg=G

" Terminal
nnoremap <silent><C-u> :ToggleTerm<cr>
tnoremap <silent><C-u> <C-\><C-n><cmd>ToggleTerm<cr>

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>td <cmd>Telescope vimdots<cr>

" Buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprevious<cr>
nnoremap <leader>b  <cmd>BufferLinePick<cr>
nnoremap <leader>x  <cmd>bdelete<cr>

nnoremap <C-n> <cmd>NvimTreeToggle<cr>

nnoremap <leader>gs <cmd>vertical G<cr>

" ZenMode
nnoremap <leader>zm <cmd>ZenMode<cr>

inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')

imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
