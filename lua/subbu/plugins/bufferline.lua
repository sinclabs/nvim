return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				separator_style = "thick",
				themable = true,
				always_show_bufferline = false,
				get_element_icon = function(element)
					-- element consists of {filetype: string, path: string, extension: string, directory: string}
					-- This can be used to change how bufferline fetches the icon
					-- for an element e.g. a buffer or a tab.
					-- e.g.
					if string.find(element.path, "NeogitStatus") then
						return "󰊢", "NeogitStatus"
					end

					if element.filetype == "NvimTree" then
						return "", "NvimTree"
					end

					local icon, hl =
						require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
					return icon, hl
				end,
			},
		})

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>bl", "<cmd>BufferLinePick<CR>", { desc = "Pick from open buffers to go to" })
		keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Move to next buffer" })
		keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Move to prev buffer" })
	end,
}
