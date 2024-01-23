vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "NvimTree*",
	callback = function()
		local api = require("nvim-tree.api")
		local view = require("nvim-tree.view")

		if not view.is_visible() then
			api.tree.open()
		end
	end,
})

local kitty_group = vim.api.nvim_create_augroup("kitty_ag", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		os.execute("kitty @ --to unix:/tmp/kitty-" .. vim.env.KITTY_PID .. " set-spacing padding=8")
	end,
	group = kitty_group,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		os.execute("kitty @ --to unix:/tmp/kitty-" .. vim.env.KITTY_PID .. " set-spacing padding=0")
	end,
	group = kitty_group,
})
