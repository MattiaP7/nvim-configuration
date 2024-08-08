return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
		--formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
		
		--diagnostic
		null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp", "objc", "objcpp" },
            args = { "-style=file" }, -- Pass additional arguments if needed
        }),
	},
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
