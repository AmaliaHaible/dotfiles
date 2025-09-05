return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- require("nvim-treesitter.install").compilers = { "zig", "gcc" }
			require("nvim-treesitter.install").compilers = { "gcc", "zig" }
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
                    disable = {"slint"},
				},
			})
            vim.opt.foldmethod ="expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldenable = false
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
