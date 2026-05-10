return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		keymaps = {
			preview_scroll_up = { "<C-u>", "<S-Up>" },
			preview_scroll_down = { "<C-d>", "<S-Down>" },
		},
	},
	lazy = false,
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
		{
			"<leader>FL",
			function()
				require("fff").live_grep()
			end,
			desc = "FFF Grep",
		},
		{
			"<leader>FK",
			function()
				require("fff").live_grep({ grep = { modes = { 'fuzzy', 'plain' } } })
			end,
			desc = "FFF Grep",
		},
	},
}
