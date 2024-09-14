-- syntax highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "c", "cpp", "html", "css", "lua", "javascript", "typescript" },
			sync_install = false,
			ignore_install = {},
			modules = {},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
