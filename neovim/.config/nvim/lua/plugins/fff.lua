return {
	"dmtrKovalenko/fff.nvim",
	build = "cargo build --release",
	opts = {
		keymaps = {
			preview_scroll_up = { "<C-u>", "<S-Up>" },
			preview_scroll_down = { "<C-d>", "<S-Down>" },
		},
	},
	keys = {
		{
			"<leader>FF",
			function()
				require("fff").find_files()
			end,
			desc = "FFF Finder",
		},
		{
			"<leader>FG",
			function()
				require("fff").find_files()
			end,
			desc = "FFF Git",
		},
	},
}
