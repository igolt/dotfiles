set completeopt=noselect,noinsert,menuone,noinsert
set shortmess+=c
"
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
autocmd BufEnter * lua require('completion').on_attach()
