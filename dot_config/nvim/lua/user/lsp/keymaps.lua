local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- lsp
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<C-k>", vim.lsp.buf.signature_help)
map("n", "<leader>q", vim.diagnostic.setloclist)
map("n", "gl", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end)
map("n", "[d", function()
  vim.diagnostic.goto_prev({ border = "rounded" })
end)
map("n", "]d", function()
  vim.diagnostic.goto_next({ border = "rounded" })
end)

-- dap
local dap = require("dap")
local dap_py = require("dap-python")
map("n", "<leader>dc", dap.continue)
map("n", "<leader>dr", dap.repl.toggle)
map("n", "<leader>dK", require("dap.ui.widgets").hover)
map("n", "<leader>dt", dap.toggle_breakpoint)
map("n", "<leader>dso", dap.step_over)
map("n", "<leader>dsi", dap.step_into)
map("n", "<leader>dl", dap.run_last)
map("n", "<leader>dn", dap_py.test_method)
map("n", "<leader>df", dap_py.test_class)
map("n", "<leader>ds<esc>", dap_py.debug_selection)
