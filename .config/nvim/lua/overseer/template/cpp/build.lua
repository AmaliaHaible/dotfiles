return {
	name = "Clang build c++23",
	builder = function()
		-- Full path to current file (see :help expand())
		local file = vim.fn.expand("%:p")
		local file_base = vim.fn.expand("%:t:r")
		return {
			cmd = { "clang++" },
			args = { file, "-std=c++23", "-o", file_base .. ".exe" },
			components = {
				{ "on_output_quickfix" },
				"default",
				-- { "open_output", direction = "float", focus = true, on_complete = "failure" },
				-- { "on_result_diagnostics_quickfix", use_loclist = true},
				-- { "run_after", task_names = { {"shell", cmd = ".\\" .. file_base .. ".exe" } }, statuses = { "SUCCESS" } },
			},
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
