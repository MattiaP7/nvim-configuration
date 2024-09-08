-- File: lua/plugins/lsp/language/cssls.lua
return function(lspconfig, capabilities)
	lspconfig.cssls.setup({
		capabilities = capabilities,
		filetypes = { "css", "scss", "less" },
	})
end
