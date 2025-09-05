return {
	"benomahony/uv.nvim",
	opts = {
		picker_integration = true,
	},
	config = function()
		require("uv").setup({
			keymaps = {
				prefix = "<leader>p",
			},
		})
	end,
}
