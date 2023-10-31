return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.50, -- percentage of the shade to apply to the inactive window
			},
			integrations = {
				harpoon = true,
				nvimtree = true,
				dap = {
					enabled = true,
					enable_ui = true, -- enable nvim-dap-ui
				},
				which_key = true,
			},
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
