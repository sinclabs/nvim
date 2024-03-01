return {
	"echasnovski/mini.bracketed",
	version = "*",
	event = "BufEnter",
	config = function()
		require("mini.bracketed").setup()
	end,
}
