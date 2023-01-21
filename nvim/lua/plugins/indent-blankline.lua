return {
    "lukas-reineke/indent-blankline.nvim",

    opts = {
        show_current_context = true,
        show_current_context_start = false,
        use_treesitter = true,
        buftype_exclude = { "terminal", "nofile" },
        filetype_exclude = {
            "help",
            "packer",
            "neo-tree",
        },
    },
}
