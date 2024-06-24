local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- My plugins here
  use { "catppuccin/nvim", as = "catppuccin" } -- Neovim theme
  use 'nvim-tree/nvim-tree.lua' -- File manager
  use 'nvim-tree/nvim-web-devicons' -- Some cool icons
  use "nvim-lua/plenary.nvim" -- Some lib that harpoon uses
  use {
      "ThePrimeagen/harpoon", -- For quick file switching
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use 'nvim-lualine/lualine.nvim' -- That arrow like line on bottom
  use 'nvim-treesitter/nvim-treesitter' -- For syntax highlighting
  use 'hrsh7th/nvim-cmp' -- A auto completion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- Engine that provides code snippets to nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Code completion snippet engine 
  use 'saadparwaiz1/cmp_luasnip' -- Completion engine for LuaSnip
  use 'rafamadriz/friendly-snippets' -- For LuaSnip vscode like snippets
  use {
      "folke/which-key.nvim", -- For showing key bindings that are possible
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
      end
  }
  use {'akinsho/toggleterm.nvim', -- Terminal
    tag = '*', config = function()
        require('toggleterm').setup()
  end}
  use { -- LSP plugins
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }
  use { -- Fuzzy file finder
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
