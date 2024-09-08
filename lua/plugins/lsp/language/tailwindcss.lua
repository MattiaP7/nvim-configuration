-- File: lua/plugins/lsp/language/tailwindcss.lua
return function(lspconfig, capabilities)
	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "svelte" },
	})
end
