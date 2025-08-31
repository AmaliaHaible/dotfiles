return {
    "dense-analysis/ale",
    config = function ()
        local g = vim.g
        -- g.ale_disable_lsp = 1
        g.ale_use_neovim_diagnostics_api = 1
        g.ale_set_quickfix = 1
        g.ale_set_loclist = 0
        g.ale_lint_on_text_changed = "never"
        g.ale_lint_on_insert_leave = 0
        g.ale_lint_on_enter = 0
        g.ale_lint_on_save = 0

        g.ale_linters = {
            cpp = {"clangtidy"}
        }
        g.ale_fixers = {
            cpp = {"clangtidy"}
        }

        g.ale_cpp_clangtidy_checks = {"readability*, bugprone*"}
    end
}
