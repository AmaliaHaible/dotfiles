-- vim.lsp.enable({
-- 	"rust",
-- 	"lua",
-- 	"zig",
--     "c",
--     "python",
--     "ocaml",
-- })

-- wow back to lspconfig just cause its funny
vim.lsp.enable({
	"lua_ls",
	"rust_analyzer",
	"zls",
	"clangd", -- DO NOT INSTALL VIA MASON ON WINDOWS
	"glsl_analyzer",
	"autotools_ls",
	-- "basedpyright",
	-- "ocamllsp",
	"gopls",
	"ts_ls",
	"html",
	"json",
	"tinymist",
	"ty",
	"qmlls",
	"jails",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.config("clangd", {
	cmd = { "clangd", "--rename-file-limit=200", "--enable-config" },
})


vim.filetype.add({
	extension = {
		jai = "jai",
	},
})
vim.lsp.config("jails", {
	cmd = { "jails" }, -- or full path to the binary
	filetypes = { "jai" },
	root_markers = { "build.jai", ".git" },
})

vim.lsp.config("tinymist", { settings = { formatterMode = "typstyle" } })
