-- Fix highlights
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#8ec07c", bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#cc241d", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#cc241d", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#fabd2f", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#83a598", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#8ec07c", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#b8bb26", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#8ec07c", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#fb4934", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#b8bb26", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNR", { fg = "#fabd2f", bg = "NONE" })
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#8f8271", bg = "NONE" })

-- Diagnostic icons
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.fillchars = "fold: "
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
vim.opt.foldenable = false

-- Keymapping
local keymap = vim.keymap.set
local opts = { silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-w>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
