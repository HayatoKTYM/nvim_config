-- lua/keymaps.lua

-- リーダーキーをスペースに設定 (まだ設定していなければ)
vim.g.mapleader = " "

-- nvim-tree の開閉 (Leader + e)
-- <cmd> を使うとコマンドモードを経由せず実行できるので高速です
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "ファイルツリーを開閉" })

-- 現在開いているファイルをツリーで見つける (Leader + f)
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = "現在のファイルを探す" })

-- 便利な移動系を追加しておこう
-- 左右のウィンドウ移動を楽にする
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- 保存して終了 (Leader + q)
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true, desc = "保存して終了" })
vim.keymap.set('n', '<leader>q', '<cmd>wq<CR>', { noremap = true, silent = true, desc = "保存して終了" })
vim.keymap.set('n', '<leader>t', '<cmd>vsp | term<CR>', { noremap = true, silent = true, desc = "ターミナルを起動" })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "ターミナルから脱出" })
