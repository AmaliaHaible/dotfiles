return {
    {
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = "andromeda"
        end
    },
    {
        "sainnhe/edge",
        config = function()
            vim.g.edge_style = "neon"
        end
    },
    { "catppuccin/nvim",      name = "catppuccin", },
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        config = function()
            require("nightfox").setup({
                palettes = {
                    -- Custom duskfox with black background
                    nordfox = {
                        -- bg0 = "#282c34",
                        bg1 = "#282c34",
                        -- bg0 = "#FF0000",
                        -- bg2 = "#00FF00",
                        -- bg3 = "#0000FF",
                        -- bg4 = "#010101",

                        -- bg2 = "#282c34",
                        -- bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
                        -- bg3 = "#121820", -- 55% darkened from stock
                        -- sel0 = "#131b24", -- 55% darkened from stock
                    },
                },
                -- specs = {
                --   duskfox = {
                --     inactive = "#090909", -- Slightly lighter then black background
                --   },
                -- },
                -- groups = {
                --   all = {
                --     NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
                --   },
                -- },
            })
            vim.cmd("colorscheme nordfox")
        end
    },
    { "folke/tokyonight.nvim" },
    { "shaunsingh/nord.nvim" },
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup {
                style = 'warmer'
            }
        end
    }
}
