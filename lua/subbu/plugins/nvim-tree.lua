return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"s1n7ax/nvim-window-picker",
			name = "window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					hint = "floating-big-letter",
					show_prompt = false,
				})
			end,
		},
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- configure nvim-tree
		nvimtree.setup({
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				adaptive_size = false,
				side = "left",
				width = 30,
				preserve_window_proportions = true,
			},
			git = {
				enable = false,
				ignore = true,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
					window_picker = {
						enable = true,
						picker = require("window-picker").pick_window,
					},
				},
			},
			renderer = {
				root_folder_label = false,
				highlight_git = false,
				highlight_opened_files = "none",

				indent_markers = {
					enable = false,
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},

					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
