local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Basic
	"wbthomason/packer.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"lewis6991/impatient.nvim",
	"folke/which-key.nvim",

	-- Editing
	"michaeljsmith/vim-indent-object",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"windwp/nvim-autopairs",
	"Vimjas/vim-python-pep8-indent",
	"matze/vim-move",
	"lukas-reineke/indent-blankline.nvim",
	"ap/vim-css-color",

	-- Note-taking
	"vimwiki/vimwiki",
	"michal-h21/vim-zettel",

	-- Terminal
	"akinsho/toggleterm.nvim",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-project.nvim",
	"nvim-telescope/telescope-file-browser.nvim",

	-- File Nav & Search
	"junegunn/fzf",
	"junegunn/fzf.vim",
	{ "ThePrimeagen/git-worktree.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Colorschemes
	"morhetz/gruvbox",
	"sainnhe/gruvbox-material",
	-- https://github.com/shaunsingh/nord.nvim/issues/113
	{ "shaunsingh/nord.nvim", commit = "78f5f001709b5b321a35dcdc44549ef93185e024" },
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", as = "catppuccin" },
	"michaeldyrynda/carbon",
	"mangeshrex/everblush.vim",
	"ayu-theme/ayu-vim",
	"pineapplegiant/spaceduck",
	"liuchengxu/space-vim-dark",
	"doums/darcula",
	"nyoom-engineering/oxocarbon.nvim",
	"rose-pine/neovim",

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

	-- DAP
	"mfussenegger/nvim-dap",
	"mfussenegger/nvim-dap-python",
	-- https://github.com/rcarriga/nvim-dap-ui/issues/181
	{
		"rcarriga/nvim-dap-ui",
		tag = "v2.5.0",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	-- language-specifics
	{ "mhanberg/elixir.nvim", dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" } },
	{ "scalameta/nvim-metals", dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
	{ "mechatroner/rainbow_csv" },
	{
		"cfmeyers/dbt.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- Git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
})
