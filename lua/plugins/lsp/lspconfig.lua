return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- Importa i plugin necessari
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		--require("nvim-lightbulb").setup({ autocmd = { enabled = true } })

		local keymap = vim.keymap -- per brevità

		keymap.set("n", "<C-f>", vim.diagnostic.goto_next, { desc = "Vai all'errore successivo" })
		keymap.set("n", "<C-i>", vim.diagnostic.goto_prev, { desc = "Vai all'errore precedente" })

		--[[vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			pattern = "*",
			callback = function()
				require("nvim-lightbulb").update_lightbulb()
			end,
		})--]]
		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })

		-- Configurazione degli autocomandi per LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Configura i keybinds
				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<CR>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})

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
				keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			end,
		})
		-- Abilita l'autocompletamento per ogni configurazione del server LSP
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Modifica i simboli di diagnostica nella colonna dei segni (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Funzione per caricare e applicare una configurazione linguaggio
		local function load_language_config(language)
			local ok, config = pcall(require, "plugins.lsp.language." .. language)
			if ok then
				config(lspconfig, capabilities) -- Passa lspconfig e capabilities alla configurazione
			else
				vim.notify(
					"Errore nel caricare la configurazione per: " .. language .. "\n" .. config,
					vim.log.levels.ERROR
				)
			end
		end

		-- Lista dei linguaggi da configurare
		-- Per aggiungerne un'altro creare un file con il nome del linguaggio
		-- nella cartella language/ e scrivere il nome dentro la lista
		local languages = {
			"lua_ls",
			"clangd",
		}

		-- Carica ogni configurazione linguaggio
		for _, language in ipairs(languages) do
			load_language_config(language)
		end

		-- Gestore di default per i server installati tramite Mason
		mason_lspconfig.setup_handlers({
			-- Gestore di default per i server non specificamente configurati nei file `language`
			function(server_name)
				load_language_config(server_name)
			end,
		})
	end,
}
