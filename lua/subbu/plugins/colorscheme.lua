return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "light",
				percentage = 0.25, -- percentage of the shade to apply to the inactive window
			},
			styles = {
				functions = { "italic" },
				properties = { "italic" },
			},
			integrations = {
				harpoon = true,
				nvimtree = true,
				notify = true,
				dap = {
					enabled = true,
					enable_ui = true, -- enable nvim-dap-ui
				},
				which_key = true,
				window_picker = true,
				lsp_saga = true,
				lsp_trouble = true,
				noice = true,
				octo = true,
				indent_blankline = {
					enabled = true,
					scope_color = "surface2", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = false,
				},
				illuminate = {
					enabled = true,
					lsp = true,
				},
				beacon = true,
				neogit = true,
			},
			custom_highlights = function(colors)
				return {
					Folded = { bg = colors.mantle },
				}
			end,
		})
		-- load the colorscheme here
		vim.o.termguicolors = true
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
