local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "󰪥 Recording @" .. recording_register
	end
end

local function has_breadcrumbs()
	return require("lspsaga.symbol.winbar").get_bar() ~= nil
end

local function get_breadcrumbs()
	return require("lspsaga.symbol.winbar").get_bar()
end

local function show_modified()
	return vim.bo.modified and "●" or ""
end

local function get_modified_buffers_status()
	local buffers = vim.api.nvim_list_bufs()

	local modified_count = 0
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "modified") then
			modified_count = modified_count + 1
		end
	end

	if modified_count > 0 then
		return "● " .. modified_count .. " modified buffer(s)"
	end

	return nil
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvimdev/lspsaga.nvim" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local theme = require("catppuccin.palettes").get_palette()

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {
					winbar = {
						"NvimTree",
						"Trouble",
						"Outline",
					},
				},
			},
			sections = {
				lualine_c = {
					{
						"filename",
						symbols = { modified = "●" },
					},
				},
				lualine_x = {
					{
						"macro-recording",
						fmt = show_macro_recording,
						color = { fg = theme.red },
					},
					{
						"modified_buffers",
						fmt = get_modified_buffers_status,
						color = { fg = theme.yellow },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = theme.peach },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			extensions = { "lazy", "fugitive", "nvim-dap-ui", "oil", "nvim-tree", "trouble" },
			winbar = {
				lualine_b = {
					{
						"modified",
						fmt = show_modified,
						color = { fg = theme.blue, bg = theme.base },
					},
				},
				lualine_c = {
					{
						"breadcrumbs",
						fmt = get_breadcrumbs,
						cond = has_breadcrumbs,
					},
					{
						"filename",
						path = 1,
						file_status = false,
						cond = function()
							return not has_breadcrumbs()
						end,
						color = { fg = theme.blue },
					},
				},
			},
			inactive_winbar = {
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = theme.blue, bg = theme.base },
						symbols = { modified = "●" },
						cond = function()
							return vim.bo.modified
						end,
					},
				},
			},
		})

		vim.api.nvim_create_autocmd("RecordingEnter", {
			callback = function()
				lualine.refresh({
					place = { "statusline" },
				})
			end,
		})

		vim.api.nvim_create_autocmd("RecordingLeave", {
			callback = function()
				-- This is going to seem really weird!
				-- Instead of just calling refresh we need to wait a moment because of the nature of
				-- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
				-- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
				-- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
				-- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
				local timer = vim.loop.new_timer()
				timer:start(
					50,
					0,
					vim.schedule_wrap(function()
						lualine.refresh({
							place = { "statusline" },
						})
					end)
				)
			end,
		})
	end,
}
