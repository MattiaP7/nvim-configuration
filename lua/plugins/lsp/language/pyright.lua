-- File: lua/plugins/lsp/language/pyright.lua
return function(lspconfig, capabilities)
	lspconfig.pyright.setup({
		capabilities = capabilities,
	})
end
