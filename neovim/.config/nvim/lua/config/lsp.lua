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
vim.lsp.config("tinymist", {settings = {formatterMode = "typstyle"}})
