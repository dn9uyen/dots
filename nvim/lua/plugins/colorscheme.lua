return {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,

    config = function()
        vim.g.gruvbox_material_foreground = "mix"
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_better_performance = 1

        -- Make float color consistent with background
        grpid = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})
        vim.api.nvim_create_autocmd('ColorScheme', {
            group = grpid,
            pattern = 'gruvbox-material',
            command = -- floating popups
                'hi NormalFloat guibg=#1d2021 |' ..
                'hi FloatBorder guibg=#1d2021'
        })

        vim.cmd.colorscheme("gruvbox-material")
    end,
}
