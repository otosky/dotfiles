return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>cr", vim.lsp.buf.rename }
  end,
}
