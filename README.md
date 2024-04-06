<p align="center">
  <img width="180" src="https://github.com/hardhackerlabs/themes/raw/master/media/logo/logo.png" alt="HardHacker">
</p>

<h1 align="center">
  HardHacker Theme for VIM
</h1>

Supported Vim, MacVim and NeoVim.

Since Vim only supports 256 colors, there will be some color differences with Gui Vim, especially in the background color. For best results, it is recommended to use MacVim, NeoVim or other Gui Vim.

![](./media/preview.jpeg)

## 256-COLORS Palette

| Palette    | XtermNum | Hex     |
| ---------- | -------- | ------- |
| Background | 235      | #262626 |
| Foreground | 255      | #eeeeee |
| Selection  | 238      | #444444 |
| Comment    | 243      | #767676 |
| Red        | 205      | #ff5faf |
| Green      | 157      | #afffaf |
| Yellow     | 227      | #ffff5f |
| Blue       | 153      | #afd7ff |
| Purple     | 219      | #ffafff |
| Cyan       | 123      | #87ffff |

## Install

### Using Git

```bash
git clone https://github.com/hardhackerlabs/theme-vim.git
cp theme-vim/colors/hardhacker.vim  ~/.vim/colors/
```

### Using Vundle

```vim
Plugin 'hardhackerlabs/theme-vim', { 'name': 'hardhacker' }
```

### Using Plug

```vim
Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker' }
```

### Using Lazy.nvim (for neovim user)

If you're using neovim, you can use [lazy.nvim](https://github.com/folke/lazy.nvim) too

```lua
{
  "hardhackerlabs/theme-vim",
  name = "hardhacker",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.hardhacker_hide_tilde = 1
    vim.g.hardhacker_keyword_italic = 1
    -- custom highlights
    vim.g.hardhacker_custom_highlights = {}
    require"hardhacker"
    vim.cmd("colorscheme hardhacker")
  end,
},
```

### Using Packer.nvim

```lua
use {'hardhackerlabs/theme-vim',  as = 'hardhacker'}
```

## Setup

Add the following configuration to the `~/.vimrc` or `~/.config/nvim/init.vim` file, then restart Vim or Neovim.

```vim
syntax      enable
syntax      on
set         t_Co=256
colorscheme hardhacker
```

### Plugins with extra support

- Gitgutter (let g:skip_gitgutter_theme
- Gitsigns (nvim > 0.5, let g:skip_gitsigns_theme = 1 to skip)
- Bufferline (let g:skip_bufferline_theme = 1 to skip)
- Telescope (let g:skip_telescope_theme = 1 to skip)
- Neotree (let g:skip_neotree_theme = 1 to skip)
- Dashboard-nvim (let g:skip_dashboard_nvim_theme = 1 to skip)
- Nvim-cmp (let g:skip_nvim_cmp_theme = 1 to skip)
- Aerial (let g:skip_aerial_theme = 1 to skip)
- Noice (let g:skip_noice_theme = 1 to skip)
- Toggleterm (let g:skip_toggleterm_theme = 1 to skip)
- Null-ls (let g:skip_null_ls_theme = 1 to skip)
- Tree-sitter highlights (let g:skip_treesitter_highlights_theme = 1 to skip)
- LSP Semantic Token Groups (let g:skip_lsp_semantic_token_groups_theme = 1 to skip)
