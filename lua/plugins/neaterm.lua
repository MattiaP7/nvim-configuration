return {
	"Dan7h3x/neaterm.nvim",
	branch = "stable",
	event = "VeryLazy",
	opts = {
		-- Your custom options here (optional)
		shell = vim.o.shell,
		float_width = 0.7,
		float_height = 0.6,
		move_amount = 3,
		resize_amount = 2,
		border = "rounded",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
	},
}
