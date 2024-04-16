return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter',      -- optional
        'nvim-web-devicons'     -- optional
    },
    config = function()
        require('lspsaga').setup({})
        -- TODO: set up keybinds
    end,
}
