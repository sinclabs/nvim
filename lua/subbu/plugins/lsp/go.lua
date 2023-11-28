return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup({
			luasnip = true,
			run_in_floaterm = true,
			lsp_cfg = true,
			lsp_gofumpt = true,
			trouble = true,
			build_tags = "e2e",
			lsp_keymaps = function(bufnr)
				local opts = { noremap = true, silent = true }
				local keymap = vim.keymap -- for conciseness
				opts.buffer = bufnr

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Lspsaga finder references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Lspsaga finder implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Toggle Trouble diagnostics"
				keymap.set("n", "<leader>T", "<cmd>TroubleToggle <CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				local function buf_set_option(...)
					vim.api.nvim_buf_set_option(bufnr, ...)
				end
				buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
			end,
		})

		local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimport()
			end,
			group = format_sync_grp,
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
