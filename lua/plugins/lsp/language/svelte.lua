-- File: lua/plugins/lsp/language/svelte.lua
return function(lspconfig, capabilities)
	lspconfig.svelte.setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.js", "*.ts" },
				callback = function(ctx)
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
				end,
			})
		end,
	})
end
