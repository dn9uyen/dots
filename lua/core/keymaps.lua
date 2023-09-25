vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- Clear highlight with <esc>
map("n", "<esc>", "<cmd>noh<cr><esc>", { noremap = true, silent = false })

-- Buffer navigation
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- neo-tree
map("n", "\\", "<cmd>Neotree toggle<cr>", { noremap = true, silent = false })
