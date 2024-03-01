return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neoclip").setup()

		local keymap = vim.keymap
		keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Find yanks in the primary register" })
	end,
}
