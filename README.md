# My Neovim Configurations

Based on [flake-parts](https://github.com/hercules-ci/flake-parts) and Gerg-L's [Minimal Neovim Wrapper](https://github.com/Gerg-L/mnw).


## Features

- Installs plugins using [Nix](https://nixos.org/guides/how-nix-works).
- Falls back to [Paq](https://github.com/savq/paq-nvim), a minimal Neovim package manager written in Lua, when Nix is unavailable.
- Loads plugins lazily via [lz-n](https://github.com/lumen-oss/lz.n).


## Plugins

- blink-cmp
- catppuccin (colorscheme)
- conform
- friendly-snippets
- gitsigns
- lazydev
- lualine
- nvim-lint
- nvim-lspconfig
- nvim-treesitter
- nvim-web-devicons
- oil
- plenary
- telescope-fzf-native
- telescope
- which-key


## TODO

- [x] Add optional plugins to Paq bootstrapping code
- [ ] Add plugins descriptions to README
- [ ] Install C/C++, Rust, and Elixir language servers/formatters/linters via Nix

### Plugins

- [ ] nvim-treesitter-\*
- [ ] nvim-dap
- [ ] vim-fugitive
- [ ] vim-surround
- [ ] mini.nvim
    - [ ] mini.surround
    - [ ] mini.ai
