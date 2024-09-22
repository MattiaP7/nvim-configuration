return {
	"kosayoda/nvim-lightbulb",
	config = function()
		require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			pattern = "*",
			callback = function()
				require("nvim-lightbulb").update_lightbulb()
			end,
		})
	end,
}
