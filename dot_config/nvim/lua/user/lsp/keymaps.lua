local api = vim.api
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- lsp
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
map("n", "gl", '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
map("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

-- dap
map("n", "<leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
map("n", "<leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
map("n", "<leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
map("n", "<leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])
map("n", "<leader>dn", [[<cmd>lua require('dap-python').test_method()<CR>]])
map("n", "<leader>df", [[<cmd>lua require('dap-python').test_class()<CR>]])
map("n", [[<leader>ds<esc>]], [[<cmd>lua require('dap-python').debug_selection()<CR>]])
