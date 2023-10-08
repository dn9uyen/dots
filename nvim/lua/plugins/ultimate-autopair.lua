return {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    config = function()
        require("ultimate-autopair").setup({
            -- Only balance space when non-space character inserted
            { space = { enable = false }, space2 = { enable = true } }
        })
    end,
}
