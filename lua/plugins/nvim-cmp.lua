-- Completitions & Snippet plugin
return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			require("cmp_nvim_lsp_signature_help").new()

			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
				Copilot = "",
			}

			cmp.setup({
				completition = {
					completeopt = "menu, menuone, preview",
				},
				formatting = {
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
						-- If you don't want have the source uncomment this line
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[LaTeX]",
						})[entry.source.name]
						return vim_item
					end,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
