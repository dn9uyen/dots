return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("telescope").setup()

        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = { name = "+telescope" },
            ["<leader>ff"] = { require('telescope.builtin').find_files, "Find File" },
            ["<leader>fg"] = { require('telescope.builtin').live_grep, "Live Grep" },
            ["<leader>fb"] = { require('telescope.builtin').buffers, "Find in Buffers" },
            ["<leader>fh"] = { require('telescope.builtin').help_tags, "Help Tags" },
        })
    end,
}
