return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitue = require("substitute")
		substitue.setup()

		local keymap = vim.keymap
		keymap.set(
			"n",
			"r",
			substitue.operator,
			{ noremap = true, desc = "Substitue at provided motion with default register" }
		)
		keymap.set(
			"n",
			"rr",
			substitue.line,
			{ noremap = true, desc = "Substitute the current line with default register" }
		)
		keymap.set(
			"n",
			"R",
			substitue.eol,
			{ noremap = true, desc = "Substitute until end of line with default register" }
		)
		keymap.set(
			"x",
			"r",
			substitue.visual,
			{ noremap = true, desc = "Substitute in visual mode  with default register" }
		)
	end,
}
