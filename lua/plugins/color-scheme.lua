-- Every colorscheme will be installed here
-- For a specifi colorscheme use:
-- config = function()
--	 vim.cmd.colorscheme("name")
-- end,
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"marko-cerovac/material.nvim",
		priority = 1000,
	},
	{
		"comfysage/evergarden",
		priority = 1000,
		opts = {
			transparent_background = false, -- true
			contrast_dark = "hard", -- 'hard'|'medium'|'soft'
			--	overrides = { }, add custom overrides
		},
	},
}
