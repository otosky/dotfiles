local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local servers = {
	"sumneko_lua",
	"rust_analyzer",
	"pyright",
	"tsserver",
	"gopls",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local handler = require("user.lsp.handlers")
handler.setup()

for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = handler.on_attach,
		capabilities = handler.capabilities,
	})
end

-- lua needs extra settings to handle vim runtime globals
require("lspconfig").sumneko_lua.setup({
	on_attach = handler.on_attach,
	capabilities = handler.capabilities,
	settings = require("user.lsp.settings.sumneko_lua").settings,
})

require("user.lsp.keymaps")
require("user.lsp.null-ls")
require("user.lsp.dap")
require("elixir").setup()

-- handle outside of lspconfig
require("user.lsp.metals")

-- dap clients
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require("dap-python").test_runner = "pytest"
