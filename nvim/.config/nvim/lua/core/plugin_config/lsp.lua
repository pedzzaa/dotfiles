require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls" }
})

local on_attach = function()
    vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'D', vim.lsp.buf.hover, {})
end

local languages = {
    { 'lua_ls', require('lspconfig').lua_ls },
    { 'jdtls', require('lspconfig').jdtls },
    { 'pylsp', require('lspconfig').pylsp },
    { 'tsserver', require('lspconfig').tsserver },
    { 'cssls', require('lspconfig').cssls },
    { 'clangd', require('lspconfig').clangd },
    { 'html', require('lspconfig').html },
    { 'rust_analyzer', require('lspconfig').rust_analyzer },
}

-- Define common options and capabilities
local common_config = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}

local rust_config = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    filetypes = {"rust"},
    settings = {
        ['rust_analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
}

-- Loop over the languages to set up lsp configurations
for _, lang in ipairs(languages) do
    if lang[1] == 'rust_analyzer' then
        lang[2].setup(vim.tbl_extend('force', rust_config, { ensure_installed = { lang[1] } }))
    end

    lang[2].setup(vim.tbl_extend('force', common_config, { ensure_installed = { lang[1] } }))
end
