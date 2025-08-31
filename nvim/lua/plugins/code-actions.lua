return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	event = "LspAttach",
	opts = {
		picker = {
			"buffer",
			opts = {
				auto_preview = true,
			},
		},
		backend = "vim",
		backend_opts = {
			delta = {
				args = {
					"--snytax-theme=nord",
				},
			},
		},
	},
}
