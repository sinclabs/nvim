return {
	"matbme/JABS.nvim",
	lazy = true,
	-- uncomment to enable plugin
	-- event = { 'BufWinEnter' },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("jabs").setup({
			symbols = {
				current = "", -- default 
				split = "", -- default 
				alternate = "󰪸", -- default 
				hidden = "", -- default ﬘
				locked = "󰌾", -- default 
				ro = "󰈈", -- default 
				edited = "󰏫", -- default 
				terminal = "", -- default 
				default_file = "", -- Filetype icon if not present in nvim-web-devicons. Default 
				terminal_symbol = "", -- Filetype icon for a terminal split. Default 
			},
		})

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>bb", "<cmd>JABSOpen<cr>", { desc = "Open JABS buffer switcher" })
	end,
}
