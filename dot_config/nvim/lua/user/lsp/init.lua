local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.keymaps")
require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("user.lsp.dap")
require("elixir").setup()

-- handle outside of lspconfig
require("user.lsp.metals")
