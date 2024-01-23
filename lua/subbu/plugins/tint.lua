return {
	"levouh/tint.nvim",
	config = function()
		require("tint").setup({
			tint = -45,
			window_ignore_function = function(winid)
				local bufid = vim.api.nvim_win_get_buf(winid)
				local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
				local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

				local filetype = vim.api.nvim_buf_get_option(bufid, "filetype")
				-- Do not tint `terminal` or floating windows, tint everything else
				return buftype == "terminal" or floating or filetype == "NvimTree"
			end,
		})
	end,
}
