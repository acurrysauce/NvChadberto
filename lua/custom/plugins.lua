local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig", -- install language server
    config = function ()
      require "plugins.configs.lspconfig"  -- lua file that has config in it
      require "custom.configs.lspconfig"  -- lua file that has config in it
    end,
  },
  {
    "rust-lang/rust.vim", -- install auto formatting
    ft = "rust", -- only for rust language
    init = function ()
      vim.g.rustfmt_autosave = 1 -- auto format on save
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",  -- load rust tools after lspconfig
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)  -- pipe the lspconfig on_attach and capabilities to rust tools
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp", -- even though this is part of core - we can still include it
    opts = function()
      local M = require "plugins.configs.cmp" -- get the core cmp config
      table.insert(M.sources, {name = "crates"}) -- add crates to the sources
      return M -- return the config back to cmp
    end,
  }
}
return plugins
