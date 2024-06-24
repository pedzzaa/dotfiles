vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
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

-- update packages
vim.keymap.set('n', '<leader>p', ':PackerSync<CR>')

-- center and go to end
vim.keymap.set('n', 'G', 'Gzz')

-- clear search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- sets leader + w to change window instead of ctrl + w + w
vim.api.nvim_set_keymap('n', '<leader>w', '<C-W>w', { noremap = true, silent = true })

