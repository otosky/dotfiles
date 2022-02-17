lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.hls.setup{}
EOF
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>

