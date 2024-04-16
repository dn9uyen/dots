return {
    "uga-rosa/ccc.nvim",
    config = function()
        require("ccc").setup({
            highlighter = {
                auto_enable = false,
                lsp = true,
            },
        })
    end
}
