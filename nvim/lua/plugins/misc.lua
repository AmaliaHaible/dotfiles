return {
	{
		"tpope/vim-fugitive",
	},
	{
		"mbbill/undotree",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
	-- { "Civitasv/cmake-tools.nvim", opts = {} },
}
