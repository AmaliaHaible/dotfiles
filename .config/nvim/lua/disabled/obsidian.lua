return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		priority = 49,
	},
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		lazy = false,
		ft = "markdown",
		opts = {
			workspaces = {
				{
					name = "test",
					path = "~/Documents/Obsidian/Test",
				},
			},
		},
	},
}
