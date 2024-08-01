vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs and other various stuff
vim.opt.tabstop = 2
vim.o.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- spawn stuff
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
vim.keymap.set("n", "<leader>dd", ":Dashboard<CR>")

-- center and go to end
vim.keymap.set("n", "G", "Gzz")

-- clear search
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- sets leader + w to change window instead of ctrl + w + w
vim.api.nvim_set_keymap("n", "<leader>w", "<C-W>w", { noremap = true, silent = true })
