return {	
	"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function() 
		local config = require("nvim-treesitter.configs")
			config.setup({
			ensure_installed	= {"c", "cpp", "lua", "html", "css", "javascript"},
			highlight			= { enable = true },
			indent				= { enable = true }, 
		})
	end
}
