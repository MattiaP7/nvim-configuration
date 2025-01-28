return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				-- Tokyonight theme
				"tokyonight",
				"tokyonight-day",
				"tokyonight-moon",
				"tokyonight-night",
				"tokyonight-storm",

				-- Catppuccin theme
				"catppuccin",
				"catppuccin-frappe",
				"catppuccin-latte",
				"catppuccin-macchiato",
				"catppuccin-mocha",

				-- Altri
				"dracula",
			},
			livePreview = true, -- Preview del tema
			save_last = true, -- Salva il tema selezionato

			-- keyword per il theme switcher
			vim.keymap.set("n", "<leader>th", ":Themery <CR>", {}),
		})
	end,
}
