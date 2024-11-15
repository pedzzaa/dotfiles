-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Spawn stuff
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")       -- spawn lazy
vim.keymap.set("n", "<leader>db", ":Dashboard<CR>") -- go to dashboard
vim.keymap.set("n", "<leader>mm", ":Mason<CR>")     -- spawn mason

-- Basic functionality overriden
vim.keymap.set("n", "G", "Gzz")                                                        -- when you go to the end center the cursor
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")                                    -- clear search
vim.api.nvim_set_keymap("n", "<leader>w", "<C-W>w", { noremap = true, silent = true }) -- Change window

-- Hardcore mode: DISABLE arrow keys except command mode
vim.keymap.set({ "n", "v", "i" }, "<left>", "<cmd>echo 'Use h to move!'<CR>")
vim.keymap.set({ "n", "v", "i" }, "<right>", "<cmd>echo 'Use l to move!'<CR>")
vim.keymap.set({ "n", "v", "i" }, "<down>", "<cmd>echo 'Use j to move!'<CR>")
vim.keymap.set({ "n", "v", "i" }, "<up>", "<cmd>echo 'Use k to move!'<CR>")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the up window" })

-- Stay visual mode while indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left in visual mode" })
