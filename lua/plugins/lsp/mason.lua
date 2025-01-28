-- File: lua/plugins/lsp/mason.lua
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason, mason-lspconfig, mason-tool
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- icone custom per mason
		mason.setup({
			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
		})

		mason_lspconfig.setup({
			-- lista di server da installare di default.
			ensure_installed = {
				--"ts_ls", -- javascript
				--"html", -- html
				--"cssls", -- css
				--"tailwindcss", -- tailwind
				"lua_ls", -- lua
				--"emmet_ls", -- emmet
				"clangd", -- C / C++
				-- python
				--"pylsp",
				--"pyright",
				-- end python
			},
		})

		mason_tool_installer.setup({
			-- lista di formatter, linter, dapper da installare di default
			ensure_installed = {
				--"prettier", -- prettier formatter
				"stylua", -- lua formatter
				--"isort", -- python formatter
				--"black", -- python formatter
				--"pyflakes",
				--"pylint",
				--"eslint_d",
				"clang-format", -- C / C++ formatter
			},
		})

		-- Function to check if Mason has been initialized
		local function is_mason_initialized()
			return vim.fn.filereadable(vim.fn.stdpath("data") .. "/mason_initialized") == 1
		end

		local function mark_mason_initialized()
			local file = io.open(vim.fn.stdpath("data") .. "/mason_initialized", "w")
			if file then
				file:close()
			end
		end

		-- Open Mason UI automatically during the first installation
		vim.defer_fn(function()
			if not is_mason_initialized() then
				require("mason.ui").open()
				mark_mason_initialized()
			end
		end, 100)
	end,
}
