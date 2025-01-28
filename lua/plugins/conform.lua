-- New formatter: "conform.nvim"

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				--language = { "formatter_name" },
				--javascript = { "prettier" },
				--typescript = { "prettier" },
				--javascriptreact = { "prettier" },
				--typescriptreact = { "prettier" },
				--svelte = { "prettier" },
				--css = { "prettier" },
				--html = { "prettier" },
				--json = { "prettier" },
				--yaml = { "prettier" },
				--markdown = { "prettier" },
				--graphql = { "prettier" },
				--liquid = { "prettier" },
				lua = { "stylua" },
				--python = { "black" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				--zig = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
		vim.keymap.set("n", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
