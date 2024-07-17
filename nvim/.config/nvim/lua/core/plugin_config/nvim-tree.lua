vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '+', api.tree.change_root_to_node)
end

require('nvim-tree').setup({
    on_attach = my_on_attach,
})

vim.keymap.set('n', '<M-f>', ':NvimTreeFindFileToggle<CR>')
