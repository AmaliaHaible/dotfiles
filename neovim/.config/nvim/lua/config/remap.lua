vim.g.mapleader = " "
vim.keymap.set("t", "<C-h>", "<C-\\><C-n>", { silent = true })
-- vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", { silent = true })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>", { desc = "Clear search highlights" })
-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
-- Move Split
vim.keymap.set("n", "<C-S-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-S-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
-- Move lines up/down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "<leader>Y", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, {desc = "Copy Filepath to Clipboard"})

-- yank to / paste from system clipboard, delete to void
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>D", '"_d')
vim.keymap.set("n", "<leader>p", '"+p')


-- LSP Related
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp"},
    callback = function ()
        vim.keymap.set("n", "<leader>lc", ":LspClangdSwitchSourceHeader<cr>")
    end
})

-- vim.api.nvim_create_user_command("LspRestart", function()
-- 	vim.lsp.stop_client(vim.lsp.get_active_clients())
-- 	vim.cmd("edit")
-- end, {})

--------- snacks terminal overlay
local term = require("snacks.terminal")
vim.keymap.set({ "t", "n" }, "<A-p>", function()
	if vim.fn.has("Linux") == 1 then
		term.toggle("zsh", { win = { width = 0.9, height = 0.9, minimal = false } })
	elseif vim.fn.has("Windows") == 1 then
		term.toggle("pwsh", { win = { width = 0.9, height = 0.9, minimal = false, border = "rounded" } })
	end
end, { desc = "Open floating Powershell/Zsh" })

-------- task manager
vim.keymap.set({ "t", "n" }, "<A-n>", function()
	if vim.fn.has("Linux") == 1 then
		term.toggle("btop", { win = { width = 0.9, height = 0.9 } })
	elseif vim.fn.has("Windows") == 1 then
		term.toggle("btop4win", { win = { width = 0.9, height = 0.9 } })
	end
end, { desc = "Open btop in a floating terminal" })
vim.keymap.set({ "t", "n" }, "<A-m>", function()
	if vim.fn.has("Linux") == 1 then
		term.toggle("btop ", { win = { width = 0.5, height = 0.5 } })
	elseif vim.fn.has("Windows") == 1 then
		term.toggle("btop4win ", { win = { width = 0.5, height = 0.5 } })
	end
end, { desc = "Open small btop in a floating terminal" })
