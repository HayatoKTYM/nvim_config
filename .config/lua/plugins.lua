-- plugins.lua
return {
  -- 1. catppuccin: 今一番人気のモダンなテーマ
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- 2. nvim-tree: 左側にファイルツリーを表示する
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  -- 【追加】LSP系プラグイン
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },

  -- 【追加】入力補完系プラグイン
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },             -- スニペット（コードの雛形）を表示するやつ
  { "saadparwaiz1/cmp_luasnip" },     -- LuaSnipと補完を連携させるやつ
}
