return {
	name = "Clang-tidy Misc",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "clang-tidy" },
			args = { "--extra-arg-before=-std=c++23", "--checks=misc*", file },
			components = {
				"on_output_quickfix",
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
