local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		layout_strategy = "flex",

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-w>"] = actions.delete_buffer,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-w>"] = actions.delete_buffer,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		project = {
			base_dirs = {
				"~/personal",
			},
			theme = "dropdown",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("file_browser")

--- Merge two tables to one.
function merge(t1, t2)
	local res = {}

	for _, table in ipairs({ t1, t2 }) do
		for k, v in pairs(table) do
			res[k] = v
		end
	end

	return res
end

-- Bindings
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local builtin = require("telescope.builtin")
local ext = telescope.extensions
keymap("n", "<C-Space>", builtin.builtin, merge(opts, { desc = "Open Telescope" }))
keymap("n", "<leader>b", builtin.buffers, merge(opts, { desc = "Show Buffers" }))
keymap("n", "<leader>ff", builtin.find_files, merge(opts, { desc = "Find Files" }))
keymap("n", "<leader>fg", builtin.live_grep, merge(opts, { desc = "Live Grep" }))
keymap("n", "<leader>fr", builtin.oldfiles, merge(opts, { desc = "Find Recent Files" }))
keymap("n", "<leader>fk", builtin.keymaps, merge(opts, { desc = "Search Keymaps" }))
keymap("n", "<leader>fp", ext.project.project, merge(opts, { desc = "Telescope Project Extension" }))
keymap("n", "<leader>fb", ext.file_browser.file_browser, merge(opts, { desc = "File Browser" }))
