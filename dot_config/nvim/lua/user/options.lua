vim.g.python3_host_prog = "/usr/local/bin/python"

local options = {
	-- backup = false,                          -- creates a backup file
	completeopt = { "menuone", "noinsert", "noselect" }, -- mostly just for cmp
	fileencoding = "utf-8", -- the encoding written to a file
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	guifont = "monospace:h17", -- the font used in graphical neovim applications
}

vim.opt.shortmess:remove("F"):append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
