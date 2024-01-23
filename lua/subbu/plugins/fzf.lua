return {
	"junegunn/fzf.vim",
	dependencies = {
		"junegunn/fzf",
	},
	config = function()
		vim.keymap.set("n", "<leader>bb", "<cmd>Buffers <CR>", { desc = "List open buffers to choose from" })
	end,
}
