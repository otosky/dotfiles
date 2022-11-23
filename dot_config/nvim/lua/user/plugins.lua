local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Basic
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("lewis6991/impatient.nvim")
	use("folke/which-key.nvim")

	-- Motions
	-- use("ggandor/lightspeed.nvim")
	-- use("ggandor/leap.nvim")

	-- Editing
	use("michaeljsmith/vim-indent-object")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("Vimjas/vim-python-pep8-indent")
	use("matze/vim-move")

	-- Note-taking
	use("vimwiki/vimwiki")
	-- use("alok/notational-fzf-vim")
	use("michal-h21/vim-zettel")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- File Nav & Search
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	use({ "ThePrimeagen/git-worktree.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })

	-- Colorschemes
	use("morhetz/gruvbox")
	use("sainnhe/gruvbox-material")
	-- https://github.com/shaunsingh/nord.nvim/issues/113
	use({ "shaunsingh/nord.nvim", commit = "78f5f001709b5b321a35dcdc44549ef93185e024" })
	-- use("arcticicestudio/nord-vim")
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("michaeldyrynda/carbon")
	use("mangeshrex/everblush.vim")
	use("ayu-theme/ayu-vim")
	use("pineapplegiant/spaceduck")
	use("liuchengxu/space-vim-dark")
	use("doums/darcula")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- DAP
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	-- https://github.com/rcarriga/nvim-dap-ui/issues/181
	use({
		"rcarriga/nvim-dap-ui",
		tag = "v2.5.0",
		requires = { "mfussenegger/nvim-dap" },
	})

	-- language-specifics
	use({ "mhanberg/elixir.nvim", requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" } })
	use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } })
	use({ "mechatroner/rainbow_csv" })
	use({
		"cfmeyers/dbt.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"rcarriga/nvim-notify",
		},
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-project.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
