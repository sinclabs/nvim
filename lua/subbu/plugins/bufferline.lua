return {
	"akinsho/bufferline.nvim",
	-- Comment the next two lines
	-- to enable the plugin
	lazy = true,
	event = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffer",
				separator_style = "thick",
				themable = true,
				offsets = {
					{
						filetype = "NvimTree",
						text_align = "center",
						separator = true,
					},
				},
			},
		})

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>bl", "<cmd>BufferLinePick<CR>", { desc = "Pick from open buffers to go to" })
		keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Move to next buffer" })
		keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Move to prev buffer" })
	end,
}
