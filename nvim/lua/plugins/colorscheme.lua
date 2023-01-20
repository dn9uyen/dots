return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        undercurl = true,
        underline = true,
        bold = true,
        italic = false,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
    },

    config = function(_, opts)
        require("gruvbox").setup(opts)
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
    end,
}
