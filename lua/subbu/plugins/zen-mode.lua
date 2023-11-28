return {
	"folke/zen-mode.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		plugins = {
			tmux = { enabled = true },
		},
		on_open = function(win)
			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
		on_close = function(win)
			vim.diagnostic.config({
				virtual_text = true,
			})
		end,
	},
}
