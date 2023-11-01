return {
	"nvimdev/hlsearch.nvim",
	event = "BufRead",
	lazy = true,
	config = function()
		require("hlsearch").setup()
	end,
}
