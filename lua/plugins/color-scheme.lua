-- Every colorscheme will be installed here
-- if you want to use a specific one, write under his installation:
-- config = function()
--		vim.cmd.colorscheme "name"
-- end
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
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
