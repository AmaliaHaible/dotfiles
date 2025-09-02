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
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	opts = {
	-- 		-- options
	-- 	},
	-- },
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
	-- { "Civitasv/cmake-tools.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		opts = {},
	},
	-- { -- Why? idk
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.8",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- },
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	-- 	version = "*", -- Pin Neorg to the latest stable release
	-- 	config = true,
	-- },
}
