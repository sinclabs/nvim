return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		require("no-neck-pain").setup({
			width = 200,
		})
		NoNeckPain.bufferOptionsColors = "catppuccin-latte"
	end,
}
