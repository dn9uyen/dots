return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        vim.g.neo_tree_remove_legacy_commands = 1
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    visible = false, -- when true, they will just be displayed differently than normal items
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false, -- only works on Windows for hidden files/directories
                    hide_by_name = {
                        --"node_modules"
                    },
                },
            },
            sources = {
                "filesystem",
                "buffers",
                "git_status",
            },
            source_selector = {
                winbar = true,
                statusline = false
            },
        })

        vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#8ec07c", bg = "#1d2021" })
        vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#cc241d", bg = "#1d2021" })

        local wk = require("which-key")
        wk.register({
            ["\\"] = { "<cmd>NeoTreeShowToggle<cr>", "Find File" },
        })
    end,
}
