return {
  { "mechatroner/rainbow_csv" },
  { "ap/vim-css-color" },

  -- languague specifics
  {
    "cfmeyers/dbt.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "rcarriga/nvim-notify",
    },
  },
  { "mhanberg/elixir.nvim", dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" } },
  { "scalameta/nvim-metals", dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
}
