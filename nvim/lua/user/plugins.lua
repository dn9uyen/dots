local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "lewis6991/impatient.nvim" }
    use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
    use { "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
        config = function() require "user.autopairs" end, event = "InsertEnter"
    }
    use { "numToStr/Comment.nvim", config = function() require "user.comment" end }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "kyazdani42/nvim-tree.lua", config = function() require "user.nvim-tree" end, cmd = {"NvimTreeToggle"} }
    use { "akinsho/bufferline.nvim", config = function() require "user.bufferline" end, event = "BufEnter" }
    use { "moll/vim-bbye" }
    use { "nvim-lualine/lualine.nvim", config = function() require "user.lualine" end }
    use { "akinsho/toggleterm.nvim", config = function() require "user.toggleterm" end }
    use { "lukas-reineke/indent-blankline.nvim", config = function() require "user.indentline" end }
    use { "folke/which-key.nvim", config = function() require "user.which-key" end }
    use { "dstein64/vim-startuptime" }

    -- Colorschemes
    use { "lunarvim/darkplus.nvim" }
    pcall(vim.cmd, "colorscheme " .. "darkplus")

    -- cmp plugins
    use { "hrsh7th/nvim-cmp", -- Completion plugin
        event = "InsertEnter",
        requires = {
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" }, -- buffer completions
            { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }, -- path completions
            { "hrsh7th/cmp-path", after = "nvim-cmp" }, -- snippet completions
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
	    },
        config = function() require "user.cmp" end
    }

    -- snippets
    use { "L3MON4D3/LuaSnip", after = "nvim-cmp" } --snippet engine
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    -- Mason
    use { "williamboman/mason.nvim", config = function() require "user.mason" end } -- Manage lsp, formatter, and dap
    use { "williamboman/mason-lspconfig.nvim" }

    -- LSP
    use { "neovim/nvim-lspconfig", config = function() require "user.lsp" end} -- enable LSP
    use { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig" } -- for formatters and linters
    use { "RRethy/vim-illuminate", config = function() require "user.illuminate" end }

    -- Telescope
    use { "nvim-telescope/telescope.nvim", config = function() require "user.telescope" end, cmd = {"Telescope"} }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", config = function() require "user.treesitter" end }
    use { "p00f/nvim-ts-rainbow" }

    -- Git
    use { "lewis6991/gitsigns.nvim", config = function() require "user.gitsigns" end }

    -- DAP
    use { "mfussenegger/nvim-dap", config = function() require "user.dap" end }
    use { "rcarriga/nvim-dap-ui", after = "nvim-dap" }

    -- R language
    use { "jamespeapen/Nvim-R" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
