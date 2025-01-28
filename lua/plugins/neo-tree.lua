-- Neovim plugin to manage the file system and other tree-like structures.

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true, -- Aggiornato con la nuova sintassi
				},
				hijack_netrw_behavior = "open_default",
				filtered_items = {
					visible = true, -- Mostra file nascosti
					hide_dotfiles = false, -- Non nascondere i file che iniziano con '.'
				},
			},
			window = {
				width = 30, -- Riduce la larghezza della finestra
			},
		})
	end,
}
