-- File: lua/plugins/lsp/language/tsserver.lua
return function(lspconfig, capabilities)
	lspconfig.tsserver.setup({
		capabilities = capabilities,
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	})
end
