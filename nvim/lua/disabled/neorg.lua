return {
	"nvim-neorg/neorg",
	dependencies = {
		"benlubas/neorg-interim-ls",
	},
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = true,
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = { workspaces = {
					main = "~/Documents/neorg",
				} },
			},
			["core.completion"] = {
				config = { engine = { module_name = "external.lsp-completion" } },
			},

			["external.interim-ls"] = {
				config = {
					completion_provider = {
						enable = true,
						documentation = true,
						categories = false,
						people = {
							enable = false,
							path = "people",
						},
					},
				},
			},
		},
	},
}
