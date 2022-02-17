lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.hls.setup{}
EOF
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> grn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>

