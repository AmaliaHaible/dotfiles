return {
	"nvim-mini/mini.nvim",
	version = false,
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
	},
	config = function()
		require("mini.pairs").setup({})
		require("mini.icons").setup({})
		require("mini.comment").setup({})
		require("mini.surround").setup({})
		require("mini.ai").setup({})
		require("mini.statusline").setup({})
		require("mini.tabline").setup({})
		-- local gen_loader = require('mini.snippets').gen_loader
		require("mini.snippets").setup({
			--[[ snippets = {
		              -- Load custom file with global snippets first (adjust for Windows)
		              gen_loader.from_file('~/.config/nvim/snippets/global.json'),

		              -- Load snippets based on current language by reading files from
		              -- "snippets/" subdirectories from 'runtimepath' directories.
		              gen_loader.from_lang(),
		          }, ]]
			mappings = {
				jump_next = "<Tab>",
				jump_prev = "<S-Tab>",
			},
		})
		-- require("mini.completion").setup({
		-- 	mappings = {
		-- 		scroll_down = "<S-Down>",
		-- 		scroll_up = "<S-Up>",
		-- 	},
		-- })
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
				-- Highlight hex color strings (`#rrggbb`) using that color #993456
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		-- vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])
		-- vim.cmd([[au FileType fff_input lua vim.b.minicompletion_disable = true]])
	end,
}
