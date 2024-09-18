-- Every colorscheme will be installed here
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"dracula/vim",
		lazy = false,
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		lazy = true,
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
