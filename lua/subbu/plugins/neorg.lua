return {
	"nvim-neorg/neorg",
	ft = "norg",
	build = ":Neorg sync-parsers",
	run = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/dev/notes",
							journal = "~/dev/notes/journal",
						},
					},
				},
			},
		})
	end,
}
