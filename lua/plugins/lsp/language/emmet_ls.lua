-- File: lua/plugins/lsp/language/emmet_ls.lua
return function(lspconfig, capabilities)
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
		},
	})
end
