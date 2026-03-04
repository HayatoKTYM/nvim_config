# Neovim Config

モダンで軽量、かつ IDE のような開発体験を目指した Neovim 設定です。主に Python 開発を想定しています。


## 🚀 Features

- **Plugin Management:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **LSP / Autocomplete:** [Mason](https://github.com/williamboman/mason.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- **File Explorer:** [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- **Keybindings:** 効率を重視したカスタム設定

## 🛠 Prerequisites

- Neovim >= 0.10.0 (推奨)

## 📦 Installation

```bash
git clone git@github.com:HayatoKTYM/nvim_config.git ~/.config/nvim
```

## Keybindings

| Action | Keybinding |
| :--- | :--- |
| Toggle File Tree | `<Space> + e` |
| Save | `<Space> + w` |
| Save & Quit | `<Space> + q` |
| Terminal | `<Space> + t` |
| Error Details | `<Space> + d` |
| Next/Prev Error | `]d` / `[d` |
| Window Move | `Alt + h/j/k/l` |

## Structure

```
~/.config/nvim/
├── init.lua          # メイン設定 & LSP設定
├── lazy-lock.json    # プラグインのバージョン固定
└── lua/
    ├── plugins.lua   # プラグインリスト
    └── keymaps.lua   # キーバインド設定
```


