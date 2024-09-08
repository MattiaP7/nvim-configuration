-- File: lua/plugins/lsp/language/clangd.lua
return function(lspconfig, capabilities)
	lspconfig.clangd.setup({
		capabilities = capabilities,
		filetypes = { "cpp", "c", "h", "hpp" },
	})
end
