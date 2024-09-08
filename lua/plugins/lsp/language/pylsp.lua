-- File: lua/plugins/lsp/language/pylsp.lua
return function(lspconfig, capabilities)
	lspconfig.pylsp.setup({
		capabilities = capabilities,
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						enabled = true,
						ignore = { "E501" }, -- E501: line too long
						maxLineLength = 88, -- PEP 8 standard
					},
					pyflakes = { enabled = true },
					pylint = { enabled = false },
					black = { enabled = true },
					pylsp_mypy = { enabled = true },
					isort = { enabled = true },
					rope_autoimport = { enabled = true },
				},
			},
		},
	})
end
