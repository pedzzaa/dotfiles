vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 4
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs and other various stuff
vim.opt.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- spawn stuff
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
vim.keymap.set("n", "<leader>db", ":Dashboard<CR>")
vim.keymap.set('n', '<leader>mm', ":Mason<CR>")

-- Basic functionality overriden
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.api.nvim_set_keymap("n", "<leader>w", "<C-W>w", { noremap = true, silent = true })
