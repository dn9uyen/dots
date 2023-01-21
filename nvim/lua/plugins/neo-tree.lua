return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
	    "nvim-lua/plenary.nvim",
	    "kyazdani42/nvim-web-devicons",
	    "MunifTanjim/nui.nvim",
    },
    opts = {
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
    },
}

-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/defaults.lua
