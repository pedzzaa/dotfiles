return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "zls",
                "jdtls",
                "pylsp",
                "cssls",
                "html",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                filetypes = { "rust" },
                settings = {
                    ["rust_analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                    },
                },
            })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.zls.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })

            vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
            vim.keymap.set("n", "D", vim.lsp.buf.hover, {})
        end,
    },
}
