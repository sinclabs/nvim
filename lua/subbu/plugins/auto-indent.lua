return {
	{
		"vidocqh/auto-indent.nvim",
		lazy = true,
		config = function()
			require("auto-indent").setup({
				---@param lnum: number
				---@return number
				indentexpr = function(lnum)
					return require("nvim-treesitter.indent").get_indent(lnum)
				end,
			})
		end,
	},
}
