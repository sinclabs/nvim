return {
	"echasnovski/mini.move",
	event = "BufEnter",
	version = "*",
	config = function()
		require("mini.move").setup()
	end,
}
