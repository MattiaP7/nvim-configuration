-- File: lua/plugins/lsp/language/zls.lua
return function(lspconfig, capabilities)
	lspconfig.zls.setup({
		capabilities = capabilities,
		filetypes = { "zig" },
	})
end
