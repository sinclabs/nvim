return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			harpoon = true,
			dap = {
				enabled = true,
				enable_ui = true, -- enable nvim-dap-ui
			},
			which_key = true,
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
