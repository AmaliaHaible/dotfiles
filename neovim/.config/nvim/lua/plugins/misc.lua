return {
	{
		"tpope/vim-fugitive",
	},
	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
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
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- },
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	opts = {
	-- 		-- options
	-- 	},
	-- },
	{
		"chomosuke/typst-preview.nvim",
		-- lazy = false, -- or ft = 'typst'
		ft = "typst",
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
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"bassamsdata/namu.nvim",
		opts = {
			global = {},
			namu_symbols = { -- Specific Module options
				options = {
					display = {
						format = "tree_guides",
					},
				},
			},
		},
		-- === Suggested Keymaps: ===
		vim.keymap.set("n", "<leader>lt", ":Namu symbols<cr>", {
			desc = "Namu Symbols",
			silent = true,
		}),
		vim.keymap.set("n", "<leader>la", ":Namu workspace<cr>", {
			desc = "Namu Workspace",
			silent = true,
		}),
		vim.keymap.set("n", "<leader>lb", ":Namu watchtower<cr>", {
			desc = "Namu Watchtower",
			silent = true,
		}),
		vim.keymap.set("n", "<leader>le", ":Namu diagnostics<cr>", {
			desc = "Namu Diagnostics",
			silent = true,
		}),
	},
	{ "rluba/jai.vim" },
}
