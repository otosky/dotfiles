return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  { "mechatroner/rainbow_csv" },
  { "ap/vim-css-color" },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

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
}
