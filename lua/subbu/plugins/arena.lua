return {
	"dzfrias/arena.nvim",
	lazy = true,
	-- event = "BufWinEnter",
	config = function()
		require("arena").setup()

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>bb", "<cmd>ArenaToggle<cr>", { desc = "Open Arena buffer switcher" })
	end,
}
