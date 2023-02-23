-- extend sources

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
        nls.builtins.formatting.isort,
        nls.builtins.formatting.mix,
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.scalafmt,
        nls.builtins.formatting.shfmt,
      },
    }
  end,
}
