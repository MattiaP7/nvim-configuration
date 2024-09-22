return {
	"ray-x/lsp_signature.nvim",
	event = "BufReadPre",
	config = function()
		require("lsp_signature").setup({
			bind = true,
			floating_window = true,
			hint_enable = false,
			floating_window_above_cur_line = true,
			handler_opts = {
				border = "rounded",
			},
			zindex = 50, -- To make sure it appears above other floating windows
		})
	end,
}
