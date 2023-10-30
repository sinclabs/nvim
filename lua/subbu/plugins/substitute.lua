return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitue = require("substitute")
		substitue.setup()

		local keymap = vim.keymap
		keymap.set(
			"n",
			"s",
			substitue.operator,
			{ noremap = true, desc = "Substitue at provided motion with default register" }
		)
		keymap.set(
			"n",
			"ss",
			substitue.line,
			{ noremap = true, desc = "Substitute the current line with default register" }
		)
		keymap.set(
			"n",
			"S",
			substitue.eol,
			{ noremap = true, desc = "Substitute until end of line with default register" }
		)
		keymap.set(
			"x",
			"s",
			substitue.visual,
			{ noremap = true, desc = "Substitute in visual mode  with default register" }
		)
	end,
}
