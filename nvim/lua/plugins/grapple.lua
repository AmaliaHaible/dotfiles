return {
	"cbochs/grapple.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		scope = "git", -- also try out "git_branch"
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>ww", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "<leader>ws", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		{ "<leader>we", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "<leader>wq", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },

        { "<leader>w1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
        { "<leader>w2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
        { "<leader>w3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
        { "<leader>w4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
	},
}
