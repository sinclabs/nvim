local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

return {
	"anuvyklack/windows.nvim",
	-- Comment the next two lines to activate
	lazy = true,
	event = {},
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = function()
		vim.o.winwidth = 10
		vim.o.winminwidth = 10
		vim.o.equalalways = false
		require("windows").setup({
			autowidth = {
				enabled = false,
			},
			ignore = {
				filetype = { "NvimTree" },
			},
		})
		vim.keymap.set("n", "<C-w>z", cmd("WindowsMaximize"))
		vim.keymap.set("n", "<C-w>_", cmd("WindowsMaximizeVertically"))
		vim.keymap.set("n", "<C-w>|", cmd("WindowsMaximizeHorizontally"))
		vim.keymap.set("n", "<C-w>=", cmd("WindowsEqualize"))
	end,
}
