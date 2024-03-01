return {
	"echasnovski/mini.surround",
	version = "*",
	lazy = true,
	-- event = "BufEnter",
	config = function()
		require("mini.surround").setup()
	end,
}
