-- ~/.config/nvim/init.lua

-- 1. lazy.nvim のブートストラップ（本体のインストール）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", -- 【修正済】ここが正しいURLです！
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. 設定（以前の set.lua の内容をここに統合）
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- 3. プラグインの読み込み
require("lazy").setup("plugins")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Pyright の新しい設定方法
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  root_markers = { "pyproject.toml", "setup.py", ".git" },
  capabilities = capabilities,
})
vim.lsp.enable("pyright")

-- Ruff の新しい設定方法
vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  capabilities = capablities,
})
vim.lsp.enable("ruff")

-- エラー詳細をポップアップで表示するキー設定
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "エラー詳細を表示" })

-- エラー箇所へジャンプするキー設定
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "前のエラーへ" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "次のエラーへ" })

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(), -- Tabキーで次の候補へ
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enterキーで確定
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSPの解析結果を優先
    { name = 'luasnip' },  -- スニペットを候補に出す
  }),
})

-- 4. キーバインドの読み込み
require("keymaps")
