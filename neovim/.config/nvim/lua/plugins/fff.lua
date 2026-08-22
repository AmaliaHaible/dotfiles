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
			"ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"fl",
			function()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
		{
			"fL",
			function()
				require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
			end,
			desc = "Live fffuzy grep",
		},
		-- {
		-- 	"fw",
		-- 	function()
		-- 		require("fff").live_grep_under_cursor()
		-- 	end,
		-- 	mode = { "n", "x" },
		-- 	desc = "Search current word / selection",
		-- },
	},
}
