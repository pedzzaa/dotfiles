require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "asm", 
                       "c",
                       "cpp",
                       "java",
                       "javascript",
                       "python",
                       "html",
                       "css",
                       "rust",
                       "lua",
                       "vim",
                       "vimdoc",
                       "query",
                       "zig" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}
