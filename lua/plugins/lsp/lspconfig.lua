return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local map = vim.keymap.set
		map("n", "<C-f>", vim.diagnostic.goto_next, { desc = "Vai all'errore successivo" })
		map("n", "<C-i>", vim.diagnostic.goto_prev, { desc = "Vai all'errore precedente" })

		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })

		-- Configurazione degli autocomandi per LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Configura i keybinds
				opts.desc = "Show documentation for what is under cursor"
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "<CR>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})

				vim.api.nvim_set_keymap(
					"n",
					"gD",
					"<cmd>lua vim.lsp.buf.declaration()<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"gd",
					"<cmd>lua vim.lsp.buf.definition()<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"gi",
					"<cmd>lua vim.lsp.buf.implementation()<CR>",
					{ noremap = true, silent = true }
				)
				map("n", "<leader>ca", vim.lsp.buf.code_action, {})
			end,
		})
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Configura le capacità di LSP
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Configura clangd per C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			filetypes = { "cpp", "c", "h", "hpp" },
		})

		-- Configura LuaLS per Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
			filetypes = { "c", "cpp", "h", "hpp" },
		})

		-- Personalizza la visualizzazione della signature help
		-- vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
		-- 	local lines = vim.lsp.util.convert_signature_help_to_markdown_lines(result)
		-- 	if lines then
		-- 		-- Mostra solo la prima riga (la firma della funzione)
		-- 		lines = { lines[1] }
		-- 	end
		-- 	vim.lsp.util.open_floating_preview(lines, "markdown", {
		-- 		border = "rounded", -- Bordi arrotondati
		-- 		focusable = false, -- Non focalizzare la finestra
		-- 		max_width = 60, -- Riduci la larghezza massima
		-- 		max_height = 1, -- Mostra solo una riga (la firma)
		-- 	})
		-- end
	end,
}
