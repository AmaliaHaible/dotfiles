return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },

	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = false,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			python = { "isort", "black" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			javascript = { "prettier", stop_after_first = true },
			rust = { "rustfmt", lsp_format = "fallback" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
		formatters = {
			black = {
				append_args = { "-l", "180" },
			},
			stylua = {
				append_args = { "--column-width", "180" },
			},
			["clang-format"] = {
				prepend_args = {
					'--style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 160}', -- this is does not work with fallback-style so i ignore .clang-format
					-- "--verbose",
				},
			},
            prettier = {
                prepend_args = {
                    "--tab-width 4"
                }
            }
		},
	},
}
