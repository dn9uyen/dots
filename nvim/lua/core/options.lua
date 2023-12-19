local opt = vim.opt

-- Appearance
opt.termguicolors = true -- True color support
opt.pumblend = 10        -- Popup blend
opt.pumheight = 10       -- Maximum number of entries in a popup

opt.autowrite = false
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = { "menu", "menuone", "preview" }
opt.conceallevel = 3          -- Hide * markup for bold and italic
opt.confirm = true            -- Confirm to save changes before exiting modified buffer
opt.cursorline = true         -- Enable highlighting of the current line
opt.expandtab = true          -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"
-- opt.grepprg = "rg --vimgrep"
opt.ignorecase = true      -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3
opt.list = true            -- Show some invisible characters (tabs...
opt.mouse = "a"            -- Enable mouse mode
opt.number = true          -- Print line number
opt.relativenumber = false
opt.scrolloff = 4          -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true      -- Round indent
opt.shiftwidth = 4         -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false       -- Don't show mode since we have a statusline
opt.sidescrolloff = 8      -- Columns of context
opt.signcolumn = "yes"     -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true       -- Don't ignore case with capitals
opt.smartindent = true     -- Insert indents automatically
opt.spell = false
opt.spelllang = { "en_us" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4       -- Number of spaces tabs count for
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
