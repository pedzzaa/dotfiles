return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
    keys = {
      vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal left<CR>", {}),
    },
  },
}
