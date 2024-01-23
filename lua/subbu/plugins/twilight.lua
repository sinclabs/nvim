return {
	"folke/twilight.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		dimming = {
			alpha = 0.50,
			color = { "Normal" },
		},
	},
}
