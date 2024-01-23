return {
	"toppair/reach.nvim",
	lazy = true,
	event = { "BufWinEnter" },
	config = function()
		require("reach").setup({
			notifications = true,
		})
		vim.keymap.set("n", "<leader>bb", function()
			require("reach").buffers()
		end, { desc = "List open buffers to choose from" })
	end,
}
