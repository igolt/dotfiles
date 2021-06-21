" -- Windows
nnoremap <silent><leader>h :wincmd h<cr>
nnoremap <silent><leader>j :wincmd j<cr>
nnoremap <silent><leader>k :wincmd k<cr>
nnoremap <silent><leader>l :wincmd l<cr>

nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap FQ <cmd>qa<cr>
nnoremap du 0D
nnoremap Y y$

nnoremap <leader>e :e 
nnoremap <leader>v :vsplit 

nmap <leader>s :s/
nnoremap <leader>S :%s/

nnoremap <silent>=f gg=G

" Terminal
nnoremap <silent><C-u> <cmd>ToggleTerm<cr>
tnoremap <silent><C-u> <C-\><C-n><cmd>ToggleTerm<cr>

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>td <cmd>Telescope vimdots<cr>

" Buffers
nnoremap <leader>bn <cmd>BufferLineCycleNext<cr>
nnoremap <leader>bp <cmd>BufferLineCyclePrev<cr>
nnoremap <leader>bs <cmd>BufferLinePick<cr>
nnoremap <leader>x <cmd>bdelete<cr>

nnoremap <leader>nt <cmd>NvimTreeToggle<cr>

nnoremap <leader>gs <cmd>vertical G<cr>

" ZenMode
nnoremap <leader>zm <cmd>ZenMode<cr>

inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
