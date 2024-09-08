-- File: lua/plugins/lsp/language/html.lua
return function(lspconfig, capabilities)
	lspconfig.html.setup({
		capabilities = capabilities,
		filetypes = { "html" },
	})
end
